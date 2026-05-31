defmodule Bybit.API.OpenApiV5.Account do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_wallet_balance_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Wallet Balance
  Method: GET
  Path: /v5/account/wallet-balance
  Requires signature: true
  Required: accountType
  Optional: coin
  """
  def get_wallet_balance_v5(client, accountType, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/wallet-balance",
          query: [accountType: accountType, coin: Keyword.get(opts, :coin)],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_coin_greeks_v5(Bybit.Client.t(), term()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Coin Greeks
  Method: GET
  Path: /v5/asset/coin-greeks
  Requires signature: true
  Required: baseCoin
  """
  def get_coin_greeks_v5(client, baseCoin) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/coin-greeks",
          query: [baseCoin: baseCoin],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_collateral_info_v5(Bybit.Client.t(), term()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Collateral Info
  Method: GET
  Path: /v5/account/collateral-info
  Requires signature: true
  Required: currency
  """
  def get_collateral_info_v5(client, currency) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/collateral-info",
          query: [currency: currency],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_account_info_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Account Info
  Method: GET
  Path: /v5/account/info
  Requires signature: true
  """
  def get_account_info_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/info",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_fee_rate_v5(Bybit.Client.t(), term(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Fee Rate
  Method: GET
  Path: /v5/account/fee-rate
  Requires signature: true
  Required: category
  Optional: symbol, baseCoin
  """
  def get_fee_rate_v5(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/fee-rate",
          query: [
            category: category,
            symbol: Keyword.get(opts, :symbol),
            baseCoin: Keyword.get(opts, :baseCoin)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_transaction_log_account_account_transaction_log(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Transaction Log
  Variant: Account
  Tags: account
  Method: GET
  Path: /v5/account/transaction-log
  Requires signature: true
  Optional: accountType, category, currency, baseCoin, type, transSubType, startTime, endTime, limit, cursor
  """
  def get_transaction_log_account_account_transaction_log(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/transaction-log",
          query: [
            accountType: Keyword.get(opts, :accountType),
            category: Keyword.get(opts, :category),
            currency: Keyword.get(opts, :currency),
            baseCoin: Keyword.get(opts, :baseCoin),
            type: Keyword.get(opts, :type),
            transSubType: Keyword.get(opts, :transSubType),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_transaction_log_contract_transaction_log_account_contract_transaction_log(
          Bybit.Client.t(),
          Keyword.t()
        ) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Transaction Log
  Variant: Contract Transaction Log
  Tags: contract_transaction_log
  Method: GET
  Path: /v5/account/contract-transaction-log
  Requires signature: true
  Optional: currency, baseCoin, type, startTime, endTime, limit, cursor
  """
  def get_transaction_log_contract_transaction_log_account_contract_transaction_log(
        client,
        opts \\ []
      ) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/contract-transaction-log",
          query: [
            currency: Keyword.get(opts, :currency),
            baseCoin: Keyword.get(opts, :baseCoin),
            type: Keyword.get(opts, :type),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_borrow_history_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Borrow History
  Method: GET
  Path: /v5/account/borrow-history
  Requires signature: true
  Optional: currency, startTime, endTime, limit, cursor
  """
  def get_borrow_history_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/borrow-history",
          query: [
            currency: Keyword.get(opts, :currency),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec upgrade_to_unified_account_pro_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Upgrade to Unified Account Pro
  Method: POST
  Path: /v5/account/upgrade-to-uta
  Requires signature: true
  """
  def upgrade_to_unified_account_pro_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/account/upgrade-to-uta",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec set_margin_mode_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Set Margin Mode
  Method: POST
  Path: /v5/account/set-margin-mode
  Requires signature: true
  """
  def set_margin_mode_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/account/set-margin-mode",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw: Keyword.get(opts, :body, "{\n    \"setMarginMode\": \"REGULAR_MARGIN\"\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec set_mmp_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Set MMP
  Method: POST
  Path: /v5/account/mmp-modify
  Requires signature: true
  """
  def set_mmp_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/account/mmp-modify",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"baseCoin\": \"BTC\",\n    \"window\": \"5000\",\n    \"frozenPeriod\": \"100000\",\n    \"qtyLimit\": \"0.01\",\n    \"deltaLimit\": \"0.01\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec reset_mmp_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Reset MMP
  Method: POST
  Path: /v5/account/mmp-reset
  Requires signature: true
  """
  def reset_mmp_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/account/mmp-reset",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"baseCoin\": \"BTC\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec set_disconnect_cancel_all_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Set Disconnect Cancel All
  Method: POST
  Path: /v5/order/disconnected-cancel-all
  Requires signature: true
  """
  def set_disconnect_cancel_all_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/order/disconnected-cancel-all",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"product\": \"OPTIONS\",\n    \"timeWindow\": 5\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_dcp_info_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get DCP Info
  Method: GET
  Path: /v5/account/query-dcp-info
  Requires signature: true
  """
  def get_dcp_info_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/query-dcp-info",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_smp_group_id_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get SMP Group ID
  Method: GET
  Path: /v5/account/smp-group
  Requires signature: true
  """
  def get_smp_group_id_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/smp-group",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_mmp_state_v5(Bybit.Client.t(), term()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get MMP State
  Method: GET
  Path: /v5/account/mmp-state
  Requires signature: true
  Required: baseCoin
  """
  def get_mmp_state_v5(client, baseCoin) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/mmp-state",
          query: [baseCoin: baseCoin],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec manual_borrow_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Manual Borrow
  Method: POST
  Path: /v5/account/borrow
  Requires signature: true
  """
  def manual_borrow_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/account/borrow",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw: Keyword.get(opts, :body, "{\n    \"coin\": \"USDT\",\n    \"amount\": \"1\"\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_account_instruments_info_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Account Instruments Info
  Method: GET
  Path: /v5/account/instruments-info
  Requires signature: true
  Required: category
  Optional: symbol, limit, cursor
  """
  def get_account_instruments_info_v5(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/instruments-info",
          query: [
            category: category,
            symbol: Keyword.get(opts, :symbol),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec manual_repay_without_asset_conversion_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Manual Repay Without Asset Conversion
  Method: POST
  Path: /v5/account/no-convert-repay
  Requires signature: true
  """
  def manual_repay_without_asset_conversion_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/account/no-convert-repay",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"coin\": \"USDT\",\n    \"amount\": \"1\",\n    \"repaymentType\": \"ALL\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_option_asset_info_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Option Asset Info
  Method: GET
  Path: /v5/account/option-asset-info
  Requires signature: true
  """
  def get_option_asset_info_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/option-asset-info",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_pay_info_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Pay Info
  Method: GET
  Path: /v5/account/pay-info
  Requires signature: true
  Optional: coin
  """
  def get_pay_info_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/pay-info",
          query: [coin: Keyword.get(opts, :coin)],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec repay_liability_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Repay Liability
  Method: POST
  Path: /v5/account/quick-repayment
  Requires signature: true
  """
  def repay_liability_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/account/quick-repayment",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"coin\": \"USDT\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec manual_repay_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Manual Repay
  Method: POST
  Path: /v5/account/repay
  Requires signature: true
  """
  def manual_repay_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/account/repay",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"coin\": \"USDT\",\n    \"amount\": \"1\",\n    \"repaymentType\": \"ALL\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec set_collateral_coin_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Set Collateral Coin
  Method: POST
  Path: /v5/account/set-collateral-switch
  Requires signature: true
  """
  def set_collateral_coin_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/account/set-collateral-switch",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"coin\": \"USDT\",\n    \"collateralSwitch\": \"ON\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec batch_set_collateral_coin_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Batch Set Collateral Coin
  Method: POST
  Path: /v5/account/set-collateral-switch-batch
  Requires signature: true
  """
  def batch_set_collateral_coin_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/account/set-collateral-switch-batch",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"request\": [\n        {\n            \"coin\": \"USDT\",\n            \"collateralSwitch\": \"ON\"\n        }\n    ]\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec set_delta_neutral_mode_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Set Delta Neutral Mode
  Method: POST
  Path: /v5/account/set-delta-mode
  Requires signature: true
  """
  def set_delta_neutral_mode_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/account/set-delta-mode",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"deltaEnable\": \"\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec set_spot_hedging_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Set Spot Hedging
  Method: POST
  Path: /v5/account/set-hedging-mode
  Requires signature: true
  """
  def set_spot_hedging_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/account/set-hedging-mode",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw: Keyword.get(opts, :body, "{\n    \"setHedgingMode\": \"ON\"\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec set_price_limit_behaviour_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Set Price Limit Behaviour
  Method: POST
  Path: /v5/account/set-limit-px-action
  Requires signature: true
  """
  def set_price_limit_behaviour_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/account/set-limit-px-action",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"linear\",\n    \"modifyEnable\": false\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_trade_info_for_analysis_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Trade Info For Analysis
  Method: GET
  Path: /v5/account/trade-info-for-analysis
  Requires signature: true
  Required: symbol
  Optional: startTime, endTime
  """
  def get_trade_info_for_analysis_v5(client, symbol, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/trade-info-for-analysis",
          query: [
            symbol: symbol,
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_trade_behaviour_config_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Trade Behaviour Config
  Method: GET
  Path: /v5/account/user-setting-config
  Requires signature: true
  """
  def get_trade_behaviour_config_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/user-setting-config",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_transferable_amount_v5(Bybit.Client.t(), term()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Transferable Amount
  Variant: Unified
  Tags: unified
  Method: GET
  Path: /v5/account/withdrawal
  Requires signature: true
  Required: coinName
  """
  def get_transferable_amount_v5(client, coinName) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/account/withdrawal",
          query: [coinName: coinName],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
