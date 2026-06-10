defmodule Bybit.API.OpenApiV5.PreUprgade do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_pre_upgrade_order_history_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Pre-upgrade Order History
  Method: GET
  Path: /v5/pre-upgrade/order/history
  Requires signature: true
  Required: category
  Optional: symbol, baseCoin, orderId, orderLinkId, orderFilter, orderStatus, startTime, endTime, limit, cursor
  """
  def get_pre_upgrade_order_history_v5(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/pre-upgrade/order/history",
          query: [
            category: category,
            symbol: Keyword.get(opts, :symbol),
            baseCoin: Keyword.get(opts, :baseCoin),
            orderId: Keyword.get(opts, :orderId),
            orderLinkId: Keyword.get(opts, :orderLinkId),
            orderFilter: Keyword.get(opts, :orderFilter),
            orderStatus: Keyword.get(opts, :orderStatus),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_pre_upgrade_trade_history_v5(Bybit.Client.t(), term(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Pre-upgrade Trade History
  Method: GET
  Path: /v5/pre-upgrade/execution/list
  Requires signature: true
  Required: category, symbol, limit
  Optional: orderId, orderLinkId, baseCoin, startTime, endTime, execType, cursor
  """
  def get_pre_upgrade_trade_history_v5(client, category, symbol, limit, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/pre-upgrade/execution/list",
          query: [
            category: category,
            symbol: symbol,
            orderId: Keyword.get(opts, :orderId),
            orderLinkId: Keyword.get(opts, :orderLinkId),
            baseCoin: Keyword.get(opts, :baseCoin),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            execType: Keyword.get(opts, :execType),
            limit: limit,
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_pre_upgrade_transaction_log_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Pre-upgrade Transaction Log
  Method: GET
  Path: /v5/pre-upgrade/account/transaction-log
  Requires signature: true
  Required: category
  Optional: baseCoin, type, startTime, endTime, limit, cursor
  """
  def get_pre_upgrade_transaction_log_v5(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/pre-upgrade/account/transaction-log",
          query: [
            category: category,
            baseCoin: Keyword.get(opts, :baseCoin),
            type: Keyword.get(opts, :type),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_pre_upgrade_closed_pnl_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Pre-upgrade Closed PnL
  Method: GET
  Path: /v5/pre-upgrade/position/closed-pnl
  Requires signature: true
  Required: category, symbol
  Optional: startTime, endTime, limit, cursor
  """
  def get_pre_upgrade_closed_pnl_v5(client, category, symbol, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/pre-upgrade/position/closed-pnl",
          query: [
            category: category,
            symbol: symbol,
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_pre_upgrade_delivery_record_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Pre-upgrade Delivery Record
  Method: GET
  Path: /v5/pre-upgrade/asset/delivery-record
  Requires signature: true
  Required: category
  Optional: symbol, expDate, limit, cursor
  """
  def get_pre_upgrade_delivery_record_v5(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/pre-upgrade/asset/delivery-record",
          query: [
            category: category,
            symbol: Keyword.get(opts, :symbol),
            expDate: Keyword.get(opts, :expDate),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_pre_upgrade_usdc_session_settlement_v5(
          Bybit.Client.t(),
          term(),
          term(),
          term(),
          Keyword.t()
        ) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Pre-upgrade USDC Session Settlement
  Method: GET
  Path: /v5/pre-upgrade/asset/settlement-record
  Requires signature: true
  Required: category, symbol, limit
  Optional: cursor
  """
  def get_pre_upgrade_usdc_session_settlement_v5(client, category, symbol, limit, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/pre-upgrade/asset/settlement-record",
          query: [
            category: category,
            symbol: symbol,
            limit: limit,
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
