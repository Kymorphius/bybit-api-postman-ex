defmodule Bybit.API.OpenApiV5.NewCryptoLoan do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec adjust_collateral_amount_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Adjust Collateral Amount
  Method: POST
  Path: /v5/crypto-loan-common/adjust-ltv
  Requires signature: true
  """
  def adjust_collateral_amount_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/crypto-loan-common/adjust-ltv",
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
                "{\n    \"currency\": \"USDT\",\n    \"amount\": \"1\",\n    \"direction\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_collateral_adjustment_history_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Collateral Adjustment History
  Method: GET
  Path: /v5/crypto-loan-common/adjustment-history
  Requires signature: true
  Optional: adjustId, collateralCurrency, limit, cursor
  """
  def get_collateral_adjustment_history_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-common/adjustment-history",
          query: [
            adjustId: Keyword.get(opts, :adjustId),
            collateralCurrency: Keyword.get(opts, :collateralCurrency),
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

  @spec get_collateral_coins_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Collateral Coins
  Method: GET
  Path: /v5/crypto-loan-common/collateral-data
  Requires signature: true
  Optional: currency
  """
  def get_collateral_coins_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-common/collateral-data",
          query: [currency: Keyword.get(opts, :currency)],
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

  @spec get_borrowable_coins_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Borrowable Coins
  Method: GET
  Path: /v5/crypto-loan-common/loanable-data
  Requires signature: true
  Optional: vipLevel, currency
  """
  def get_borrowable_coins_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-common/loanable-data",
          query: [vipLevel: Keyword.get(opts, :vipLevel), currency: Keyword.get(opts, :currency)],
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

  @spec get_max_allowed_collateral_reduction_amount_v5(Bybit.Client.t(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Max. Allowed Collateral Reduction Amount
  Method: GET
  Path: /v5/crypto-loan-common/max-collateral-amount
  Requires signature: true
  Required: currency
  """
  def get_max_allowed_collateral_reduction_amount_v5(client, currency) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-common/max-collateral-amount",
          query: [currency: currency],
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

  @spec obtain_max_loan_amount_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Obtain Max Loan Amount
  Method: POST
  Path: /v5/crypto-loan-common/max-loan
  Requires signature: true
  """
  def obtain_max_loan_amount_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/crypto-loan-common/max-loan",
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
                "{\n    \"currency\": \"USDT\",\n    \"collateralList\": [\n        {\n            \"amount\": \"1\",\n            \"ccy\": \"amount\"\n        }\n    ]\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_crypto_loan_position_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Crypto Loan Position
  Method: GET
  Path: /v5/crypto-loan-common/position
  Requires signature: true
  """
  def get_crypto_loan_position_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-common/position",
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

  @spec create_borrow_order_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Create Borrow Order
  Method: POST
  Path: /v5/crypto-loan-fixed/borrow
  Requires signature: true
  """
  def create_borrow_order_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/crypto-loan-fixed/borrow",
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
                "{\n    \"orderCurrency\": \"\",\n    \"orderAmount\": \"\",\n    \"annualRate\": \"0.02\",\n    \"term\": \"7\",\n    \"autoRepay\": \"\\\"true\\\"\",\n    \"repayType\": \"2\",\n    \"collateralList\": [\n        {\n            \"currency\": \"USDT\",\n            \"amount\": \"1\"\n        }\n    ]\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_borrow_contract_info_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Borrow Contract Info
  Method: GET
  Path: /v5/crypto-loan-fixed/borrow-contract-info
  Requires signature: true
  Optional: orderId, loanId, orderCurrency, term, limit, cursor
  """
  def get_borrow_contract_info_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-fixed/borrow-contract-info",
          query: [
            orderId: Keyword.get(opts, :orderId),
            loanId: Keyword.get(opts, :loanId),
            orderCurrency: Keyword.get(opts, :orderCurrency),
            term: Keyword.get(opts, :term),
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

  @spec cancel_borrow_order_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Cancel Borrow Order
  Method: POST
  Path: /v5/crypto-loan-fixed/borrow-order-cancel
  Requires signature: true
  """
  def cancel_borrow_order_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/crypto-loan-fixed/borrow-order-cancel",
          query: [],
          headers: [
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"orderId\": \"123456\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_borrow_order_info_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Borrow Order Info
  Method: GET
  Path: /v5/crypto-loan-fixed/borrow-order-info
  Requires signature: true
  Optional: orderId, orderCurrency, state, term, limit, cursor
  """
  def get_borrow_order_info_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-fixed/borrow-order-info",
          query: [
            orderId: Keyword.get(opts, :orderId),
            orderCurrency: Keyword.get(opts, :orderCurrency),
            state: Keyword.get(opts, :state),
            term: Keyword.get(opts, :term),
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

  @spec get_borrowing_market_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Borrowing Market
  Method: GET
  Path: /v5/crypto-loan-fixed/borrow-order-quote
  Requires signature: true
  Required: orderCurrency, orderBy
  Optional: term, sort, limit
  """
  def get_borrowing_market_v5(client, orderCurrency, orderBy, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-fixed/borrow-order-quote",
          query: [
            orderCurrency: orderCurrency,
            orderBy: orderBy,
            term: Keyword.get(opts, :term),
            sort: Keyword.get(opts, :sort),
            limit: Keyword.get(opts, :limit)
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

  @spec repay_crypto_loan_fixed_fully_repay(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Repay
  Method: POST
  Path: /v5/crypto-loan-fixed/fully-repay
  Requires signature: true
  """
  def repay_crypto_loan_fixed_fully_repay(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/crypto-loan-fixed/fully-repay",
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
                "{\n    \"loanId\": \"123456\",\n    \"loanCurrency\": \"loanId\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec renew_borrow_order_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Renew Borrow Order
  Method: POST
  Path: /v5/crypto-loan-fixed/renew
  Requires signature: true
  """
  def renew_borrow_order_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/crypto-loan-fixed/renew",
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
                "{\n    \"loanId\": \"123456\",\n    \"collateralList\": [\n        {\n            \"currency\": \"USDT\",\n            \"amount\": \"1\"\n        }\n    ]\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_renew_order_info_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Renew Order Info
  Method: GET
  Path: /v5/crypto-loan-fixed/renew-info
  Requires signature: true
  Optional: orderId, orderCurrency, limit, cursor
  """
  def get_renew_order_info_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-fixed/renew-info",
          query: [
            orderId: Keyword.get(opts, :orderId),
            orderCurrency: Keyword.get(opts, :orderCurrency),
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

  @spec collateral_repayment_crypto_loan_fixed_repay_collateral(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Collateral Repayment
  Method: POST
  Path: /v5/crypto-loan-fixed/repay-collateral
  Requires signature: true
  """
  def collateral_repayment_crypto_loan_fixed_repay_collateral(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/crypto-loan-fixed/repay-collateral",
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
                "{\n    \"loanId\": \"123456\",\n    \"loanCurrency\": \"\",\n    \"collateralCoin\": \"\",\n    \"amount\": \"1\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_repayment_history_crypto_loan_fixed_repayment_history(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Repayment History
  Method: GET
  Path: /v5/crypto-loan-fixed/repayment-history
  Requires signature: true
  Optional: repayId, loanCurrency, limit, cursor
  """
  def get_repayment_history_crypto_loan_fixed_repayment_history(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-fixed/repayment-history",
          query: [
            repayId: Keyword.get(opts, :repayId),
            loanCurrency: Keyword.get(opts, :loanCurrency),
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

  @spec create_supply_order_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Create Supply Order
  Method: POST
  Path: /v5/crypto-loan-fixed/supply
  Requires signature: true
  """
  def create_supply_order_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/crypto-loan-fixed/supply",
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
                "{\n    \"orderCurrency\": \"\",\n    \"orderAmount\": \"\",\n    \"annualRate\": \"0.02\",\n    \"term\": \"7\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_supply_contract_info_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Supply Contract Info
  Method: GET
  Path: /v5/crypto-loan-fixed/supply-contract-info
  Requires signature: true
  Optional: orderId, supplyId, supplyCurrency, term, limit, cursor
  """
  def get_supply_contract_info_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-fixed/supply-contract-info",
          query: [
            orderId: Keyword.get(opts, :orderId),
            supplyId: Keyword.get(opts, :supplyId),
            supplyCurrency: Keyword.get(opts, :supplyCurrency),
            term: Keyword.get(opts, :term),
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

  @spec cancel_supply_order_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Cancel Supply Order
  Method: POST
  Path: /v5/crypto-loan-fixed/supply-order-cancel
  Requires signature: true
  """
  def cancel_supply_order_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/crypto-loan-fixed/supply-order-cancel",
          query: [],
          headers: [
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"orderId\": \"123456\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_supply_order_info_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Supply Order Info
  Method: GET
  Path: /v5/crypto-loan-fixed/supply-order-info
  Requires signature: true
  Optional: orderId, orderCurrency, state, term, limit, cursor
  """
  def get_supply_order_info_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-fixed/supply-order-info",
          query: [
            orderId: Keyword.get(opts, :orderId),
            orderCurrency: Keyword.get(opts, :orderCurrency),
            state: Keyword.get(opts, :state),
            term: Keyword.get(opts, :term),
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

  @spec get_lending_market_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Lending Market
  Method: GET
  Path: /v5/crypto-loan-fixed/supply-order-quote
  Requires signature: true
  Required: orderCurrency, orderBy
  Optional: term, sort, limit
  """
  def get_lending_market_v5(client, orderCurrency, orderBy, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-fixed/supply-order-quote",
          query: [
            orderCurrency: orderCurrency,
            term: Keyword.get(opts, :term),
            orderBy: orderBy,
            sort: Keyword.get(opts, :sort),
            limit: Keyword.get(opts, :limit)
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

  @spec borrow_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Borrow
  Method: POST
  Path: /v5/crypto-loan-flexible/borrow
  Requires signature: true
  """
  def borrow_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/crypto-loan-flexible/borrow",
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
                "{\n    \"loanCurrency\": \"\",\n    \"loanAmount\": \"\",\n    \"collateralList\": [\n        {\n            \"currency\": \"USDT\",\n            \"amount\": \"1\"\n        }\n    ]\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_borrowing_history_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Borrowing History
  Method: GET
  Path: /v5/crypto-loan-flexible/borrow-history
  Requires signature: true
  Optional: orderId, loanCurrency, limit, cursor
  """
  def get_borrowing_history_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-flexible/borrow-history",
          query: [
            orderId: Keyword.get(opts, :orderId),
            loanCurrency: Keyword.get(opts, :loanCurrency),
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

  @spec get_flexible_loans_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Flexible Loans
  Method: GET
  Path: /v5/crypto-loan-flexible/ongoing-coin
  Requires signature: true
  Optional: loanCurrency
  """
  def get_flexible_loans_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-flexible/ongoing-coin",
          query: [loanCurrency: Keyword.get(opts, :loanCurrency)],
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

  @spec repay_crypto_loan_flexible_repay(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Repay
  Method: POST
  Path: /v5/crypto-loan-flexible/repay
  Requires signature: true
  """
  def repay_crypto_loan_flexible_repay(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/crypto-loan-flexible/repay",
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
              Keyword.get(opts, :body, "{\n    \"loanCurrency\": \"\",\n    \"amount\": \"1\"\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec collateral_repayment_crypto_loan_flexible_repay_collateral(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Collateral Repayment
  Method: POST
  Path: /v5/crypto-loan-flexible/repay-collateral
  Requires signature: true
  """
  def collateral_repayment_crypto_loan_flexible_repay_collateral(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/crypto-loan-flexible/repay-collateral",
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
                "{\n    \"loanCurrency\": \"\",\n    \"collateralCoin\": \"\",\n    \"amount\": \"1\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_repayment_history_crypto_loan_flexible_repayment_history(
          Bybit.Client.t(),
          Keyword.t()
        ) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Repayment History
  Method: GET
  Path: /v5/crypto-loan-flexible/repayment-history
  Requires signature: true
  Optional: repayId, loanCurrency, limit, cursor
  """
  def get_repayment_history_crypto_loan_flexible_repayment_history(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan-flexible/repayment-history",
          query: [
            repayId: Keyword.get(opts, :repayId),
            loanCurrency: Keyword.get(opts, :loanCurrency),
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
