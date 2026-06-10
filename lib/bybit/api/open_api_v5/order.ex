defmodule Bybit.API.OpenApiV5.Order do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec place_order_linear_market_order_create(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Place Order
  Variant: Linear Market
  Tags: linear_market
  Method: POST
  Path: /v5/order/create
  Requires signature: true
  """
  def place_order_linear_market_order_create(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/order/create",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"linear\",\n    \"symbol\": \"BTCUSDT\",\n    \"isLeverage\": 0,\n    \"side\": \"Buy\",\n    \"orderType\": \"Market\",\n    \"qty\": \"0.001\",\n    \"marketUnit\": \"qty\",\n    \"rpiTakerAccess\": false,\n    \"slippageToleranceType\": \"TickSize\",\n    \"slippageTolerance\": \"1\",\n    \"price\": \"1\",\n    \"triggerDirection\": 0,\n    \"orderFilter\": \"Order\",\n    \"triggerPrice\": \"1\",\n    \"triggerBy\": \"LastPrice\",\n    \"orderIv\": \"0.1\",\n    \"timeInForce\": \"IOC\",\n    \"positionIdx\": 0,\n    \"orderLinkId\": \"123456\",\n    \"takeProfit\": \"1\",\n    \"stopLoss\": \"1\",\n    \"tpTriggerBy\": \"MarkPrice\",\n    \"slTriggerBy\": \"MarkPrice\",\n    \"reduceOnly\": false,\n    \"closeOnTrigger\": false,\n    \"smpType\": \"\",\n    \"mmp\": false,\n    \"tpslMode\": \"Full\",\n    \"tpLimitPrice\": \"1\",\n    \"slLimitPrice\": \"1\",\n    \"tpOrderType\": \"Market\",\n    \"slOrderType\": \"Market\",\n    \"bboSideType\": \"Queue\",\n    \"bboLevel\": \"2\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec place_order_option_limit_order_create(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Place Order
  Variant: Option Limit
  Tags: option_limit
  Method: POST
  Path: /v5/order/create
  Requires signature: true
  """
  def place_order_option_limit_order_create(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/order/create",
          query: [],
          headers: [
            {"X-BAPI-SIGN-TYPE", "2"},
            {"Content-Type", "application/json"},
            {"cdn-request-id", "ttt-002"}
          ],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"option\",\n    \"symbol\": \"BTC-21APR23-20000-C\",\n    \"isLeverage\": 0,\n    \"side\": \"Buy\",\n    \"orderType\": \"Market\",\n    \"qty\": \"0.01\",\n    \"marketUnit\": \"qty\",\n    \"rpiTakerAccess\": false,\n    \"slippageToleranceType\": \"TickSize\",\n    \"slippageTolerance\": \"1\",\n    \"price\": \"8000\",\n    \"triggerDirection\": 0,\n    \"orderFilter\": \"Order\",\n    \"triggerPrice\": \"1\",\n    \"triggerBy\": \"LastPrice\",\n    \"orderIv\": \"0.1\",\n    \"timeInForce\": \"IOC\",\n    \"positionIdx\": 0,\n    \"orderLinkId\": \"123456\",\n    \"takeProfit\": \"1\",\n    \"stopLoss\": \"1\",\n    \"tpTriggerBy\": \"MarkPrice\",\n    \"slTriggerBy\": \"MarkPrice\",\n    \"reduceOnly\": false,\n    \"closeOnTrigger\": false,\n    \"smpType\": \"\",\n    \"mmp\": false,\n    \"tpslMode\": \"Full\",\n    \"tpLimitPrice\": \"1\",\n    \"slLimitPrice\": \"1\",\n    \"tpOrderType\": \"Market\",\n    \"slOrderType\": \"Market\",\n    \"bboSideType\": \"Queue\",\n    \"bboLevel\": \"2\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec place_order_spot_limit_order_create(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Place Order
  Variant: Spot Limit
  Tags: spot_limit
  Method: POST
  Path: /v5/order/create
  Requires signature: true
  """
  def place_order_spot_limit_order_create(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/order/create",
          query: [],
          headers: [
            {"X-BAPI-SIGN-TYPE", "2"},
            {"Content-Type", "application/json"},
            {"cdn-request-id", "ttt-002"}
          ],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"spot\",\n    \"symbol\": \"BTCUSDT\",\n    \"isLeverage\": 0,\n    \"side\": \"Sell\",\n    \"orderType\": \"Market\",\n    \"qty\": \"0.001\",\n    \"marketUnit\": \"qty\",\n    \"rpiTakerAccess\": false,\n    \"slippageToleranceType\": \"TickSize\",\n    \"slippageTolerance\": \"1\",\n    \"price\": \"30000\",\n    \"triggerDirection\": 0,\n    \"orderFilter\": \"Order\",\n    \"triggerPrice\": \"1\",\n    \"triggerBy\": \"LastPrice\",\n    \"orderIv\": \"0.1\",\n    \"timeInForce\": \"IOC\",\n    \"positionIdx\": 0,\n    \"orderLinkId\": \"123456\",\n    \"takeProfit\": \"1\",\n    \"stopLoss\": \"1\",\n    \"tpTriggerBy\": \"MarkPrice\",\n    \"slTriggerBy\": \"MarkPrice\",\n    \"reduceOnly\": false,\n    \"closeOnTrigger\": false,\n    \"smpType\": \"\",\n    \"mmp\": false,\n    \"tpslMode\": \"Full\",\n    \"tpLimitPrice\": \"1\",\n    \"slLimitPrice\": \"1\",\n    \"tpOrderType\": \"Market\",\n    \"slOrderType\": \"Market\",\n    \"bboSideType\": \"Queue\",\n    \"bboLevel\": \"2\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec place_order_inverse_limit_order_create(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Place Order
  Variant: Inverse Limit
  Tags: inverse_limit
  Method: POST
  Path: /v5/order/create
  Requires signature: true
  """
  def place_order_inverse_limit_order_create(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/order/create",
          query: [],
          headers: [
            {"X-BAPI-SIGN-TYPE", "2"},
            {"Content-Type", "application/json"},
            {"cdn-request-id", "ttt-002"}
          ],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"inverse\",\n    \"symbol\": \"ETHUSD\",\n    \"isLeverage\": 0,\n    \"side\": \"Buy\",\n    \"orderType\": \"Market\",\n    \"qty\": \"0.1\",\n    \"marketUnit\": \"qty\",\n    \"rpiTakerAccess\": false,\n    \"slippageToleranceType\": \"TickSize\",\n    \"slippageTolerance\": \"1\",\n    \"price\": \"1818.00\",\n    \"triggerDirection\": 0,\n    \"orderFilter\": \"Order\",\n    \"triggerPrice\": \"1\",\n    \"triggerBy\": \"LastPrice\",\n    \"orderIv\": \"0.1\",\n    \"timeInForce\": \"IOC\",\n    \"positionIdx\": 0,\n    \"orderLinkId\": \"123456\",\n    \"takeProfit\": \"1\",\n    \"stopLoss\": \"1\",\n    \"tpTriggerBy\": \"MarkPrice\",\n    \"slTriggerBy\": \"MarkPrice\",\n    \"reduceOnly\": false,\n    \"closeOnTrigger\": false,\n    \"smpType\": \"\",\n    \"mmp\": false,\n    \"tpslMode\": \"Full\",\n    \"tpLimitPrice\": \"1\",\n    \"slLimitPrice\": \"1\",\n    \"tpOrderType\": \"Market\",\n    \"slOrderType\": \"Market\",\n    \"bboSideType\": \"Queue\",\n    \"bboLevel\": \"2\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec place_order_spot_conditional_order_create(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Place Order
  Variant: Spot Conditional
  Tags: spot_conditional
  Method: POST
  Path: /v5/order/create
  Requires signature: true
  """
  def place_order_spot_conditional_order_create(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/order/create",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"spot\",\n    \"symbol\": \"BTCUSDT\",\n    \"isLeverage\": 0,\n    \"side\": \"Buy\",\n    \"orderType\": \"Market\",\n    \"qty\": \"0.001\",\n    \"marketUnit\": \"qty\",\n    \"rpiTakerAccess\": false,\n    \"slippageToleranceType\": \"TickSize\",\n    \"slippageTolerance\": \"1\",\n    \"price\": \"20000\",\n    \"triggerDirection\": 1,\n    \"orderFilter\": \"tpslOrder\",\n    \"triggerPrice\": \"27265\",\n    \"triggerBy\": \"LastPrice\",\n    \"orderIv\": \"0.1\",\n    \"timeInForce\": \"IOC\",\n    \"positionIdx\": 0,\n    \"orderLinkId\": \"123456\",\n    \"takeProfit\": \"1\",\n    \"stopLoss\": \"1\",\n    \"tpTriggerBy\": \"MarkPrice\",\n    \"slTriggerBy\": \"MarkPrice\",\n    \"reduceOnly\": false,\n    \"closeOnTrigger\": false,\n    \"smpType\": \"\",\n    \"mmp\": false,\n    \"tpslMode\": \"Full\",\n    \"tpLimitPrice\": \"1\",\n    \"slLimitPrice\": \"1\",\n    \"tpOrderType\": \"Market\",\n    \"slOrderType\": \"Market\",\n    \"bboSideType\": \"Queue\",\n    \"bboLevel\": \"2\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec batch_place_order_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Batch Place Order
  Method: POST
  Path: /v5/order/create-batch
  Requires signature: true
  """
  def batch_place_order_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/order/create-batch",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"linear\",\n    \"request\": [\n        {\n            \"symbol\": \"BTC-10FEB23-24000-C\",\n            \"isLeverage\": 0,\n            \"side\": \"Buy\",\n            \"orderType\": \"Market\",\n            \"qty\": \"0.1\",\n            \"marketUnit\": \"qty\",\n            \"price\": \"5\",\n            \"triggerDirection\": 0,\n            \"orderFilter\": \"Order\",\n            \"triggerPrice\": \"1\",\n            \"triggerBy\": \"LastPrice\",\n            \"orderIv\": \"0.1\",\n            \"timeInForce\": \"IOC\",\n            \"positionIdx\": 0,\n            \"orderLinkId\": \"9b381bb1-401\",\n            \"takeProfit\": \"1\",\n            \"stopLoss\": \"1\",\n            \"tpTriggerBy\": \"MarkPrice\",\n            \"slTriggerBy\": \"MarkPrice\",\n            \"reduceOnly\": false,\n            \"closeOnTrigger\": false,\n            \"smpType\": \"\",\n            \"mmp\": false,\n            \"tpslMode\": \"Full\",\n            \"tpLimitPrice\": \"1\",\n            \"slLimitPrice\": \"1\",\n            \"tpOrderType\": \"Market\",\n            \"slOrderType\": \"Market\"\n        },\n        {\n            \"symbol\": \"BTC-10FEB23-24000-C\",\n            \"isLeverage\": 0,\n            \"side\": \"Buy\",\n            \"orderType\": \"Market\",\n            \"qty\": \"0.1\",\n            \"marketUnit\": \"qty\",\n            \"price\": \"5\",\n            \"triggerDirection\": 0,\n            \"orderFilter\": \"Order\",\n            \"triggerPrice\": \"1\",\n            \"triggerBy\": \"LastPrice\",\n            \"orderIv\": \"0.1\",\n            \"timeInForce\": \"IOC\",\n            \"positionIdx\": 0,\n            \"orderLinkId\": \"82ee86dd-001\",\n            \"takeProfit\": \"1\",\n            \"stopLoss\": \"1\",\n            \"tpTriggerBy\": \"MarkPrice\",\n            \"slTriggerBy\": \"MarkPrice\",\n            \"reduceOnly\": false,\n            \"closeOnTrigger\": false,\n            \"smpType\": \"\",\n            \"mmp\": false,\n            \"tpslMode\": \"Full\",\n            \"tpLimitPrice\": \"1\",\n            \"slLimitPrice\": \"1\",\n            \"tpOrderType\": \"Market\",\n            \"slOrderType\": \"Market\"\n        }\n    ]\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec batch_amend_order_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Batch Amend Order
  Method: POST
  Path: /v5/order/amend-batch
  Requires signature: true
  """
  def batch_amend_order_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/order/amend-batch",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"linear\",\n    \"request\": [\n        {\n            \"symbol\": \"BTC-30DEC22-44000-C\",\n            \"orderId\": \"123456\",\n            \"orderLinkId\": \"123456\",\n            \"orderIv\": \"0.1\",\n            \"triggerPrice\": \"1\",\n            \"qty\": \"0.1\",\n            \"price\": \"1\",\n            \"tpslMode\": \"Full\",\n            \"takeProfit\": \"1\",\n            \"stopLoss\": \"1\",\n            \"tpTriggerBy\": \"LastPrice\",\n            \"slTriggerBy\": \"LastPrice\",\n            \"triggerBy\": \"LastPrice\",\n            \"tpLimitPrice\": \"1\",\n            \"slLimitPrice\": \"1\"\n        },\n        {\n            \"symbol\": \"BTCUSDT\",\n            \"orderId\": \"60c257f9-57cc-47a3-95cb-811f55fa793c\",\n            \"orderLinkId\": \"82ee86dd-00\",\n            \"orderIv\": \"0.1\",\n            \"triggerPrice\": \"1\",\n            \"qty\": \"0.1\",\n            \"price\": \"1\",\n            \"tpslMode\": \"Full\",\n            \"takeProfit\": \"1\",\n            \"stopLoss\": \"1\",\n            \"tpTriggerBy\": \"LastPrice\",\n            \"slTriggerBy\": \"LastPrice\",\n            \"triggerBy\": \"LastPrice\",\n            \"tpLimitPrice\": \"1\",\n            \"slLimitPrice\": \"1\"\n        }\n    ]\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec batch_cancel_order_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Batch Cancel Order
  Method: POST
  Path: /v5/order/cancel-batch
  Requires signature: true
  """
  def batch_cancel_order_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/order/cancel-batch",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"linear\",\n    \"request\": [\n        {\n            \"symbol\": \"BTC-30DEC22-44000-C\",\n            \"orderId\": \"0ccd205e-5145-4f27-9402-2f47674098fa\",\n            \"orderLinkId\": \"4197d261-d2\"\n        },\n        {\n            \"symbol\": \"BTC-30DEC22-44000-C\",\n            \"orderId\": \"17f51491-584f-41c4-ae22-c9cdf916b1db\",\n            \"orderLinkId\": \"90d272e8-24\"\n        }\n    ]\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec amend_order_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Amend Order
  Method: POST
  Path: /v5/order/amend
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
          url: "/v5/order/amend",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"linear\",\n    \"symbol\": \"BTCUSDT\",\n    \"orderId\": \"a51bdc00-40e8-494f-b38a-1120fdaeecc3\",\n    \"orderLinkId\": \"123456\",\n    \"orderIv\": \"0.1\",\n    \"triggerPrice\": \"1\",\n    \"qty\": \"0.001\",\n    \"price\": \"28000\",\n    \"tpslMode\": \"Full\",\n    \"takeProfit\": \"1\",\n    \"stopLoss\": \"1\",\n    \"tpTriggerBy\": \"LastPrice\",\n    \"slTriggerBy\": \"LastPrice\",\n    \"triggerBy\": \"LastPrice\",\n    \"tpLimitPrice\": \"1\",\n    \"slLimitPrice\": \"1\"\n}"
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
  Path: /v5/order/cancel
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
          url: "/v5/order/cancel",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"linear\",\n    \"symbol\": \"BTCUSDT\",\n    \"orderId\": \"9d3ef617-f214-4818-979e-20b44256dbec\",\n    \"orderLinkId\": \"123456\",\n    \"orderFilter\": \"Order\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec cancel_all_orders_time_window_order_cancel_all(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Cancel All Orders
  Variant: Time Window
  Tags: time_window
  Method: POST
  Path: /v5/order/cancel-all
  Requires signature: true
  """
  def cancel_all_orders_time_window_order_cancel_all(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/order/cancel-all",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"linear\",\n    \"symbol\": \"BTCUSDT\",\n    \"baseCoin\": \"BTC\",\n    \"settleCoin\": \"linear\",\n    \"orderFilter\": \"spot\",\n    \"stopOrderType\": \"Stop\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec cancel_all_orders_spot_order_cancel_all(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Cancel All Orders
  Variant: Spot
  Tags: spot
  Method: POST
  Path: /v5/order/cancel-all
  Requires signature: true
  """
  def cancel_all_orders_spot_order_cancel_all(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/order/cancel-all",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"category\": \"linear\",\n    \"symbol\": \"BTCUSDT\",\n    \"baseCoin\": \"BTC\",\n    \"settleCoin\": \"USDT\",\n    \"orderFilter\": \"spot\",\n    \"stopOrderType\": \"Stop\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_open_closed_orders_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Open & Closed Orders
  Method: GET
  Path: /v5/order/realtime
  Requires signature: true
  Required: category, orderId
  Optional: symbol, baseCoin, settleCoin, orderLinkId, openOnly, orderFilter, limit, cursor
  """
  def get_open_closed_orders_v5(client, category, orderId, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/order/realtime",
          query: [
            category: category,
            symbol: Keyword.get(opts, :symbol),
            baseCoin: Keyword.get(opts, :baseCoin),
            settleCoin: Keyword.get(opts, :settleCoin),
            orderId: orderId,
            orderLinkId: Keyword.get(opts, :orderLinkId),
            openOnly: Keyword.get(opts, :openOnly),
            orderFilter: Keyword.get(opts, :orderFilter),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"cdn-request-id", "tttt"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_order_history_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Order History
  Method: GET
  Path: /v5/order/history
  Requires signature: true
  Required: category, orderId
  Optional: symbol, baseCoin, settleCoin, orderLinkId, orderFilter, orderStatus, startTime, endTime, limit, cursor
  """
  def get_order_history_v5(client, category, orderId, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/order/history",
          query: [
            category: category,
            symbol: Keyword.get(opts, :symbol),
            baseCoin: Keyword.get(opts, :baseCoin),
            settleCoin: Keyword.get(opts, :settleCoin),
            orderId: orderId,
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

  @spec get_borrow_quota_v5(Bybit.Client.t(), term(), term(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Borrow Quota
  Variant: Spot
  Tags: spot
  Method: GET
  Path: /v5/order/spot-borrow-check
  Requires signature: true
  Required: category, symbol, side
  """
  def get_borrow_quota_v5(client, category, symbol, side) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/order/spot-borrow-check",
          query: [category: category, symbol: symbol, side: side],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_trade_history_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Trade History
  Method: GET
  Path: /v5/execution/list
  Requires signature: true
  Required: category, symbol
  Optional: orderId, orderLinkId, baseCoin, settleCoin, startTime, endTime, execType, limit, cursor
  """
  def get_trade_history_v5(client, category, symbol, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/execution/list",
          query: [
            category: category,
            symbol: symbol,
            orderId: Keyword.get(opts, :orderId),
            orderLinkId: Keyword.get(opts, :orderLinkId),
            baseCoin: Keyword.get(opts, :baseCoin),
            settleCoin: Keyword.get(opts, :settleCoin),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            execType: Keyword.get(opts, :execType),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec pre_check_order_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Pre Check Order
  Method: POST
  Path: /v5/order/pre-check
  Requires signature: true
  """
  def pre_check_order_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/order/pre-check",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
