defmodule Bybit.API.OpenApiV5.Abandon do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_margin_coin_info(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Margin Coin Info
  Method: GET
  Path: /v5/ins-loan/ensure-tokens
  Requires signature: true
  Optional: productId
  """
  def get_margin_coin_info(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/ins-loan/ensure-tokens",
          query: [productId: Keyword.get(opts, :productId)],
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

  @spec get_lending_account_info(Bybit.Client.t(), term()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Lending Account Info
  Method: GET
  Path: /v5/lending/account
  Requires signature: true
  Required: coin
  """
  def get_lending_account_info(client, coin) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/lending/account",
          query: [coin: coin],
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

  @spec get_order_records(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Order Records
  Method: GET
  Path: /v5/lending/history-order
  Requires signature: true
  Optional: coin, orderId, startTime, endTime, limit, orderType
  """
  def get_order_records(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/lending/history-order",
          query: [
            coin: Keyword.get(opts, :coin),
            orderId: Keyword.get(opts, :orderId),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            orderType: Keyword.get(opts, :orderType)
          ],
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

  @spec get_lending_coin_info(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Lending Coin Info
  Method: GET
  Path: /v5/lending/info
  Requires signature: true
  Optional: coin
  """
  def get_lending_coin_info(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/lending/info",
          query: [coin: Keyword.get(opts, :coin)],
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

  @spec deposit_funds(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Deposit Funds
  Method: POST
  Path: /v5/lending/purchase
  Requires signature: true
  """
  def deposit_funds(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/lending/purchase",
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
                "{\n    \"coin\": \"USDT\",\n    \"quantity\": \"\",\n    \"serialNo\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec redeem_funds(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Redeem Funds
  Method: POST
  Path: /v5/lending/redeem
  Requires signature: true
  """
  def redeem_funds(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/lending/redeem",
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
                "{\n    \"coin\": \"USDT\",\n    \"quantity\": \"\",\n    \"serialNo\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec cancel_redeem(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Cancel Redeem
  Method: POST
  Path: /v5/lending/redeem-cancel
  Requires signature: true
  """
  def cancel_redeem(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/lending/redeem-cancel",
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
                "{\n    \"coin\": \"USDT\",\n    \"orderId\": \"123456\",\n    \"serialNo\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
