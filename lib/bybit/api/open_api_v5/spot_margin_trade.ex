defmodule Bybit.API.OpenApiV5.SpotMarginTrade do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_vip_margin_data_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get VIP Margin Data
  Method: GET
  Path: /v5/spot-margin-trade/data
  Requires signature: true
  Required: currency
  Optional: vipLevel
  """
  def get_vip_margin_data_v5(client, currency, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-margin-trade/data",
          query: [vipLevel: Keyword.get(opts, :vipLevel), currency: currency],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_historical_interest_rate_v5(Bybit.Client.t(), term(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Historical Interest Rate
  Method: GET
  Path: /v5/spot-margin-trade/interest-rate-history
  Requires signature: true
  Required: currency, startTime, endTime
  Optional: vipLevel
  """
  def get_historical_interest_rate_v5(client, currency, startTime, endTime, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-margin-trade/interest-rate-history",
          query: [
            currency: currency,
            vipLevel: Keyword.get(opts, :vipLevel),
            startTime: startTime,
            endTime: endTime
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_status_and_leverage_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Status And Leverage
  Method: GET
  Path: /v5/spot-margin-trade/state
  Requires signature: true
  """
  def get_status_and_leverage_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-margin-trade/state",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec toggle_margin_trade_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Toggle Margin Trade
  Method: POST
  Path: /v5/spot-margin-trade/switch-mode
  Requires signature: true
  """
  def toggle_margin_trade_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/spot-margin-trade/switch-mode",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw: Keyword.get(opts, :body, "{\n    \"spotMarginMode\": \"1\"\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec set_leverage_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Set Leverage
  Method: POST
  Path: /v5/spot-margin-trade/set-leverage
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
          url: "/v5/spot-margin-trade/set-leverage",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"leverage\": \"3\",\n    \"currency\": \"USDT\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_coin_state_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Coin State
  Method: GET
  Path: /v5/spot-margin-trade/coinstate
  Requires signature: true
  Optional: currency
  """
  def get_coin_state_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-margin-trade/coinstate",
          query: [currency: Keyword.get(opts, :currency)],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_tiered_collateral_ratio_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Tiered Collateral Ratio
  Method: GET
  Path: /v5/spot-margin-trade/collateral
  Requires signature: true
  Optional: currency
  """
  def get_tiered_collateral_ratio_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-margin-trade/collateral",
          query: [currency: Keyword.get(opts, :currency)],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_currency_data_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Currency Data
  Method: GET
  Path: /v5/spot-margin-trade/currency-data
  Requires signature: true
  Optional: currency
  """
  def get_currency_data_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-margin-trade/currency-data",
          query: [currency: Keyword.get(opts, :currency)],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec fixed_rate_borrow_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Fixed-Rate Borrow
  Method: POST
  Path: /v5/spot-margin-trade/fixedborrow
  Requires signature: true
  """
  def fixed_rate_borrow_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/spot-margin-trade/fixedborrow",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"orderCurrency\": \"BTC\",\n    \"orderAmount\": \"0.01\",\n    \"annualRate\": \"0.02\",\n    \"term\": \"7\",\n    \"repayType\": \"2\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_fixed_rate_borrow_contract_info_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Fixed-Rate Borrow Contract Info
  Method: GET
  Path: /v5/spot-margin-trade/fixedborrow-contract-info
  Requires signature: true
  Optional: orderId, orderCurrency, term, limit, cursor
  """
  def get_fixed_rate_borrow_contract_info_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-margin-trade/fixedborrow-contract-info",
          query: [
            orderId: Keyword.get(opts, :orderId),
            orderCurrency: Keyword.get(opts, :orderCurrency),
            term: Keyword.get(opts, :term),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_fixed_rate_borrow_order_info_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Fixed-Rate Borrow Order Info
  Method: GET
  Path: /v5/spot-margin-trade/fixedborrow-order-info
  Requires signature: true
  Optional: orderId, orderCurrency, state, term, limit, cursor
  """
  def get_fixed_rate_borrow_order_info_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-margin-trade/fixedborrow-order-info",
          query: [
            orderId: Keyword.get(opts, :orderId),
            orderCurrency: Keyword.get(opts, :orderCurrency),
            state: Keyword.get(opts, :state),
            term: Keyword.get(opts, :term),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_fixed_rate_borrow_order_quote_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Fixed-Rate Borrow Order Quote
  Method: GET
  Path: /v5/spot-margin-trade/fixedborrow-order-quote
  Requires signature: true
  Required: orderCurrency
  Optional: term, orderBy, sort, limit
  """
  def get_fixed_rate_borrow_order_quote_v5(client, orderCurrency, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-margin-trade/fixedborrow-order-quote",
          query: [
            orderCurrency: orderCurrency,
            term: Keyword.get(opts, :term),
            orderBy: Keyword.get(opts, :orderBy),
            sort: Keyword.get(opts, :sort),
            limit: Keyword.get(opts, :limit)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec renew_fixed_rate_borrow_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Renew Fixed-Rate Borrow
  Method: POST
  Path: /v5/spot-margin-trade/fixedborrow-renew
  Requires signature: true
  """
  def renew_fixed_rate_borrow_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/spot-margin-trade/fixedborrow-renew",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw: Keyword.get(opts, :body, "{\n    \"loanId\": \"123456\",\n    \"qty\": \"1\"\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_auto_repay_mode_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Auto Repay Mode
  Method: GET
  Path: /v5/spot-margin-trade/get-auto-repay-mode
  Requires signature: true
  Optional: currency
  """
  def get_auto_repay_mode_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-margin-trade/get-auto-repay-mode",
          query: [currency: Keyword.get(opts, :currency)],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_liability_info_v5(Bybit.Client.t(), term()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Liability Info
  Method: GET
  Path: /v5/spot-margin-trade/liability
  Requires signature: true
  Required: currency
  """
  def get_liability_info_v5(client, currency) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-margin-trade/liability",
          query: [currency: currency],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_max_borrowable_amount_v5(Bybit.Client.t(), term()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Max Borrowable Amount
  Method: GET
  Path: /v5/spot-margin-trade/max-borrowable
  Requires signature: true
  Required: currency
  """
  def get_max_borrowable_amount_v5(client, currency) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-margin-trade/max-borrowable",
          query: [currency: currency],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_position_tiers_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Position Tiers
  Method: GET
  Path: /v5/spot-margin-trade/position-tiers
  Requires signature: true
  Optional: currency
  """
  def get_position_tiers_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-margin-trade/position-tiers",
          query: [currency: Keyword.get(opts, :currency)],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_available_amount_to_repay_v5(Bybit.Client.t(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Available Amount to Repay
  Method: GET
  Path: /v5/spot-margin-trade/repayment-available-amount
  Requires signature: true
  Required: currency
  """
  def get_available_amount_to_repay_v5(client, currency) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-margin-trade/repayment-available-amount",
          query: [currency: currency],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec set_auto_repay_mode_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Set Auto Repay Mode
  Method: POST
  Path: /v5/spot-margin-trade/set-auto-repay-mode
  Requires signature: true
  """
  def set_auto_repay_mode_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/spot-margin-trade/set-auto-repay-mode",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"currency\": \"USDT\",\n    \"autoRepayMode\": \"1\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
