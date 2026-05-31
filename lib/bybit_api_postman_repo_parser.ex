defmodule BybitApiPostmanRepoParser do
  @moduledoc """
  Parses Bybit Postman collection exports into normalized API items.
  """

  def parse_collection_file(path) do
    path
    |> File.read!()
    |> Jason.decode!()
    |> parse_collection()
  end

  def parse_collection(%{"item" => items} = collection) do
    collection_name = get_in(collection, ["info", "name"])
    collection_variables = parse_collection_variables(Map.get(collection, "variable", []))

    items
    |> Enum.flat_map(&parse_item(&1, [collection_name], []))
    |> Enum.map(&Map.put(&1, :collection_variables, collection_variables))
  end

  defp parse_item(%{"item" => children, "name" => name}, collection_path, folder_path) do
    Enum.flat_map(children, &parse_item(&1, collection_path, folder_path ++ [name]))
  end

  defp parse_item(%{"name" => name, "request" => request}, collection_path, folder_path) do
    normalized_request = normalize_request(request)
    folder_path = if folder_path == [], do: [hd(collection_path)], else: folder_path

    [
      %{
        collection_name: hd(collection_path),
        collection_path: collection_path,
        folder_path: folder_path,
        name: name,
        request: normalized_request,
        requires_signature?: requires_signature?(normalized_request)
      }
    ]
  end

  defp parse_collection_variables(variables) do
    Enum.reduce(variables, %{}, fn
      %{"key" => key, "value" => value}, acc -> Map.put(acc, key, value)
      _, acc -> acc
    end)
  end

  defp normalize_request(%{"method" => method, "url" => url} = request) do
    %{
      method: method,
      url: path_only_url(url["raw"]),
      query: Enum.map(url["query"] || [], &normalize_query_param/1),
      headers: Enum.map(request["header"] || [], &normalize_header/1),
      body: normalize_body(request["body"])
    }
  end

  defp path_only_url(nil), do: nil

  defp path_only_url(raw_url) do
    raw_url
    |> String.replace(~r/^\{\{[^}]+\}\}/, "")
    |> String.trim()
  end

  defp normalize_query_param(%{"key" => key} = param) do
    %{
      key: key,
      value: param["value"],
      description: param["description"],
      disabled: param["disabled"] || false
    }
  end

  defp normalize_header(%{"key" => key} = header) do
    %{
      key: key,
      value: header["value"],
      description: header["description"],
      disabled: header["disabled"] || false
    }
  end

  defp normalize_body(nil), do: nil

  defp normalize_body(%{"mode" => mode} = body) do
    %{
      mode: mode,
      urlencoded: Enum.map(body["urlencoded"] || [], &normalize_query_param/1),
      raw: body["raw"]
    }
  end

  defp requires_signature?(%{headers: headers}) do
    Enum.any?(headers, fn header ->
      String.upcase(to_string(header.key)) in [
        "X-BAPI-SIGN",
        "X-BAPI-API-KEY",
        "X-BAPI-TIMESTAMP"
      ]
    end)
  end

  defp requires_signature?(%{query: query, body: %{urlencoded: body_params}}) do
    all_params = query ++ body_params

    Enum.any?(all_params, fn param ->
      param.key in ["timestamp", "signature", "api_key", "secret_key"]
    end)
  end

  defp requires_signature?(%{query: query, body: nil}) do
    Enum.any?(query, fn param ->
      param.key in ["timestamp", "signature", "api_key", "secret_key"]
    end)
  end
end
