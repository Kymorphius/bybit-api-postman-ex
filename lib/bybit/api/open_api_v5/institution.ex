defmodule Bybit.API.OpenApiV5.Institution do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_institution_ip_change_log_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Institution IP Change Log
  Method: GET
  Path: /v5/ins/ip/changelog
  Requires signature: false
  Optional: startTime, endTime, limit, cursor
  """
  def get_institution_ip_change_log_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/ins/ip/changelog",
          query: [
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_institution_whitelist_ip_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Institution Whitelist IP
  Method: GET
  Path: /v5/ins/whitelist/ip
  Requires signature: false
  """
  def get_institution_whitelist_ip_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/ins/whitelist/ip",
          query: [],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
