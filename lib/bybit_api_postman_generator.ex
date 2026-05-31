defmodule BybitApiPostmanGenerator do
  @moduledoc """
  Generates raw API Elixir files from Bybit Postman collections.
  """

  alias BybitApiPostmanEx
  alias BybitApiPostmanRepoMapper

  def generate_file(collection_path) do
    items = BybitApiPostmanEx.parse_collection_file(collection_path)

    case items do
      [%{collection_name: collection_name} | _] ->
        output_dir = BybitApiPostmanRepoMapper.collection_dir(collection_name)
        File.rm_rf!(output_dir)

      _ ->
        :ok
    end

    items
    |> Enum.group_by(fn %{collection_name: collection_name, folder_path: [folder_name | _]} ->
      {
        BybitApiPostmanRepoMapper.collection_dir(collection_name),
        BybitApiPostmanRepoMapper.folder_file_name(folder_name),
        BybitApiPostmanRepoMapper.module_name(collection_name, folder_name)
      }
    end)
    |> Enum.each(fn {{output_dir, file_name, module_name}, grouped_items} ->
      generate_group(output_dir, file_name, module_name, grouped_items)
    end)
  end

  def generate_group(output_dir, file_name, module_name, items) do
    File.mkdir_p!(output_dir)

    collection_variables = items |> List.first() |> Map.get(:collection_variables, %{})
    base_urls = base_urls(collection_variables)

    name_plan = plan_function_names(items, collection_variables)

    content =
      items
      |> Enum.map(fn item ->
        {rendered, _fun_name} =
          render_function(item, collection_variables, Map.get(name_plan, item))

        rendered
      end)

    content = Enum.join(content, "\n\n")

    file_content = """
    defmodule #{module_name} do
      @moduledoc false

      @base_urls #{inspect(base_urls, limit: :infinity, printable_limit: :infinity, width: :infinity)}

      def base_url(key \\\\ :prod_url) do
        case Map.fetch(@base_urls, key) do
          {:ok, url} -> {:ok, url}
          :error -> {:error, {:unsupported_env, key}}
        end
      end

    #{indent(content, 2)}
    end
    """

    output_path = Path.join(output_dir, file_name)

    formatted_content =
      file_content
      |> String.trim()
      |> Code.format_string!()
      |> IO.iodata_to_binary()
      |> Kernel.<>("\n")

    File.write!(output_path, formatted_content)
  end

  defp render_function(
         %{name: name, request: request, requires_signature?: requires_signature?},
         collection_variables,
         fun_name
       ) do
    {required_query_params, optional_query_params, _} =
      split_params_with_env(request.query, collection_variables)

    {required_body_params, optional_body_params, _} =
      split_params_with_env((request.body && request.body.urlencoded) || [], collection_variables)

    required_args =
      Enum.map(
        required_query_params ++ required_body_params,
        &Macro.var(String.to_atom(&1.key), nil)
      )

    has_optional_args? =
      optional_query_params ++ optional_body_params != [] or raw_body?(request.body)

    args_str =
      [
        Enum.map_join(required_args, ", ", &Macro.to_string/1),
        if(has_optional_args?, do: "opts \\\\ []", else: nil)
      ]
      |> Enum.reject(&is_nil/1)
      |> Enum.reject(&(&1 == ""))
      |> Enum.join(", ")
      |> then(fn
        "" -> "client"
        other -> Enum.join(["client", other], ", ")
      end)

    body =
      build_function_body(
        required_query_params,
        optional_query_params,
        required_body_params,
        optional_body_params,
        request,
        requires_signature?
      )

    doc =
      build_function_doc(
        name,
        request,
        requires_signature?,
        required_query_params,
        optional_query_params,
        required_body_params,
        optional_body_params
      )

    spec =
      build_function_spec(
        fun_name,
        required_query_params,
        optional_query_params,
        required_body_params,
        optional_body_params,
        raw_body?(request.body)
      )

    """
    #{spec}
    @doc \"\"\"
    #{doc}
    \"\"\"
    def #{fun_name}(#{args_str}) do
    #{indent(body, 2)}
    end
    """
    |> String.trim()
    |> then(&{&1, fun_name})
  end

  defp build_function_doc(
         name,
         request,
         requires_signature?,
         required_query_params,
         optional_query_params,
         required_body_params,
         optional_body_params
       ) do
    title = strip_paren_tags(name)
    tags = extract_paren_tags(name)
    variant = extract_variant_tag(name)

    required = Enum.map_join(required_query_params ++ required_body_params, ", ", & &1.key)
    optional = Enum.map_join(optional_query_params ++ optional_body_params, ", ", & &1.key)

    [
      title,
      doc_line("Variant", variant, variant != nil),
      doc_line("Tags", Enum.join(tags, ", "), tags != []),
      "Method: #{request.method}",
      "Path: #{request.url}",
      "Requires signature: #{requires_signature?}",
      doc_line("Required", required, required != ""),
      doc_line("Optional", optional, optional != "")
    ]
    |> Enum.reject(&is_nil/1)
    |> Enum.join("\n")
  end

  defp doc_line(_label, _value, false), do: nil
  defp doc_line(label, value, true), do: "#{label}: #{value}"

  defp strip_paren_tags(name) do
    name
    |> String.replace(~r/\s*\(.*?\)\s*/u, " ")
    |> String.replace(~r/\s+/u, " ")
    |> String.trim()
  end

  defp extract_paren_tags(name) do
    Regex.scan(~r/\((.*?)\)/u, name)
    |> Enum.map(fn [_full, tag] -> sanitize_suffix(tag) end)
    |> Enum.reject(&(&1 == ""))
  end

  defp extract_variant_tag(name) do
    name
    |> extract_paren_tags()
    |> List.last()
    |> case do
      nil -> nil
      tag -> variant_label(tag)
    end
  end

  defp variant_label(tag) do
    tag
    |> String.replace("_", " ")
    |> String.split()
    |> Enum.map_join(" ", &String.capitalize/1)
  end

  defp split_params_with_env(params, _collection_variables) do
    {required_params, optional_params} = Enum.split_with(params, &(!&1.disabled))
    required_params = filter_system_params(required_params)
    optional_params = filter_system_params(optional_params)

    {required_params, optional_params, true}
  end

  defp filter_system_params(params) do
    Enum.reject(params, fn param -> system_param?(param.key) end)
  end

  defp system_param?(key) when is_atom(key), do: system_param?(Atom.to_string(key))
  defp system_param?(key) when is_binary(key), do: key in ["timestamp", "signature"]
  defp system_param?(_), do: false

  defp build_function_spec(
         fun_name,
         required_query_params,
         optional_query_params,
         required_body_params,
         optional_body_params,
         raw_body?
       ) do
    required_args = Enum.map(required_query_params ++ required_body_params, &param_spec_type/1)
    optional_args = Enum.map(optional_query_params ++ optional_body_params, &param_spec_type/1)

    params =
      ["Bybit.Client.t()"] ++
        required_args ++ if(optional_args == [] and not raw_body?, do: [], else: ["Keyword.t()"])

    "@spec #{fun_name}(#{Enum.join(params, ", ")}) :: {:ok, term()} | {:error, term()}"
  end

  defp param_spec_type(_param), do: "term()"

  defp build_function_body(
         required_query_params,
         optional_query_params,
         required_body_params,
         optional_body_params,
         request,
         requires_signature?
       ) do
    query =
      build_query(
        request.query,
        required_query_params ++ optional_query_params,
        optional_query_params
      )

    body = build_body(request.body, required_body_params, optional_body_params)
    headers = build_headers(request.headers)

    """
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: #{inspect(requires_signature?, limit: :infinity, printable_limit: :infinity, width: :infinity)},
          method: #{inspect(request.method, limit: :infinity, printable_limit: :infinity, width: :infinity)},
          base_url: base_url,
          url: #{inspect(request.url, limit: :infinity, printable_limit: :infinity, width: :infinity)},
          query: #{query},
          headers: #{headers},
          body: #{body}
        })

      Bybit.REST.HTTPClient.request(request)
    end
    """
    |> String.trim()
  end

  defp build_body(nil, _required_params, _optional_params), do: "nil"

  defp build_body(%{mode: "urlencoded"}, required_params, optional_params) do
    body_params = build_body_params(required_params, optional_params)

    case body_params do
      "" ->
        "nil"

      _ ->
        """
        %{mode: "urlencoded", urlencoded: #{body_params}}
        """
        |> String.trim()
    end
  end

  defp build_body(%{mode: "raw", raw: raw}, _required_params, _optional_params) do
    raw = raw || ""

    """
    %{mode: "raw", raw: Keyword.get(opts, :body, #{inspect(raw, limit: :infinity, printable_limit: :infinity, width: :infinity)})}
    """
    |> String.trim()
  end

  defp build_body(_body, _required_params, _optional_params), do: "nil"

  defp raw_body?(%{mode: "raw"}), do: true
  defp raw_body?(_), do: false

  defp build_headers(headers) do
    headers
    |> Enum.reject(& &1.disabled)
    |> Enum.reject(&bybit_auth_header?(&1.key))
    |> Enum.map(fn header ->
      value =
        inspect(header.value, limit: :infinity, printable_limit: :infinity, width: :infinity)

      "{#{inspect(header.key, limit: :infinity, printable_limit: :infinity, width: :infinity)}, #{value}}"
    end)
    |> then(&"[#{Enum.join(&1, ", ")}]")
  end

  defp bybit_auth_header?(key) do
    key
    |> to_string()
    |> String.upcase()
    |> then(&(&1 in ["X-BAPI-SIGN", "X-BAPI-API-KEY", "X-BAPI-TIMESTAMP", "X-BAPI-RECV-WINDOW"]))
  end

  defp build_body_params(required_params, optional_params) do
    required_map =
      Map.new(required_params, fn param ->
        {param.key, Macro.var(String.to_atom(param.key), nil)}
      end)

    optional_keys = MapSet.new(Enum.map(optional_params, & &1.key))

    (required_params ++ optional_params)
    |> Enum.map(fn param ->
      key = param.key
      var = Map.get(required_map, key, Macro.var(String.to_atom(key), nil))

      if MapSet.member?(optional_keys, key) do
        "#{key}: Keyword.get(opts, :#{key})"
      else
        "#{key}: #{Macro.to_string(var)}"
      end
    end)
    |> then(&"[#{Enum.join(&1, ", ")}]")
  end

  defp build_query(request_query, required_params, optional_params) do
    required_map =
      Map.new(required_params, fn param ->
        {param.key, Macro.var(String.to_atom(param.key), nil)}
      end)

    optional_keys = MapSet.new(Enum.map(optional_params, & &1.key))

    request_query
    |> Enum.reject(fn param -> param.key == "signature" end)
    |> Enum.map(fn param ->
      key = param.key

      case key do
        "timestamp" ->
          "timestamp: nil"

        _ ->
          var = Map.get(required_map, key, Macro.var(String.to_atom(key), nil))

          if MapSet.member?(optional_keys, key) do
            "#{key}: Keyword.get(opts, :#{key})"
          else
            "#{key}: #{Macro.to_string(var)}"
          end
      end
    end)
    |> Enum.join(", ")
    |> then(&"[#{&1}]")
  end

  defp base_urls(collection_variables) do
    collection_variables
    |> Enum.reduce(%{}, fn {key, value}, acc ->
      Map.put(acc, String.to_atom(key), value)
    end)
    |> case do
      urls when map_size(urls) == 0 ->
        %{
          prod_url: "https://api.bybit.com",
          testnet_url: "https://api-testnet.bybit.com"
        }

      %{} = urls ->
        urls
        |> maybe_rename_url()
        |> Map.put_new(:prod_url, Map.get(urls, :prod_url, Map.values(urls) |> List.first()))
    end
  end

  defp maybe_rename_url(%{url: url} = urls), do: urls |> Map.put_new(:prod_url, url)
  defp maybe_rename_url(urls), do: urls

  defp plan_function_names(items, collection_variables) do
    name_infos =
      Enum.map(items, fn item ->
        {required_params, optional_params, _} =
          split_params_with_env(item.request.query, collection_variables)

        params = required_params ++ optional_params
        candidate = sanitize_function_name(item.name, item.request.url, params)
        fallback = sanitize_function_name_keep_tags(item.name, item.request.url)

        %{
          item: item,
          params: params,
          candidate: candidate,
          fallback: fallback,
          path_fallback: sanitize_function_name_with_path(item.name, item.request.url)
        }
      end)

    collisions =
      name_infos
      |> Enum.group_by(& &1.candidate)
      |> Map.new(fn {name, infos} -> {name, length(infos) > 1} end)

    chosen =
      Enum.map(name_infos, fn info ->
        chosen =
          if Map.get(collisions, info.candidate, false) do
            info.path_fallback
          else
            info.candidate
          end

        {info, chosen}
      end)

    duplicate_names =
      chosen
      |> Enum.group_by(fn {_info, name} -> name end)
      |> Enum.filter(fn {_name, infos} -> length(infos) > 1 end)
      |> Map.new(fn {name, _infos} -> {name, true} end)

    chosen
    |> Enum.with_index(1)
    |> Enum.reduce(%{}, fn {{info, name}, index}, acc ->
      name = if Map.get(duplicate_names, name, false), do: "#{info.fallback}_#{index}", else: name
      Map.put(acc, info.item, name)
    end)
  end

  defp sanitize_function_name(name, url, params) do
    {base_name, tags} = split_function_name(name)
    version_suffix = extract_version_suffix(url)

    candidates = build_function_name_candidates(base_name, tags, version_suffix)

    choose_best_name(candidates, params)
    |> String.replace(~r/_+/u, "_")
    |> String.trim("_")
    |> maybe_prefix_numeric()
  end

  defp sanitize_function_name_keep_tags(name, url) do
    {base_name, tags} = split_function_name(name)
    version_suffix = extract_version_suffix(url)

    join_parts([base_name | tags])
    |> append_version_suffix(version_suffix)
    |> String.replace(~r/_+/u, "_")
    |> String.trim("_")
    |> maybe_prefix_numeric()
  end

  defp sanitize_function_name_with_path(name, url) do
    {base_name, tags} = split_function_name(name)

    path_suffix =
      (url || "")
      |> String.split("/", trim: true)
      |> Enum.reject(&String.starts_with?(&1, "v"))
      |> Enum.take(-2)
      |> Enum.join("_")
      |> sanitize_suffix()

    join_parts([base_name | tags] ++ [path_suffix])
    |> String.replace(~r/_+/u, "_")
    |> String.trim("_")
    |> maybe_prefix_numeric()
  end

  defp build_function_name_candidates(base_name, tags, version_suffix) do
    base_with_version = append_version_suffix(base_name, version_suffix)
    tagged_with_version = append_version_suffix(join_parts([base_name | tags]), version_suffix)

    [base_with_version, tagged_with_version]
    |> Enum.reject(&is_nil/1)
    |> Enum.reject(&(&1 == ""))
    |> Enum.uniq()
  end

  defp choose_best_name([single], _params), do: single

  defp choose_best_name(candidates, params) do
    Enum.find(candidates, fn candidate ->
      not function_name_collision?(candidate, params)
    end) || List.first(candidates)
  end

  defp function_name_collision?(candidate, params) do
    Enum.any?(params, fn param ->
      candidate == param.key or String.contains?(candidate, "#{param.key}_")
    end)
  end

  defp append_version_suffix(name, nil), do: name

  defp append_version_suffix(name, version_suffix) do
    if String.ends_with?(name, "_#{version_suffix}") or name == version_suffix do
      name
    else
      name <> "_" <> version_suffix
    end
  end

  defp split_function_name(name) do
    base_name =
      name
      |> String.downcase()
      |> String.replace(~r/\(.*?\)/u, "")
      |> String.replace(~r/[^a-z0-9]+/u, "_")
      |> String.replace(~r/_+/u, "_")
      |> String.trim("_")

    tags =
      extract_paren_tags(name)
      |> Enum.reject(&ignored_tag?/1)

    {base_name, tags}
  end

  defp ignored_tag?(tag) do
    tag in ["user_data", "trade", "market_data", "signed"]
  end

  defp join_parts(parts) do
    parts
    |> Enum.reject(&is_nil/1)
    |> Enum.reject(&(&1 == ""))
    |> Enum.join("_")
  end

  defp extract_version_suffix(url) do
    case Regex.run(~r/\/v(\d+)\//u, url || "") do
      [_, version] -> "v#{version}"
      _ -> nil
    end
  end

  defp sanitize_suffix(text) do
    text
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9]+/u, "_")
    |> String.replace(~r/_+/u, "_")
    |> String.trim("_")
  end

  defp maybe_prefix_numeric(<<first::utf8, _rest::binary>> = name) when first in ?0..?9 do
    "x_" <> name
  end

  defp maybe_prefix_numeric(name), do: name

  defp indent(text, spaces) do
    pad = String.duplicate(" ", spaces)

    text
    |> String.split("\n")
    |> Enum.map_join("\n", fn line -> pad <> line end)
  end
end
