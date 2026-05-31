defmodule Bybit.API.OpenApiV5.Otc do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_margin_coin_info_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Margin Coin Info
  Method: GET
  Path: /v5/ins-loan/ensure-tokens-convert
  Requires signature: true
  Optional: productId
  """
  def get_margin_coin_info_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/ins-loan/ensure-tokens-convert",
          query: [productId: Keyword.get(opts, :productId)],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_loan_orders_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Loan Orders
  Method: GET
  Path: /v5/ins-loan/loan-order
  Requires signature: true
  Optional: orderId, startTime, endTime, limit
  """
  def get_loan_orders_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/ins-loan/loan-order",
          query: [
            orderId: Keyword.get(opts, :orderId),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_ltv_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get LTV
  Method: GET
  Path: /v5/ins-loan/ltv-convert
  Requires signature: true
  """
  def get_ltv_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/ins-loan/ltv-convert",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_product_info_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Product Info
  Method: GET
  Path: /v5/ins-loan/product-infos
  Requires signature: true
  Optional: productId
  """
  def get_product_info_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/ins-loan/product-infos",
          query: [productId: Keyword.get(opts, :productId)],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_repayment_orders_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Repayment Orders
  Method: GET
  Path: /v5/ins-loan/repaid-history
  Requires signature: true
  Optional: startTime, endTime, limit
  """
  def get_repayment_orders_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/ins-loan/repaid-history",
          query: [
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec repay_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Repay
  Method: POST
  Path: /v5/ins-loan/repay-loan
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
          url: "/v5/ins-loan/repay-loan",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw: Keyword.get(opts, :body, "{\n    \"token\": \"\",\n    \"quantity\": \"\"\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
