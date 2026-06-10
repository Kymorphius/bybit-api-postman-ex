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
          headers: [],
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
          headers: [],
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
  Optional: orderId, orderLinkId, productId, startTime, endTime, limit, cursor
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
            orderId: Keyword.get(opts, :orderId),
            orderLinkId: Keyword.get(opts, :orderLinkId),
            productId: Keyword.get(opts, :productId),
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
                "{\n    \"category\": \"SmartLeverage\",\n    \"productId\": \"123456\",\n    \"orderType\": \"Stake\",\n    \"amount\": \"1\",\n    \"coin\": \"USDT\",\n    \"accountType\": \"FUND\",\n    \"orderLinkId\": \"123456\",\n    \"discountBuyExtra\": {\n        \"initialPrice\": \"74571.32\",\n        \"purchasePrice\": \"74019\",\n        \"knockoutPrice\": \"76050\",\n        \"knockoutCouponE8\": \"1000000\",\n        \"settleType\": \"Base\",\n        \"instUid\": \"100307526\"\n    }\n}"
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
          headers: [],
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
  Optional: coin
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
          query: [category: category, coin: Keyword.get(opts, :coin)],
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec redeem_fixed_term_redeem(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Redeem
  Method: POST
  Path: /v5/earn/fixed-term/redeem
  Requires signature: true
  """
  def redeem_fixed_term_redeem(client, opts \\ []) do
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
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
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
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_airdrop_products_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Airdrop Products
  Method: GET
  Path: /v5/earn/hold-to-earn/product
  Requires signature: false
  """
  def get_airdrop_products_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/hold-to-earn/product",
          query: [],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_airdrop_daily_pnl_records_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Airdrop Daily PnL Records
  Method: GET
  Path: /v5/earn/hold-to-earn/yield-history
  Requires signature: false
  Required: limit
  Optional: timeStart, timeEnd, cursor
  """
  def get_airdrop_daily_pnl_records_v5(client, limit, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/hold-to-earn/yield-history",
          query: [
            timeStart: Keyword.get(opts, :timeStart),
            timeEnd: Keyword.get(opts, :timeEnd),
            limit: limit,
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_all_funds_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get All Funds
  Method: GET
  Path: /v5/earn/pwm/asset-manager/all-funds
  Requires signature: false
  Optional: coin, fundId, status, limit, cursor
  """
  def get_all_funds_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/pwm/asset-manager/all-funds",
          query: [
            coin: Keyword.get(opts, :coin),
            fundId: Keyword.get(opts, :fundId),
            status: Keyword.get(opts, :status),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_all_fund_orders_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get All Fund Orders
  Method: GET
  Path: /v5/earn/pwm/asset-manager/all-order
  Requires signature: false
  Optional: fundId, orderType, status, startTime, endTime, limit, cursor
  """
  def get_all_fund_orders_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/pwm/asset-manager/all-order",
          query: [
            fundId: Keyword.get(opts, :fundId),
            orderType: Keyword.get(opts, :orderType),
            status: Keyword.get(opts, :status),
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

  @spec create_fund_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Create Fund
  Variant: Pending Subscription
  Tags: pending_subscription
  Method: POST
  Path: /v5/earn/pwm/asset-manager/create-fund
  Requires signature: false
  """
  def create_fund_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/pwm/asset-manager/create-fund",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"fundName\": \"BTC Alpha Fund\",\n    \"coin\": \"BTC\",\n    \"profitShareRate\": \"20.00\",\n    \"managementFeeRate\": \"2.00\",\n    \"fundIntroduction\": \"\",\n    \"reqLinkId\": \"create-fund-001\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec create_investment_plan_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Create Investment Plan
  Method: POST
  Path: /v5/earn/pwm/asset-manager/create-investment-plan
  Requires signature: false
  """
  def create_investment_plan_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/pwm/asset-manager/create-investment-plan",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"accountUid\": \"800001\",\n    \"planName\": \"Conservative Growth Plan\",\n    \"planType\": \"stable\",\n    \"investmentDistribution\": [\n        {\n            \"productId\": \"12345\",\n            \"amount\": \"100000.00\"\n        }\n    ],\n    \"reqLinkId\": \"create-plan-001\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec create_fund_sub_account_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Create Fund Sub-Account
  Method: POST
  Path: /v5/earn/pwm/asset-manager/create-sub-account
  Requires signature: false
  """
  def create_fund_sub_account_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/pwm/asset-manager/create-sub-account",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"fundId\": \"100001\",\n    \"reqLinkId\": \"create-sub-001\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_investment_plans_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Investment Plans
  Method: GET
  Path: /v5/earn/pwm/asset-manager/get-investment-plan
  Requires signature: false
  Optional: planId, status, subscriptionUid, limit, cursor
  """
  def get_investment_plans_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/pwm/asset-manager/get-investment-plan",
          query: [
            planId: Keyword.get(opts, :planId),
            status: Keyword.get(opts, :status),
            subscriptionUid: Keyword.get(opts, :subscriptionUid),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec manage_investment_plan_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Manage Investment Plan
  Method: POST
  Path: /v5/earn/pwm/asset-manager/manage-investment-plan
  Requires signature: false
  """
  def manage_investment_plan_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/pwm/asset-manager/manage-investment-plan",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"planId\": \"10088\",\n    \"updateStatus\": \"Closed\",\n    \"updateFunds\": [\n        {\n            \"fundId\": \"430\",\n            \"amount\": \"100000\"\n        },\n        {\n            \"fundId\": \"2005\",\n            \"amount\": \"270000\"\n        }\n    ],\n    \"reqLinkId\": \"manage-plan-001\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec manage_order_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Manage Order
  Method: POST
  Path: /v5/earn/pwm/asset-manager/manage-order
  Requires signature: false
  """
  def manage_order_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/pwm/asset-manager/manage-order",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"orderId\": \"500002\",\n    \"action\": \"approve\",\n    \"reqLinkId\": \"manage-order-001\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec settle_fund_profit_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Settle Fund Profit
  Method: POST
  Path: /v5/earn/pwm/asset-manager/settle-profit
  Requires signature: false
  """
  def settle_fund_profit_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/pwm/asset-manager/settle-profit",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"fundId\": \"12323\",\n    \"reqLinkId\": \"settle-001\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec create_customize_investment_plan_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Create Customize Investment Plan
  Method: POST
  Path: /v5/earn/pwm/customize-plan/create
  Requires signature: false
  """
  def create_customize_investment_plan_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/pwm/customize-plan/create",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"accountType\": \"FUND\",\n    \"products\": [\n        {\n            \"category\": \"equityFund\",\n            \"productId\": \"2001\",\n            \"fundName\": \"Market Neutral Alpha\",\n            \"amount\": \"100000.00\"\n        },\n        {\n            \"category\": \"multiCoinEarning\",\n            \"productId\": \"430\",\n            \"fundName\": \"\",\n            \"amount\": \"50000.00\"\n        }\n    ]\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_subscribable_product_info_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Subscribable Product Info
  Method: GET
  Path: /v5/earn/pwm/customize-plan/product
  Requires signature: false
  """
  def get_subscribable_product_info_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/pwm/customize-plan/product",
          query: [],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec fund_transfer_between_sub_accounts_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Fund Transfer Between Sub-Accounts
  Method: POST
  Path: /v5/earn/pwm/fund-transfer
  Requires signature: false
  """
  def fund_transfer_between_sub_accounts_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/pwm/fund-transfer",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"transferId\": \"4fdf-re-4343-frewr\",\n    \"fromUserId\": \"800001\",\n    \"toUserId\": \"800002\",\n    \"amount\": \"1.00\",\n    \"coin\": \"BTC\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_all_investment_plans_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get All Investment Plans
  Method: GET
  Path: /v5/earn/pwm/investment-plan/all
  Requires signature: false
  Optional: planId, status, limit, cursor
  """
  def get_all_investment_plans_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/pwm/investment-plan/all",
          query: [
            planId: Keyword.get(opts, :planId),
            status: Keyword.get(opts, :status),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_asset_trend_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Asset Trend
  Method: GET
  Path: /v5/earn/pwm/investment-plan/asset-trend
  Requires signature: false
  Required: planId
  Optional: startTime, endTime
  """
  def get_asset_trend_v5(client, planId, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/pwm/investment-plan/asset-trend",
          query: [
            planId: planId,
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec claim_withdrawable_funds_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Claim Withdrawable Funds
  Method: POST
  Path: /v5/earn/pwm/investment-plan/claim
  Requires signature: false
  """
  def claim_withdrawable_funds_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/pwm/investment-plan/claim",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"planId\": \"10001\",\n    \"toAccountType\": \"FUND\",\n    \"orderLinkId\": \"claim-order-001\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_investment_plan_detail_v5(Bybit.Client.t(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Investment Plan Detail
  Method: GET
  Path: /v5/earn/pwm/investment-plan/detail
  Requires signature: false
  Required: planId
  """
  def get_investment_plan_detail_v5(client, planId) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/pwm/investment-plan/detail",
          query: [planId: planId],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_fund_historical_nav_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Fund Historical NAV
  Method: GET
  Path: /v5/earn/pwm/investment-plan/fund-nav
  Requires signature: false
  Required: fundId
  Optional: startTime, endTime
  """
  def get_fund_historical_nav_v5(client, fundId, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/pwm/investment-plan/fund-nav",
          query: [
            fundId: fundId,
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec invest_more_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Invest More
  Method: POST
  Path: /v5/earn/pwm/investment-plan/invest-more
  Requires signature: false
  """
  def invest_more_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/pwm/investment-plan/invest-more",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"planId\": \"10001\",\n    \"accountType\": \"FUND\",\n    \"category\": \"equityFund\",\n    \"productId\": \"2001\",\n    \"amount\": \"20000.00\",\n    \"orderLinkId\": \"xxx\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_pending_investment_plan_detail_v5(Bybit.Client.t(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Pending Investment Plan Detail
  Method: GET
  Path: /v5/earn/pwm/investment-plan/new-plan
  Requires signature: false
  Required: planId
  """
  def get_pending_investment_plan_detail_v5(client, planId) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/pwm/investment-plan/new-plan",
          query: [planId: planId],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_investment_plan_orders_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Investment Plan Orders
  Method: GET
  Path: /v5/earn/pwm/investment-plan/order
  Requires signature: false
  Optional: planId, category, type, status, startTime, endTime, limit, cursor, orderLinkId
  """
  def get_investment_plan_orders_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/pwm/investment-plan/order",
          query: [
            planId: Keyword.get(opts, :planId),
            category: Keyword.get(opts, :category),
            type: Keyword.get(opts, :type),
            status: Keyword.get(opts, :status),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor),
            orderLinkId: Keyword.get(opts, :orderLinkId)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec redeem_investment_plan_redeem(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Redeem
  Method: POST
  Path: /v5/earn/pwm/investment-plan/redeem
  Requires signature: false
  """
  def redeem_investment_plan_redeem(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/pwm/investment-plan/redeem",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"planId\": \"10001\",\n    \"category\": \"equityFund\",\n    \"productId\": \"2001\",\n    \"shares\": \"3000\",\n    \"amount\": \"1\",\n    \"orderLinkId\": \"xxx\",\n    \"positionId\": \"123456\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec subscribe_investment_plan_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Subscribe Investment Plan
  Method: POST
  Path: /v5/earn/pwm/investment-plan/subscribe
  Requires signature: false
  """
  def subscribe_investment_plan_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/pwm/investment-plan/subscribe",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"planId\": \"10001\",\n    \"accountType\": \"FUND\",\n    \"orderLinkId\": \"xxx\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_fund_transfer_records_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Fund Transfer Records
  Method: GET
  Path: /v5/earn/pwm/query-fund-transfer-result
  Requires signature: false
  Optional: transferId, fromUserId
  """
  def get_fund_transfer_records_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/pwm/query-fund-transfer-result",
          query: [
            transferId: Keyword.get(opts, :transferId),
            fromUserId: Keyword.get(opts, :fromUserId)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_nav_chart_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get NAV Chart
  Method: GET
  Path: /v5/earn/rwa/nav-chart
  Requires signature: false
  Required: productId
  Optional: startTime, endTime
  """
  def get_nav_chart_v5(client, productId, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/rwa/nav-chart",
          query: [
            productId: productId,
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_order_list_rwa_order(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Order List
  Method: GET
  Path: /v5/earn/rwa/order
  Requires signature: false
  Optional: orderId, orderLinkId, orderType, productId, startTime, endTime, limit, cursor
  """
  def get_order_list_rwa_order(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/rwa/order",
          query: [
            orderId: Keyword.get(opts, :orderId),
            orderLinkId: Keyword.get(opts, :orderLinkId),
            orderType: Keyword.get(opts, :orderType),
            productId: Keyword.get(opts, :productId),
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

  @spec place_order_rwa_place_order(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Place Order
  Method: POST
  Path: /v5/earn/rwa/place-order
  Requires signature: false
  """
  def place_order_rwa_place_order(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "POST",
          base_url: base_url,
          url: "/v5/earn/rwa/place-order",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"productId\": 1001,\n    \"orderType\": \"Stake\",\n    \"coin\": \"USDC\",\n    \"orderLinkId\": \"my-stake-001\",\n    \"stakeAmount\": \"100\",\n    \"redeemShares\": \"orderType=Redeem\",\n    \"accountType\": \"FUND\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_position_list_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Position List
  Method: GET
  Path: /v5/earn/rwa/position
  Requires signature: false
  """
  def get_position_list_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/rwa/position",
          query: [],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_product_list_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Product List
  Method: GET
  Path: /v5/earn/rwa/product
  Requires signature: false
  Optional: coin
  """
  def get_product_list_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/earn/rwa/product",
          query: [coin: Keyword.get(opts, :coin)],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
