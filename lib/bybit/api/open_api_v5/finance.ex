defmodule Bybit.API.OpenApiV5.Finance do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_custom_product_quote_v5(Bybit.Client.t(), term(), term(), term(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Custom Product Quote
  Method: GET
  Path: /v5/earn/advance/double-win-leverage
  Requires signature: true
  Required: productId, initialPrice, lowerPrice, upperPrice
  """
  def get_custom_product_quote_v5(client, productId, initialPrice, lowerPrice, upperPrice) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/advance/double-win-leverage",
          query: [
            productId: productId,
            initialPrice: initialPrice,
            lowerPrice: lowerPrice,
            upperPrice: upperPrice
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_redeem_estimated_amount_v5(Bybit.Client.t(), term(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Redeem Estimated Amount
  Method: GET
  Path: /v5/earn/advance/get-redeem-est-amount-list
  Requires signature: true
  Required: category, positionIds
  """
  def get_redeem_estimated_amount_v5(client, category, positionIds) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/advance/get-redeem-est-amount-list",
          query: [category: category, positionIds: positionIds],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_order_info_advance_order(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Order Info
  Method: GET
  Path: /v5/earn/advance/order
  Requires signature: true
  Required: category
  Optional: productId, orderId, orderLinkId, startTime, endTime, limit, cursor
  """
  def get_order_info_advance_order(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/advance/order",
          query: [
            category: category,
            productId: Keyword.get(opts, :productId),
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

  @spec place_order_advance_place_order(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Place Order
  Method: POST
  Path: /v5/earn/advance/place-order
  Requires signature: true
  """
  def place_order_advance_place_order(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/advance/place-order",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"SmartLeverage\",\n    \"productId\": \"123456\",\n    \"orderType\": \"Stake\",\n    \"amount\": \"1\",\n    \"accountType\": \"FUND\",\n    \"coin\": \"USDT\",\n    \"orderLinkId\": \"123456\",\n    \"smartLeverageStakeExtra\": {\n        \"initialPrice\": \"currentPrice\",\n        \"breakevenPrice\": \"\"\n    },\n    \"smartLeverageRedeemExtra\": {\n        \"positionId\": \"123456\",\n        \"estRedeemAmount\": \"\",\n        \"isSlippageProtected\": \"estRedeemAmount\"\n    }\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_position_info_advance_position(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Position Info
  Method: GET
  Path: /v5/earn/advance/position
  Requires signature: true
  Required: category
  Optional: productId, coin, limit, cursor
  """
  def get_position_info_advance_position(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/advance/position",
          query: [
            category: category,
            productId: Keyword.get(opts, :productId),
            coin: Keyword.get(opts, :coin),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_product_info_advance_product(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Product Info
  Method: GET
  Path: /v5/earn/advance/product
  Requires signature: true
  Required: category
  Optional: coin, duration
  """
  def get_product_info_advance_product(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/advance/product",
          query: [
            category: category,
            coin: Keyword.get(opts, :coin),
            duration: Keyword.get(opts, :duration)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_product_quote_v5(Bybit.Client.t(), term(), term()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Product Quote
  Method: GET
  Path: /v5/earn/advance/product-extra-info
  Requires signature: true
  Required: category, productId
  """
  def get_product_quote_v5(client, category, productId) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/advance/product-extra-info",
          query: [category: category, productId: productId],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec add_liquidity_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Add Liquidity
  Method: POST
  Path: /v5/earn/liquidity-mining/add-liquidity
  Requires signature: true
  """
  def add_liquidity_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/liquidity-mining/add-liquidity",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"productId\": \"123456\",\n    \"orderLinkId\": \"123456\",\n    \"quoteAmount\": \"quoteAmount\",\n    \"baseAmount\": \"quoteAmount\",\n    \"quoteAccountType\": \"FUND\",\n    \"baseAccountType\": \"FUND\",\n    \"leverage\": \"1\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec add_margin_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Add Margin
  Method: POST
  Path: /v5/earn/liquidity-mining/add-margin
  Requires signature: true
  """
  def add_margin_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/liquidity-mining/add-margin",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"productId\": \"123456\",\n    \"orderLinkId\": \"123456\",\n    \"positionId\": \"123456\",\n    \"amount\": \"1\",\n    \"quoteAccountType\": \"FUND\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec claim_interest_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Claim Interest
  Method: POST
  Path: /v5/earn/liquidity-mining/claim-interest
  Requires signature: true
  """
  def claim_interest_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/liquidity-mining/claim-interest",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw: Keyword.get(opts, :body, "{\n    \"productId\": \"123456\"\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_liquidation_records_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Liquidation Records
  Method: GET
  Path: /v5/earn/liquidity-mining/liquidation-records
  Requires signature: true
  Optional: baseCoin, quoteCoin, startTime, endTime, limit, cursor
  """
  def get_liquidation_records_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/liquidity-mining/liquidation-records",
          query: [
            baseCoin: Keyword.get(opts, :baseCoin),
            quoteCoin: Keyword.get(opts, :quoteCoin),
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

  @spec get_order_info_liquidity_mining_order(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Order Info
  Method: GET
  Path: /v5/earn/liquidity-mining/order
  Requires signature: true
  Optional: orderId, orderLinkId, productId, orderType, startTime, endTime, status, limit, cursor
  """
  def get_order_info_liquidity_mining_order(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/liquidity-mining/order",
          query: [
            orderId: Keyword.get(opts, :orderId),
            orderLinkId: Keyword.get(opts, :orderLinkId),
            productId: Keyword.get(opts, :productId),
            orderType: Keyword.get(opts, :orderType),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            status: Keyword.get(opts, :status),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_position_info_liquidity_mining_position(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Position Info
  Method: GET
  Path: /v5/earn/liquidity-mining/position
  Requires signature: true
  Optional: productId, baseCoin
  """
  def get_position_info_liquidity_mining_position(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/liquidity-mining/position",
          query: [
            productId: Keyword.get(opts, :productId),
            baseCoin: Keyword.get(opts, :baseCoin)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_product_info_liquidity_mining_product(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Product Info
  Method: GET
  Path: /v5/earn/liquidity-mining/product
  Requires signature: true
  Optional: baseCoin, quoteCoin
  """
  def get_product_info_liquidity_mining_product(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/liquidity-mining/product",
          query: [
            baseCoin: Keyword.get(opts, :baseCoin),
            quoteCoin: Keyword.get(opts, :quoteCoin)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec reinvest_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Reinvest
  Method: POST
  Path: /v5/earn/liquidity-mining/reinvest
  Requires signature: true
  """
  def reinvest_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/liquidity-mining/reinvest",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"productId\": \"123456\",\n    \"orderLinkId\": \"123456\",\n    \"positionId\": \"123456\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec remove_liquidity_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Remove Liquidity
  Method: POST
  Path: /v5/earn/liquidity-mining/remove-liquidity
  Requires signature: true
  """
  def remove_liquidity_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/liquidity-mining/remove-liquidity",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"productId\": \"123456\",\n    \"orderLinkId\": \"123456\",\n    \"positionId\": \"123456\",\n    \"removeRate\": 0,\n    \"removeType\": \"Normal\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_yield_records_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Yield Records
  Method: GET
  Path: /v5/earn/liquidity-mining/yield-records
  Requires signature: true
  Optional: baseCoin, quoteCoin, startTime, endTime, limit, cursor
  """
  def get_yield_records_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/liquidity-mining/yield-records",
          query: [
            baseCoin: Keyword.get(opts, :baseCoin),
            quoteCoin: Keyword.get(opts, :quoteCoin),
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

  @spec get_apr_history_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get APR History
  Method: GET
  Path: /v5/earn/apr-history
  Requires signature: true
  Required: category, productId
  Optional: startTime, endTime
  """
  def get_apr_history_v5(client, category, productId, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/apr-history",
          query: [
            category: category,
            productId: productId,
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_hourly_yield_history_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Hourly Yield History
  Method: GET
  Path: /v5/earn/hourly-yield
  Requires signature: true
  Required: category
  Optional: productId, startTime, endTime, limit, cursor
  """
  def get_hourly_yield_history_v5(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/hourly-yield",
          query: [
            category: category,
            productId: Keyword.get(opts, :productId),
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

  @spec get_stake_redeem_order_history_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Stake/Redeem Order History
  Method: GET
  Path: /v5/earn/order
  Requires signature: true
  Required: category
  Optional: orderId, orderLinkId, productId, startTime, endTime, limit, cursor
  """
  def get_stake_redeem_order_history_v5(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/order",
          query: [
            category: category,
            orderId: Keyword.get(opts, :orderId),
            orderLinkId: Keyword.get(opts, :orderLinkId),
            productId: Keyword.get(opts, :productId),
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

  @spec stake_redeem_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Stake / Redeem
  Method: POST
  Path: /v5/earn/place-order
  Requires signature: true
  """
  def stake_redeem_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/place-order",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"FlexibleSaving\",\n    \"orderType\": \"Stake\",\n    \"accountType\": \"FUND\",\n    \"amount\": \"1\",\n    \"coin\": \"USDT\",\n    \"productId\": \"123456\",\n    \"orderLinkId\": \"123456\",\n    \"redeemPositionId\": \"123456\",\n    \"toAccountType\": \"FUND\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_staked_position_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Staked Position
  Method: GET
  Path: /v5/earn/position
  Requires signature: true
  Required: category
  Optional: productId, coin
  """
  def get_staked_position_v5(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/position",
          query: [
            category: category,
            productId: Keyword.get(opts, :productId),
            coin: Keyword.get(opts, :coin)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec modify_position_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Modify Position
  Method: POST
  Path: /v5/earn/position/modify
  Requires signature: true
  """
  def modify_position_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/position/modify",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"OnChain\",\n    \"productId\": 0,\n    \"positionId\": 0,\n    \"autoReinvest\": 0\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_product_info_earn_product(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Product Info
  Method: GET
  Path: /v5/earn/product
  Requires signature: true
  Required: category
  Optional: coin
  """
  def get_product_info_earn_product(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/product",
          query: [category: category, coin: Keyword.get(opts, :coin)],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_yield_history_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Yield History
  Method: GET
  Path: /v5/earn/yield
  Requires signature: true
  Required: category
  Optional: productId, startTime, endTime, limit, cursor
  """
  def get_yield_history_v5(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/yield",
          query: [
            category: category,
            productId: Keyword.get(opts, :productId),
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

  @spec get_order_list_fixed_term_order(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Order List
  Method: GET
  Path: /v5/earn/fixed-term/order
  Requires signature: true
  Optional: orderType, productId, category, orderId, startTime, endTime, limit, cursor
  """
  def get_order_list_fixed_term_order(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/fixed-term/order",
          query: [
            orderType: Keyword.get(opts, :orderType),
            productId: Keyword.get(opts, :productId),
            category: Keyword.get(opts, :category),
            orderId: Keyword.get(opts, :orderId),
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

  @spec place_order_fixed_term_place_order(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Place Order
  Method: POST
  Path: /v5/earn/fixed-term/place-order
  Requires signature: true
  """
  def place_order_fixed_term_place_order(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/fixed-term/place-order",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"productId\": \"123456\",\n    \"category\": \"FixedTermSaving\",\n    \"coin\": \"USDT\",\n    \"amount\": \"1\",\n    \"accountType\": \"FUND\",\n    \"orderLinkId\": \"123456\",\n    \"autoInvest\": false\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_position_info_fixed_term_position(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Position Info
  Method: GET
  Path: /v5/earn/fixed-term/position
  Requires signature: true
  Optional: productId, category, coin
  """
  def get_position_info_fixed_term_position(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/fixed-term/position",
          query: [
            productId: Keyword.get(opts, :productId),
            category: Keyword.get(opts, :category),
            coin: Keyword.get(opts, :coin)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec set_auto_invest_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Set Auto-Invest
  Method: POST
  Path: /v5/earn/fixed-term/position/auto-invest
  Requires signature: true
  """
  def set_auto_invest_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/fixed-term/position/auto-invest",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"productId\": \"123456\",\n    \"category\": \"FixedTermSaving\",\n    \"positionId\": \"123456\",\n    \"status\": \"Enable\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_product_info_fixed_term_product(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Product Info
  Method: GET
  Path: /v5/earn/fixed-term/product
  Requires signature: true
  Optional: coin
  """
  def get_product_info_fixed_term_product(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/fixed-term/product",
          query: [coin: Keyword.get(opts, :coin)],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec redeem_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Redeem
  Method: POST
  Path: /v5/earn/fixed-term/redeem
  Requires signature: true
  """
  def redeem_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/fixed-term/redeem",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"productId\": \"123456\",\n    \"category\": \"FundPool\",\n    \"positionId\": \"123456\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_history_apr_v5(Bybit.Client.t(), term(), term()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get History APR
  Method: GET
  Path: /v5/earn/token/history-apr
  Requires signature: true
  Required: coin, range
  """
  def get_history_apr_v5(client, coin, range) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/token/history-apr",
          query: [coin: coin, range: range],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_hourly_yield_records_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Hourly Yield Records
  Method: GET
  Path: /v5/earn/token/hourly-yield
  Requires signature: true
  Required: coin
  Optional: startTime, endTime, cursor, limit
  """
  def get_hourly_yield_records_v5(client, coin, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/token/hourly-yield",
          query: [
            coin: coin,
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            cursor: Keyword.get(opts, :cursor),
            limit: Keyword.get(opts, :limit)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_order_list_token_order(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Order List
  Method: GET
  Path: /v5/earn/token/order
  Requires signature: true
  Required: coin
  Optional: orderLinkId, orderId, orderType, startTime, endTime, cursor, limit
  """
  def get_order_list_token_order(client, coin, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/token/order",
          query: [
            coin: coin,
            orderLinkId: Keyword.get(opts, :orderLinkId),
            orderId: Keyword.get(opts, :orderId),
            orderType: Keyword.get(opts, :orderType),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            cursor: Keyword.get(opts, :cursor),
            limit: Keyword.get(opts, :limit)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec place_order_token_place_order(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Place Order
  Method: POST
  Path: /v5/earn/token/place-order
  Requires signature: true
  """
  def place_order_token_place_order(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/token/place-order",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"coin\": \"USDT\",\n    \"orderLinkId\": \"123456\",\n    \"orderType\": \"Mint\",\n    \"amount\": \"1\",\n    \"accountType\": \"Mint\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_position_info_token_position(Bybit.Client.t(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Position Info
  Method: GET
  Path: /v5/earn/token/position
  Requires signature: true
  Required: coin
  """
  def get_position_info_token_position(client, coin) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/token/position",
          query: [coin: coin],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_product_info_token_product(Bybit.Client.t(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Product Info
  Method: GET
  Path: /v5/earn/token/product
  Requires signature: true
  Required: coin
  """
  def get_product_info_token_product(client, coin) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/token/product",
          query: [coin: coin],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_daily_yield_records_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Daily Yield Records
  Method: GET
  Path: /v5/earn/token/yield
  Requires signature: true
  Required: coin
  Optional: startTime, endTime, cursor, limit
  """
  def get_daily_yield_records_v5(client, coin, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/token/yield",
          query: [
            coin: coin,
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            cursor: Keyword.get(opts, :cursor),
            limit: Keyword.get(opts, :limit)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
