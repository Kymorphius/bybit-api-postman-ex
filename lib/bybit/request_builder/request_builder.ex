defmodule Bybit.RequestBuilder do
  @moduledoc false

  require Logger

  alias Bybit.REST.Request

  def new(attrs) when is_map(attrs) do
    struct(Request, attrs)
  end

  def build(attrs) when is_map(attrs) do
    with {:ok, attrs} <- validate_required_attrs(attrs),
         attrs <- normalize_attrs(attrs),
         attrs <- auto_complete_request(attrs),
         attrs <- prune_request(attrs),
         attrs <- put_url(attrs),
         request <- to_request(attrs) do
      tap(request, fn request ->
        Logger.debug(fn -> "builder_url: #{inspect(request.url)}" end)
        Logger.debug(fn -> "builder_headers: #{inspect(request.headers)}" end)
        Logger.debug(fn -> "builder_body: #{inspect(request.body)}" end)
      end)
      |> then(&{:ok, &1})
    else
      {:error, reason} -> {:error, {:request_error, reason}}
    end
  end

  def normalize_attrs(attrs) when is_map(attrs) do
    attrs
    |> Map.put(:headers, normalize_headers(Map.get(attrs, :headers)))
    |> Map.put(:query, normalize_params(Map.get(attrs, :query)))
    |> Map.put(:body, normalize_body(Map.get(attrs, :body)))
  end

  def auto_complete_request(attrs) when is_map(attrs) do
    attrs
    |> maybe_fill_recv_window()
    |> maybe_fill_timestamp()
    |> maybe_sign_request()
  end

  def prune_request(attrs) when is_map(attrs) do
    Map.update!(attrs, :headers, &prune_nil_values/1)
  end

  def put_url(attrs) when is_map(attrs) do
    Map.put(attrs, :url, build_url(attrs))
  end

  def to_request(attrs) when is_map(attrs) do
    struct(Request, Map.take(attrs, [:method, :url, :headers, :body]))
  end

  defp validate_required_attrs(%{method: method, url: url} = attrs)
       when not is_nil(method) and not is_nil(url), do: {:ok, attrs}

  defp validate_required_attrs(%{method: nil}), do: {:error, :missing_method}
  defp validate_required_attrs(%{url: nil}), do: {:error, :missing_url}
  defp validate_required_attrs(_), do: {:error, :missing_required_request_fields}

  defp normalize_headers(nil), do: []
  defp normalize_headers(headers) when is_list(headers), do: Enum.map(headers, &normalize_pair/1)

  defp normalize_headers(headers) when is_map(headers),
    do: Enum.map(Map.to_list(headers), &normalize_pair/1)

  defp normalize_headers(headers), do: Enum.map(List.wrap(headers), &normalize_pair/1)

  defp maybe_fill_recv_window(%{requires_signature?: true} = request) do
    put_header(request, "X-BAPI-RECV-WINDOW", "5000")
  end

  defp maybe_fill_recv_window(request), do: request

  defp maybe_fill_timestamp(%{requires_signature?: true} = request) do
    put_header(request, "X-BAPI-TIMESTAMP", System.system_time(:millisecond))
  end

  defp maybe_fill_timestamp(request), do: request

  defp maybe_sign_request(%{requires_signature?: true, client: client} = request) do
    api_key = client && client.api_key
    api_secret = client && client.api_secret

    timestamp =
      request.headers |> Keyword.fetch!(normalize_key("X-BAPI-TIMESTAMP")) |> to_string()

    recv_window =
      request.headers |> Keyword.fetch!(normalize_key("X-BAPI-RECV-WINDOW")) |> to_string()

    payload = signature_payload(request)
    signature = sign_payload(timestamp <> api_key <> recv_window <> payload, api_secret)

    request
    |> put_header("X-BAPI-API-KEY", api_key)
    |> put_header("X-BAPI-TIMESTAMP", timestamp)
    |> put_header("X-BAPI-RECV-WINDOW", recv_window)
    |> put_header("X-BAPI-SIGN", signature)
  end

  defp maybe_sign_request(request), do: request

  defp normalize_params(nil), do: []
  defp normalize_params(list) when is_list(list), do: Enum.map(list, &normalize_pair/1)
  defp normalize_params(map) when is_map(map), do: Enum.map(Map.to_list(map), &normalize_pair/1)
  defp normalize_params(other), do: Enum.map(List.wrap(other), &normalize_pair/1)

  defp normalize_pair({key, value}), do: {normalize_key(key), value}
  defp normalize_pair(%{key: key, value: value}), do: {normalize_key(key), value}
  defp normalize_pair(other), do: other

  defp normalize_key(key) when is_binary(key), do: String.to_atom(key)
  defp normalize_key(key), do: key

  defp prune_nil_values(keyword) when is_list(keyword) do
    Enum.reject(keyword, fn {_key, value} -> is_nil(value) end)
  end

  defp normalize_body(nil), do: []
  defp normalize_body(list) when is_list(list), do: Enum.map(list, &normalize_pair/1)
  defp normalize_body(map) when is_map(map), do: Enum.map(Map.to_list(map), &normalize_pair/1)
  defp normalize_body(other), do: Enum.map(List.wrap(other), &normalize_pair/1)

  defp put_header(%{headers: headers} = request, key, value) do
    headers = normalize_headers(headers)
    key = normalize_key(key)

    Map.put(request, :headers, Keyword.put(headers, key, value))
  end

  defp build_url(%{base_url: base_url, url: url, query: query} = request) do
    endpoint_url = base_url <> url
    query_string = build_query_string(request, query)

    case query_string do
      "" -> endpoint_url
      _ -> endpoint_url <> "?" <> query_string
    end
  end

  defp build_query_string(_request, params) do
    params
    |> prune_nil_values()
    |> encode_query_string()
  end

  defp encode_query_string(params) do
    Logger.debug(fn -> "encode_query_string_params: #{inspect(params)}" end)

    params
    |> Enum.reject(fn {_key, value} -> is_nil(value) end)
    |> Enum.map_join("&", fn {key, value} ->
      "#{key}=#{value |> normalize_query_value() |> URI.encode_www_form()}"
    end)
  end

  defp normalize_query_value(value) when is_binary(value), do: value
  defp normalize_query_value(value) when is_integer(value), do: Integer.to_string(value)

  defp normalize_query_value(value) when is_float(value),
    do: :erlang.float_to_binary(value, [:compact, decimals: 16])

  defp normalize_query_value(value) when is_atom(value), do: Atom.to_string(value)
  defp normalize_query_value(value), do: to_string(value)

  defp signature_payload(%{method: method, body: body, query: query}) do
    case String.upcase(to_string(method)) do
      "GET" -> encode_query_string(query)
      _ -> raw_body_payload(body)
    end
  end

  defp raw_body_payload(body) when is_list(body) do
    case Keyword.get(body, :mode) do
      "raw" -> body |> Keyword.get(:raw, "") |> normalize_raw_body()
      _ -> ""
    end
  end

  defp raw_body_payload(_body), do: ""

  defp normalize_raw_body(value) when is_binary(value), do: value
  defp normalize_raw_body(value) when is_map(value), do: Jason.encode!(value)
  defp normalize_raw_body(value) when is_list(value), do: Jason.encode!(value)
  defp normalize_raw_body(nil), do: ""
  defp normalize_raw_body(value), do: to_string(value)

  defp sign_payload(payload, secret) do
    :crypto.mac(:hmac, :sha256, secret, payload)
    |> Base.encode16(case: :lower)
  end
end
