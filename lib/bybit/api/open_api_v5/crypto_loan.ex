defmodule Bybit.API.OpenApiV5.CryptoLoan do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_unpaid_loans_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Unpaid Loans
  Method: GET
  Path: /v5/crypto-loan/ongoing-orders
  Requires signature: true
  Optional: orderId, loanCurrency, collateralCurrency, loanTermType, loanTerm, limit, cursor
  """
  def get_unpaid_loans_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan/ongoing-orders",
          query: [
            orderId: Keyword.get(opts, :orderId),
            loanCurrency: Keyword.get(opts, :loanCurrency),
            collateralCurrency: Keyword.get(opts, :collateralCurrency),
            loanTermType: Keyword.get(opts, :loanTermType),
            loanTerm: Keyword.get(opts, :loanTerm),
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

  @spec get_max_allowed_collateral_reduction_amount_v5(Bybit.Client.t(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Max. Allowed Collateral Reduction Amount
  Method: GET
  Path: /v5/crypto-loan/max-collateral-amount
  Requires signature: true
  Required: orderId
  """
  def get_max_allowed_collateral_reduction_amount_v5(client, orderId) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan/max-collateral-amount",
          query: [orderId: orderId],
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

  @spec get_completed_loan_history_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Completed Loan History
  Method: GET
  Path: /v5/crypto-loan/borrow-history
  Requires signature: true
  Optional: orderId, loanCurrency, collateralCurrency, limit, cursor
  """
  def get_completed_loan_history_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan/borrow-history",
          query: [
            orderId: Keyword.get(opts, :orderId),
            loanCurrency: Keyword.get(opts, :loanCurrency),
            collateralCurrency: Keyword.get(opts, :collateralCurrency),
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

  @spec get_collateral_coins_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Collateral Coins
  Method: GET
  Path: /v5/crypto-loan/collateral-data
  Requires signature: true
  Optional: vipLevel, currency
  """
  def get_collateral_coins_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan/collateral-data",
          query: [vipLevel: Keyword.get(opts, :vipLevel), currency: Keyword.get(opts, :currency)],
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

  @spec get_loan_ltv_adjustment_history_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Loan LTV Adjustment History
  Method: GET
  Path: /v5/crypto-loan/adjustment-history
  Requires signature: true
  Optional: orderId, adjustId, collateralCurrency, limit, cursor
  """
  def get_loan_ltv_adjustment_history_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan/adjustment-history",
          query: [
            orderId: Keyword.get(opts, :orderId),
            adjustId: Keyword.get(opts, :adjustId),
            collateralCurrency: Keyword.get(opts, :collateralCurrency),
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

  @spec borrow_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Borrow
  Method: POST
  Path: /v5/crypto-loan/borrow
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
          url: "/v5/crypto-loan/borrow",
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
                "{\n    \"loanCurrency\": \"USDT\",\n    \"loanAmount\": \"550\",\n    \"loanTerm\": \"7\",\n    \"collateralCurrency\": \"BTC\",\n    \"collateralAmount\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec repay_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Repay
  Method: POST
  Path: /v5/crypto-loan/repay
  Requires signature: true
  """
  def repay_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/crypto-loan/repay",
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
                "{\n    \"orderId\": \"1794531321268959232\",\n    \"amount\": \"0.000771\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec adjust_collateral_amount_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Adjust Collateral Amount
  Method: POST
  Path: /v5/crypto-loan/adjust-ltv
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
          url: "/v5/crypto-loan/adjust-ltv",
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
                "{\n    \"orderId\": \"1794531321268959232\",\n    \"amount\": \"550\",\n    \"direction\": \"0\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_account_borrowable_collateralizable_limit_v5(Bybit.Client.t(), term(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Account Borrowable/Collateralizable Limit
  Method: GET
  Path: /v5/crypto-loan/borrowable-collateralisable-number
  Requires signature: true
  Required: loanCurrency, collateralCurrency
  """
  def get_account_borrowable_collateralizable_limit_v5(client, loanCurrency, collateralCurrency) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan/borrowable-collateralisable-number",
          query: [loanCurrency: loanCurrency, collateralCurrency: collateralCurrency],
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
  Path: /v5/crypto-loan/loanable-data
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
          url: "/v5/crypto-loan/loanable-data",
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

  @spec get_loan_repayment_history_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Loan Repayment History
  Method: GET
  Path: /v5/crypto-loan/repayment-history
  Requires signature: true
  Optional: orderId, repayId, loanCurrency, limit, cursor
  """
  def get_loan_repayment_history_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/crypto-loan/repayment-history",
          query: [
            orderId: Keyword.get(opts, :orderId),
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
