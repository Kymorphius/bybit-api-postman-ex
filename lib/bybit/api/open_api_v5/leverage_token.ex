defmodule Bybit.API.OpenApiV5.LeverageToken do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_leverage_token_info_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Leverage Token Info
  Method: GET
  Path: /v5/spot-lever-token/info
  Requires signature: false
  Optional: ltCoin
  """
  def get_leverage_token_info_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-lever-token/info",
          query: [ltCoin: Keyword.get(opts, :ltCoin)],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_leveraged_token_market_v5(Bybit.Client.t(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Leveraged Token Market
  Method: GET
  Path: /v5/spot-lever-token/reference
  Requires signature: false
  Required: ltCoin
  """
  def get_leveraged_token_market_v5(client, ltCoin) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-lever-token/reference",
          query: [ltCoin: ltCoin],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_purchase_redemption_records_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Purchase/Redemption Records
  Method: GET
  Path: /v5/spot-lever-token/order-record
  Requires signature: false
  Optional: ltCoin, orderId, startTime, endTime, limit, ltOrderType, serialNo
  """
  def get_purchase_redemption_records_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/spot-lever-token/order-record",
          query: [
            ltCoin: Keyword.get(opts, :ltCoin),
            orderId: Keyword.get(opts, :orderId),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            ltOrderType: Keyword.get(opts, :ltOrderType),
            serialNo: Keyword.get(opts, :serialNo)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec purchase_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Purchase
  Method: POST
  Path: /v5/spot-lever-token/purchase
  Requires signature: false
  """
  def purchase_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "POST",
          base_url: base_url,
          url: "/v5/spot-lever-token/purchase",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"ltCoin\": \"EOS3L\",\n    \"ltAmount\": \"\",\n    \"serialNo\": \"purchase-001\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec redeem_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Redeem
  Method: POST
  Path: /v5/spot-lever-token/redeem
  Requires signature: false
  """
  def redeem_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "POST",
          base_url: base_url,
          url: "/v5/spot-lever-token/redeem",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"ltCoin\": \"EOS3L\",\n    \"quantity\": \"150\",\n    \"serialNo\": \"redeem-001\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
