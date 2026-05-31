defmodule Bybit.API.OpenApiV5.Strategy do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec create_strategy_order_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Create Strategy Order
  Method: POST
  Path: /v5/strategy/create
  Requires signature: true
  """
  def create_strategy_order_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/strategy/create",
          query: [],
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

  @spec get_strategy_list_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Strategy List
  Method: GET
  Path: /v5/strategy/list
  Requires signature: true
  Optional: strategyId, symbol, status, category, strategyType, beginTimeE0, endTimeE0, pageSize, cursor
  """
  def get_strategy_list_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/strategy/list",
          query: [
            strategyId: Keyword.get(opts, :strategyId),
            symbol: Keyword.get(opts, :symbol),
            status: Keyword.get(opts, :status),
            category: Keyword.get(opts, :category),
            strategyType: Keyword.get(opts, :strategyType),
            beginTimeE0: Keyword.get(opts, :beginTimeE0),
            endTimeE0: Keyword.get(opts, :endTimeE0),
            pageSize: Keyword.get(opts, :pageSize),
            cursor: Keyword.get(opts, :cursor)
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

  @spec get_strategy_order_list_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Strategy Order List
  Method: GET
  Path: /v5/strategy/order-list
  Requires signature: true
  Required: strategyId
  Optional: status, symbol, strategyType, beginTimeE0, endTimeE0, pageSize, cursor
  """
  def get_strategy_order_list_v5(client, strategyId, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/strategy/order-list",
          query: [
            strategyId: strategyId,
            status: Keyword.get(opts, :status),
            symbol: Keyword.get(opts, :symbol),
            strategyType: Keyword.get(opts, :strategyType),
            beginTimeE0: Keyword.get(opts, :beginTimeE0),
            endTimeE0: Keyword.get(opts, :endTimeE0),
            pageSize: Keyword.get(opts, :pageSize),
            cursor: Keyword.get(opts, :cursor)
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

  @spec stop_strategy_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Stop Strategy
  Method: POST
  Path: /v5/strategy/stop
  Requires signature: true
  """
  def stop_strategy_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/strategy/stop",
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
            raw: Keyword.get(opts, :body, "{\n    \"strategyId\": \"123456\"\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
