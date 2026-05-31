defmodule Bybit.API.OpenApiV5.Market do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_bybit_server_time_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Bybit Server Time
  Method: GET
  Path: /v5/market/time
  Requires signature: false
  """
  def get_bybit_server_time_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/time",
          query: [],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_kline_v5(Bybit.Client.t(), term(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Kline
  Method: GET
  Path: /v5/market/kline
  Requires signature: true
  Required: symbol, interval, limit
  Optional: category, start, end
  """
  def get_kline_v5(client, symbol, interval, limit, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/kline",
          query: [
            category: Keyword.get(opts, :category),
            symbol: symbol,
            interval: interval,
            start: Keyword.get(opts, :start),
            end: Keyword.get(opts, :end),
            limit: limit
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_mark_price_kline_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Mark Price Kline
  Method: GET
  Path: /v5/market/mark-price-kline
  Requires signature: true
  Required: symbol, interval
  Optional: category, start, end, limit
  """
  def get_mark_price_kline_v5(client, symbol, interval, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/mark-price-kline",
          query: [
            category: Keyword.get(opts, :category),
            symbol: symbol,
            interval: interval,
            start: Keyword.get(opts, :start),
            end: Keyword.get(opts, :end),
            limit: Keyword.get(opts, :limit)
          ],
          headers: [
            {"X-BAPI-SIGN-TYPE", "2"},
            {"X-BAPI-SIGN", "{{signed}}"},
            {"X-BAPI-API-KEY", "{{api_key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_index_price_kline_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Index Price Kline
  Method: GET
  Path: /v5/market/index-price-kline
  Requires signature: true
  Required: symbol, interval
  Optional: category, start, end, limit
  """
  def get_index_price_kline_v5(client, symbol, interval, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/index-price-kline",
          query: [
            category: Keyword.get(opts, :category),
            symbol: symbol,
            interval: interval,
            start: Keyword.get(opts, :start),
            end: Keyword.get(opts, :end),
            limit: Keyword.get(opts, :limit)
          ],
          headers: [
            {"X-BAPI-SIGN-TYPE", "2"},
            {"X-BAPI-SIGN", "{{signed}}"},
            {"X-BAPI-API-KEY", "{{api_key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_premium_index_price_kline_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Premium Index Price Kline
  Method: GET
  Path: /v5/market/premium-index-price-kline
  Requires signature: true
  Required: symbol, interval
  Optional: category, start, end, limit
  """
  def get_premium_index_price_kline_v5(client, symbol, interval, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/premium-index-price-kline",
          query: [
            category: Keyword.get(opts, :category),
            symbol: symbol,
            interval: interval,
            start: Keyword.get(opts, :start),
            end: Keyword.get(opts, :end),
            limit: Keyword.get(opts, :limit)
          ],
          headers: [
            {"X-BAPI-SIGN-TYPE", "2"},
            {"X-BAPI-SIGN", "{{signed}}"},
            {"X-BAPI-API-KEY", "{{api_key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_orderbook_v5(Bybit.Client.t(), term(), term(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Orderbook
  Method: GET
  Path: /v5/market/orderbook
  Requires signature: true
  Required: category, symbol, limit
  """
  def get_orderbook_v5(client, category, symbol, limit) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/orderbook",
          query: [category: category, symbol: symbol, limit: limit],
          headers: [
            {"X-BAPI-SIGN-TYPE", "2"},
            {"X-BAPI-SIGN", "{{signed}}"},
            {"X-BAPI-API-KEY", "{{api_key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_instruments_info_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Instruments Info
  Method: GET
  Path: /v5/market/instruments-info
  Requires signature: true
  Required: category, limit
  Optional: symbol, symbolType, status, baseCoin, cursor
  """
  def get_instruments_info_v5(client, category, limit, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/instruments-info",
          query: [
            category: category,
            symbol: Keyword.get(opts, :symbol),
            symbolType: Keyword.get(opts, :symbolType),
            status: Keyword.get(opts, :status),
            baseCoin: Keyword.get(opts, :baseCoin),
            limit: limit,
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [
            {"X-BAPI-SIGN-TYPE", "2"},
            {"X-BAPI-SIGN", "{{signed}}"},
            {"X-BAPI-API-KEY", "{{api_key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_tickers_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Tickers
  Method: GET
  Path: /v5/market/tickers
  Requires signature: true
  Required: category, baseCoin
  Optional: symbol, expDate
  """
  def get_tickers_v5(client, category, baseCoin, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/tickers",
          query: [
            category: category,
            symbol: Keyword.get(opts, :symbol),
            baseCoin: baseCoin,
            expDate: Keyword.get(opts, :expDate)
          ],
          headers: [
            {"X-BAPI-SIGN-TYPE", "2"},
            {"X-BAPI-SIGN", "{{signed}}"},
            {"X-BAPI-API-KEY", "{{api_key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_funding_rate_history_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Funding Rate History
  Method: GET
  Path: /v5/market/funding/history
  Requires signature: true
  Required: category, symbol
  Optional: startTime, endTime, limit
  """
  def get_funding_rate_history_v5(client, category, symbol, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/funding/history",
          query: [
            category: category,
            symbol: symbol,
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit)
          ],
          headers: [
            {"X-BAPI-SIGN-TYPE", "2"},
            {"X-BAPI-SIGN", "{{signed}}"},
            {"X-BAPI-API-KEY", "{{api_key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_risk_limit_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Risk Limit
  Method: GET
  Path: /v5/market/risk-limit
  Requires signature: true
  Required: category, symbol
  Optional: cursor
  """
  def get_risk_limit_v5(client, category, symbol, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/risk-limit",
          query: [category: category, symbol: symbol, cursor: Keyword.get(opts, :cursor)],
          headers: [
            {"X-BAPI-SIGN-TYPE", "2"},
            {"X-BAPI-SIGN", "{{signed}}"},
            {"X-BAPI-API-KEY", "{{api_key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_open_interest_v5(Bybit.Client.t(), term(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Open Interest
  Method: GET
  Path: /v5/market/open-interest
  Requires signature: false
  Required: category, symbol, intervalTime
  Optional: startTime, endTime, limit, cursor
  """
  def get_open_interest_v5(client, category, symbol, intervalTime, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/open-interest",
          query: [
            category: category,
            symbol: symbol,
            intervalTime: intervalTime,
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

  @spec get_insurance_pool_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Insurance Pool
  Method: GET
  Path: /v5/market/insurance
  Requires signature: false
  Optional: coin
  """
  def get_insurance_pool_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/insurance",
          query: [coin: Keyword.get(opts, :coin)],
          headers: [],
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
  Path: /v5/market/recent-trade
  Requires signature: false
  Required: category
  Optional: symbol, baseCoin, optionType, limit
  """
  def get_recent_public_trades_v5(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/recent-trade",
          query: [
            category: category,
            symbol: Keyword.get(opts, :symbol),
            baseCoin: Keyword.get(opts, :baseCoin),
            optionType: Keyword.get(opts, :optionType),
            limit: Keyword.get(opts, :limit)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_delivery_price_v5(Bybit.Client.t(), term(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Delivery Price
  Method: GET
  Path: /v5/market/delivery-price
  Requires signature: false
  Required: category, baseCoin, limit
  Optional: symbol, settleCoin, cursor
  """
  def get_delivery_price_v5(client, category, baseCoin, limit, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/delivery-price",
          query: [
            category: category,
            symbol: Keyword.get(opts, :symbol),
            baseCoin: baseCoin,
            settleCoin: Keyword.get(opts, :settleCoin),
            limit: limit,
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_long_short_ratio_v5(Bybit.Client.t(), term(), term(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Long Short Ratio
  Method: GET
  Path: /v5/market/account-ratio
  Requires signature: false
  Required: category, symbol, period, limit
  Optional: startTime, endTime, cursor
  """
  def get_long_short_ratio_v5(client, category, symbol, period, limit, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/account-ratio",
          query: [
            category: category,
            symbol: symbol,
            period: period,
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: limit,
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_historical_volatility_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Historical Volatility
  Method: GET
  Path: /v5/market/historical-volatility
  Requires signature: false
  Required: category
  Optional: baseCoin, quoteCoin, period, startTime, endTime
  """
  def get_historical_volatility_v5(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/historical-volatility",
          query: [
            category: category,
            baseCoin: Keyword.get(opts, :baseCoin),
            quoteCoin: Keyword.get(opts, :quoteCoin),
            period: Keyword.get(opts, :period),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_adl_alert_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get ADL Alert
  Method: GET
  Path: /v5/market/adlAlert
  Requires signature: true
  Optional: symbol
  """
  def get_adl_alert_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/adlAlert",
          query: [symbol: Keyword.get(opts, :symbol)],
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

  @spec get_fee_group_structure_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Fee Group Structure
  Method: GET
  Path: /v5/market/fee-group-info
  Requires signature: true
  Required: productType
  Optional: groupId
  """
  def get_fee_group_structure_v5(client, productType, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/fee-group-info",
          query: [productType: productType, groupId: Keyword.get(opts, :groupId)],
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

  @spec get_index_price_components_v5(Bybit.Client.t(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Index Price Components
  Method: GET
  Path: /v5/market/index-price-components
  Requires signature: true
  Required: indexName
  """
  def get_index_price_components_v5(client, indexName) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/index-price-components",
          query: [indexName: indexName],
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

  @spec get_new_delivery_price_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get New Delivery Price
  Method: GET
  Path: /v5/market/new-delivery-price
  Requires signature: true
  Required: category, baseCoin
  Optional: settleCoin
  """
  def get_new_delivery_price_v5(client, category, baseCoin, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/new-delivery-price",
          query: [
            category: category,
            baseCoin: baseCoin,
            settleCoin: Keyword.get(opts, :settleCoin)
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

  @spec get_order_price_limit_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Order Price Limit
  Method: GET
  Path: /v5/market/price-limit
  Requires signature: true
  Required: symbol
  Optional: category
  """
  def get_order_price_limit_v5(client, symbol, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/price-limit",
          query: [category: Keyword.get(opts, :category), symbol: symbol],
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

  @spec get_rpi_orderbook_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get RPI Orderbook
  Method: GET
  Path: /v5/market/rpi_orderbook
  Requires signature: true
  Required: symbol, limit
  Optional: category
  """
  def get_rpi_orderbook_v5(client, symbol, limit, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/market/rpi_orderbook",
          query: [category: Keyword.get(opts, :category), symbol: symbol, limit: limit],
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
end
