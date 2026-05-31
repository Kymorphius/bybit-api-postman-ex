defmodule Bybit.API.OpenApiV5.Spread do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_trade_history_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Trade History
  Method: GET
  Path: /v5/spread/execution/list
  Requires signature: true
  Optional: symbol, orderId, orderLinkId, startTime, endTime, limit, cursor
  """
  def get_trade_history_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spread/execution/list",
          query: [
            symbol: Keyword.get(opts, :symbol),
            orderId: Keyword.get(opts, :orderId),
            orderLinkId: Keyword.get(opts, :orderLinkId),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_max_qty_v5(Bybit.Client.t(), term(), term(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Max Qty
  Method: GET
  Path: /v5/spread/max-qty
  Requires signature: true
  Required: symbol, side, orderPrice
  """
  def get_max_qty_v5(client, symbol, side, orderPrice) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spread/max-qty",
          query: [symbol: symbol, side: side, orderPrice: orderPrice],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec amend_order_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Amend Order
  Method: POST
  Path: /v5/spread/order/amend
  Requires signature: true
  """
  def amend_order_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/spread/order/amend",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"symbol\": \"BTCUSDT\",\n    \"orderId\": \"123456\",\n    \"orderLinkId\": \"123456\",\n    \"qty\": \"1\",\n    \"price\": \"1\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec cancel_order_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Cancel Order
  Method: POST
  Path: /v5/spread/order/cancel
  Requires signature: true
  """
  def cancel_order_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/spread/order/cancel",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"orderId\": \"123456\",\n    \"orderLinkId\": \"123456\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec cancel_all_orders_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Cancel All Orders
  Method: POST
  Path: /v5/spread/order/cancel-all
  Requires signature: true
  """
  def cancel_all_orders_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/spread/order/cancel-all",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"symbol\": \"BTCUSDT\",\n    \"cancelAll\": false\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec create_order_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Create Order
  Method: POST
  Path: /v5/spread/order/create
  Requires signature: true
  """
  def create_order_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/spread/order/create",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"symbol\": \"BTCUSDT\",\n    \"side\": \"Buy\",\n    \"orderType\": \"Limit\",\n    \"qty\": \"1\",\n    \"price\": \"1\",\n    \"orderLinkId\": \"123456\",\n    \"timeInForce\": \"IOC\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_order_history_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Order History
  Method: GET
  Path: /v5/spread/order/history
  Requires signature: true
  Optional: symbol, baseCoin, orderId, orderLinkId, startTime, endTime, limit, cursor
  """
  def get_order_history_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spread/order/history",
          query: [
            symbol: Keyword.get(opts, :symbol),
            baseCoin: Keyword.get(opts, :baseCoin),
            orderId: Keyword.get(opts, :orderId),
            orderLinkId: Keyword.get(opts, :orderLinkId),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_open_orders_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Open Orders
  Method: GET
  Path: /v5/spread/order/realtime
  Requires signature: true
  Optional: symbol, baseCoin, orderId, orderLinkId, limit, cursor
  """
  def get_open_orders_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spread/order/realtime",
          query: [
            symbol: Keyword.get(opts, :symbol),
            baseCoin: Keyword.get(opts, :baseCoin),
            orderId: Keyword.get(opts, :orderId),
            orderLinkId: Keyword.get(opts, :orderLinkId),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_instruments_info_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Instruments Info
  Method: GET
  Path: /v5/spread/instrument
  Requires signature: true
  Optional: symbol, baseCoin, limit, cursor
  """
  def get_instruments_info_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spread/instrument",
          query: [
            symbol: Keyword.get(opts, :symbol),
            baseCoin: Keyword.get(opts, :baseCoin),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_orderbook_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Orderbook
  Method: GET
  Path: /v5/spread/orderbook
  Requires signature: true
  Required: symbol
  Optional: limit
  """
  def get_orderbook_v5(client, symbol, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spread/orderbook",
          query: [symbol: symbol, limit: Keyword.get(opts, :limit)],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_recent_public_trades_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Recent Public Trades
  Method: GET
  Path: /v5/spread/recent-trade
  Requires signature: true
  Required: symbol
  Optional: limit
  """
  def get_recent_public_trades_v5(client, symbol, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spread/recent-trade",
          query: [symbol: symbol, limit: Keyword.get(opts, :limit)],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_tickers_v5(Bybit.Client.t(), term()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Tickers
  Method: GET
  Path: /v5/spread/tickers
  Requires signature: true
  Required: symbol
  """
  def get_tickers_v5(client, symbol) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spread/tickers",
          query: [symbol: symbol],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
