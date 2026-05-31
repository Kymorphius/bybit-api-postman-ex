defmodule Bybit.API.OpenApiV5.Position do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_position_info_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Position Info
  Method: GET
  Path: /v5/position/list
  Requires signature: true
  Required: category, symbol
  Optional: baseCoin, settleCoin, limit, cursor
  """
  def get_position_info_v5(client, category, symbol, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/position/list",
          query: [
            category: category,
            symbol: symbol,
            baseCoin: Keyword.get(opts, :baseCoin),
            settleCoin: Keyword.get(opts, :settleCoin),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
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

  @spec switch_cross_isolated_margin_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Switch Cross/Isolated Margin
  Method: POST
  Path: /v5/position/switch-isolated
  Requires signature: true
  """
  def switch_cross_isolated_margin_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/position/switch-isolated",
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
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"inverse\",\n    \"symbol\": \"BTC-31MAR23\",\n    \"tradeMode\": 0,\n    \"buyLeverage\": \"5\",\n    \"sellLeverage\": \"5\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec switch_position_mode_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Switch Position Mode
  Method: POST
  Path: /v5/position/switch-mode
  Requires signature: true
  """
  def switch_position_mode_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/position/switch-mode",
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
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"linear\",\n    \"symbol\": \"BTCUSDT\",\n    \"coin\": \"USDT\",\n    \"mode\": 3\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec set_trading_stop_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Set Trading Stop
  Method: POST
  Path: /v5/position/trading-stop
  Requires signature: true
  """
  def set_trading_stop_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/position/trading-stop",
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
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"linear\",\n    \"symbol\": \"BTCUSDT\",\n    \"tpslMode\": \"Full\",\n    \"positionIdx\": 0,\n    \"takeProfit\": \"20000\",\n    \"stopLoss\": \"10000\",\n    \"trailingStop\": \"\",\n    \"tpTriggerBy\": \"LastPrice\",\n    \"slTriggerBy\": \"LastPrice\",\n    \"activePrice\": \"\",\n    \"tpSize\": \"\",\n    \"slSize\": \"\",\n    \"tpLimitPrice\": \"1\",\n    \"slLimitPrice\": \"1\",\n    \"tpOrderType\": \"Market\",\n    \"slOrderType\": \"Market\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec set_leverage_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Set Leverage
  Method: POST
  Path: /v5/position/set-leverage
  Requires signature: true
  """
  def set_leverage_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/position/set-leverage",
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
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"linear\",\n    \"symbol\": \"BTCPERP\",\n    \"buyLeverage\": \"2\",\n    \"sellLeverage\": \"2\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec set_auto_add_margin_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Set Auto Add Margin
  Method: POST
  Path: /v5/position/set-auto-add-margin
  Requires signature: true
  """
  def set_auto_add_margin_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/position/set-auto-add-margin",
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
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"linear\",\n    \"symbol\": \"BTCPERP\",\n    \"autoAddMargin\": 0,\n    \"positionIdx\": 0\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_closed_pnl_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Closed PnL
  Method: GET
  Path: /v5/position/closed-pnl
  Requires signature: true
  Required: category, symbol
  Optional: startTime, endTime, limit, cursor
  """
  def get_closed_pnl_v5(client, category, symbol, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/position/closed-pnl",
          query: [
            category: category,
            symbol: symbol,
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
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

  @spec set_tp_sl_mode_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Set TP/SL Mode
  Method: POST
  Path: /v5/position/set-tpsl-mode
  Requires signature: true
  """
  def set_tp_sl_mode_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/position/set-tpsl-mode",
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
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"linear\",\n    \"symbol\": \"BTCUSDT\",\n    \"tpSlMode\": \"Full\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec set_risk_limit_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Set Risk Limit
  Method: POST
  Path: /v5/position/set-risk-limit
  Requires signature: true
  """
  def set_risk_limit_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/position/set-risk-limit",
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
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"linear\",\n    \"symbol\": \"BTCUSDT\",\n    \"riskId\": 1,\n    \"positionIdx\": 0\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec move_position_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Move Position
  Method: POST
  Path: /v5/position/move-positions
  Requires signature: true
  """
  def move_position_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/position/move-positions",
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
              Keyword.get(
                opts,
                :body,
                "{\n    \"fromUid\": \"1635703\",\n    \"toUid\": \"100503864\",\n    \"list\": [\n        {\n            \"category\": \"linear\",\n            \"symbol\": \"BTCUSDT\",\n            \"price\": \"45000\",\n            \"side\": \"Sell\",\n            \"qty\": \"0.01\"\n        }\n    ]\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_move_position_history_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Move Position History
  Method: GET
  Path: /v5/position/move-history
  Requires signature: true
  Optional: category, symbol, startTime, endTime, status, blockTradeId, limit, cursor
  """
  def get_move_position_history_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/position/move-history",
          query: [
            category: Keyword.get(opts, :category),
            symbol: Keyword.get(opts, :symbol),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            status: Keyword.get(opts, :status),
            blockTradeId: Keyword.get(opts, :blockTradeId),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
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

  @spec add_or_reduce_margin_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Add Or Reduce Margin
  Method: POST
  Path: /v5/position/add-margin
  Requires signature: true
  """
  def add_or_reduce_margin_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/position/add-margin",
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
                "{\n    \"category\": \"linear\",\n    \"symbol\": \"BTCUSDT\",\n    \"margin\": \"10\",\n    \"positionIdx\": 0\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec confirm_new_risk_limit_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Confirm New Risk Limit
  Method: POST
  Path: /v5/position/confirm-pending-mmr
  Requires signature: true
  """
  def confirm_new_risk_limit_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/position/confirm-pending-mmr",
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
                "{\n    \"category\": \"linear\",\n    \"symbol\": \"BTCUSDT\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_closed_options_positions_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Closed Options Positions
  Method: GET
  Path: /v5/position/get-closed-positions
  Requires signature: true
  Required: category
  Optional: symbol, startTime, endTime, limit, cursor
  """
  def get_closed_options_positions_v5(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/position/get-closed-positions",
          query: [
            category: category,
            symbol: Keyword.get(opts, :symbol),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
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
end
