defmodule Bybit.API.OpenApiV5.InstitutionalLoan do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_ltv(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get LTV
  Method: GET
  Path: /v5/ins-loan/ltv
  Requires signature: true
  """
  def get_ltv(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/ins-loan/ltv",
          query: [],
          headers: [
            {"X-BAPI-SIGN-TYPE", "2"},
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec bind_or_unbind_uid(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Bind Or Unbind UID
  Method: POST
  Path: /v5/ins-loan/association-uid
  Requires signature: true
  """
  def bind_or_unbind_uid(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/ins-loan/association-uid",
          query: [],
          headers: [
            {"X-BAPI-SIGN-TYPE", "2"},
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(opts, :body, "{\n    \"uid\": \"592324\",\n    \"operate\": \"0\"\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
