defmodule Bybit.API.OpenApiV5.Alpha do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_asset_detail_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Asset Detail
  Method: POST
  Path: /v5/alpha/trade/asset-detail
  Requires signature: true
  """
  def get_asset_detail_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/alpha/trade/asset-detail",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"chainCode\": \"ETH\",\n    \"tokenAddress\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_asset_list_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Asset List
  Method: POST
  Path: /v5/alpha/trade/asset-list
  Requires signature: true
  """
  def get_asset_list_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/alpha/trade/asset-list",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_token_details_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Token Details
  Method: POST
  Path: /v5/alpha/trade/biz-token-details
  Requires signature: true
  """
  def get_token_details_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/alpha/trade/biz-token-details",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"chainCode\": \"ETH\",\n    \"tokenAddress\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_biz_token_list_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Biz Token List
  Method: POST
  Path: /v5/alpha/trade/biz-token-list
  Requires signature: true
  """
  def get_biz_token_list_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/alpha/trade/biz-token-list",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"tokenTag\": 0\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_token_price_list_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Token Price List
  Method: POST
  Path: /v5/alpha/trade/biz-token-price-list
  Requires signature: true
  """
  def get_token_price_list_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/alpha/trade/biz-token-price-list",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"tokenAddressInfo\": [\n        {\n            \"chainCode\": \"ETH\",\n            \"tokenAddress\": \"\"\n        }\n    ]\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_order_list_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Order List
  Method: POST
  Path: /v5/alpha/trade/order-list
  Requires signature: true
  """
  def get_order_list_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/alpha/trade/order-list",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"tradeType\": 0,\n    \"tokenCode\": \"\",\n    \"orderStatus\": [],\n    \"days\": 0,\n    \"limit\": 0,\n    \"pageIndex\": 0,\n    \"direction\": \"prev\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_payment_token_list_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Payment Token List
  Method: POST
  Path: /v5/alpha/trade/pay-token-list
  Requires signature: true
  """
  def get_payment_token_list_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/alpha/trade/pay-token-list",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"chainCode\": \"SOL\",\n    \"tokenAddress\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec execute_purchase_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Execute Purchase
  Method: POST
  Path: /v5/alpha/trade/purchase
  Requires signature: true
  """
  def execute_purchase_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/alpha/trade/purchase",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"fromTokenCode\": \"CEX_<id>\",\n    \"fromTokenAmount\": \"\",\n    \"toTokenCode\": \"DEX_<id>\",\n    \"slippage\": \"0.005\",\n    \"quoteData\": \"/quote\",\n    \"gas\": \"/quote\",\n    \"quoteMode\": 0,\n    \"correctingCode\": \"/quote\",\n    \"tenant\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_trade_quote_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Trade Quote
  Method: POST
  Path: /v5/alpha/trade/quote
  Requires signature: true
  """
  def get_trade_quote_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/alpha/trade/quote",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"tradeType\": 0,\n    \"fromTokenCode\": \"CEX_<id>\",\n    \"fromTokenAmount\": \"\",\n    \"toTokenCode\": \"CEX_<id>\",\n    \"quoteMode\": 0\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec execute_redeem_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Execute Redeem
  Method: POST
  Path: /v5/alpha/trade/redeem
  Requires signature: true
  """
  def execute_redeem_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/alpha/trade/redeem",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"fromTokenCode\": \"DEX_<id>\",\n    \"fromTokenAmount\": \"\",\n    \"toTokenCode\": \"CEX_<id>\",\n    \"slippage\": \"0.005\",\n    \"quoteData\": \"/quote\",\n    \"gas\": \"/quote\",\n    \"quoteMode\": 0,\n    \"correctingCode\": \"/quote\",\n    \"tenant\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
