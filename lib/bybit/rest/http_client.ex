defmodule Bybit.REST.HTTPClient do
  @moduledoc false

  require Logger

  alias Bybit.REST.Request

  def request(%Request{} = request) do
    request
    |> validate_request()
    |> maybe_send()
  end

  defp validate_request(%Request{method: nil}), do: {:error, {:request_error, :missing_method}}
  defp validate_request(%Request{url: nil}), do: {:error, {:request_error, :missing_url}}

  defp validate_request(%Request{headers: headers})
       when not is_list(headers) and not is_map(headers) do
    {:error, {:request_error, :invalid_headers}}
  end

  defp validate_request(request), do: {:ok, request}

  defp maybe_send({:ok, request}), do: dispatch(request)
  defp maybe_send({:error, _} = error), do: error

  defp dispatch(%Request{url: url, method: method, headers: headers, body: body}) do
    method = String.downcase(to_string(method))
    headers = normalize_headers(headers)

    form = form_body(body)
    json = json_body(body)
    raw = raw_body(body)

    Logger.debug(fn -> "http_url: #{inspect(url)}" end)
    Logger.debug(fn -> "http_headers: #{inspect(headers)}" end)
    Logger.debug(fn -> "http_body: #{inspect(body)}" end)
    Logger.debug(fn -> "http_form: #{inspect(form)}" end)
    Logger.debug(fn -> "http_json: #{inspect(json)}" end)
    Logger.debug(fn -> "http_raw_body: #{inspect(raw)}" end)

    opts =
      [headers: headers] ++
        maybe_put(:form, form) ++ maybe_put(:json, json) ++ maybe_put(:body, raw)

    result =
      case method do
        "get" -> Req.get(url, opts)
        "post" -> Req.post(url, opts)
        "put" -> Req.put(url, opts)
        "delete" -> Req.delete(url, opts)
        _ -> {:error, {:request_error, :unsupported_method}}
      end

    normalize_response(result)
  rescue
    exception -> {:error, {:transport_error, {:exception, exception}}}
  end

  defp maybe_put(_key, nil), do: []
  defp maybe_put(key, value), do: [{key, value}]

  defp form_body(body) when is_list(body) do
    case Keyword.get(body, :mode) do
      "urlencoded" ->
        case Keyword.get(body, :urlencoded) do
          [] -> nil
          nil -> nil
          urlencoded -> urlencoded
        end

      _ ->
        nil
    end
  end

  defp form_body(_), do: nil

  defp json_body(body) when is_list(body) do
    case Keyword.get(body, :mode) do
      _ ->
        nil
    end
  end

  defp json_body(_), do: nil

  defp raw_body(body) when is_list(body) do
    case Keyword.get(body, :mode) do
      "raw" ->
        case Keyword.get(body, :raw) do
          value -> if empty_value?(value), do: nil, else: normalize_raw_body(value)
        end

      _ ->
        nil
    end
  end

  defp raw_body(_), do: nil

  defp empty_value?(value), do: value in [nil, [], %{}, ""]

  defp normalize_raw_body(value) when is_binary(value), do: value
  defp normalize_raw_body(value) when is_map(value), do: Jason.encode!(value)
  defp normalize_raw_body(value) when is_list(value), do: Jason.encode!(value)
  defp normalize_raw_body(value), do: to_string(value)

  defp normalize_headers(headers) when is_list(headers), do: headers
  defp normalize_headers(headers), do: List.wrap(headers)

  defp normalize_response({:ok, %Req.Response{status: status, body: body}})
       when status in 200..299 do
    case body do
      %{"code" => code, "msg" => msg} -> {:error, {:bybit_error, code, msg}}
      _ -> {:ok, body}
    end
  end

  defp normalize_response({:ok, %Req.Response{status: status, body: body}}),
    do: {:error, {:http_error, status, body}}

  defp normalize_response({:error, reason}),
    do: {:error, {:transport_error, {:req_error, reason}}}
end
