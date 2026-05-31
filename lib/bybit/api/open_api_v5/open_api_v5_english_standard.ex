defmodule Bybit.API.OpenApiV5.OpenApiV5EnglishStandard do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_announcement(Bybit.Client.t(), term(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Announcement
  Method: GET
  Path: /v5/announcements/index
  Requires signature: true
  Required: locale, page, limit
  Optional: type, tag
  """
  def get_announcement(client, locale, page, limit, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/announcements/index",
          query: [
            locale: locale,
            type: Keyword.get(opts, :type),
            tag: Keyword.get(opts, :tag),
            page: page,
            limit: limit
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec demo_trading_service(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Demo Trading Service
  Method: POST
  Path: /v5/account/demo-apply-money
  Requires signature: true
  """
  def demo_trading_service(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/account/demo-apply-money",
          query: [],
          headers: [
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"adjustType\": 0,\n    \"utaDemoApplyMoney\": [\n        {\n            \"coin\": \"USDT\",\n            \"amountStr\": \"BTC\"\n        }\n    ]\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_system_status(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get System Status
  Method: GET
  Path: /v5/system/status
  Requires signature: true
  Optional: id, state
  """
  def get_system_status(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/system/status",
          query: [id: Keyword.get(opts, :id), state: Keyword.get(opts, :state)],
          headers: [
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

  @spec sign_agreement(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Sign Agreement
  Method: POST
  Path: /v5/user/agreement
  Requires signature: true
  """
  def sign_agreement(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/user/agreement",
          query: [],
          headers: [
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": 0,\n    \"categoryV2\": 0,\n    \"agree\": false\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
