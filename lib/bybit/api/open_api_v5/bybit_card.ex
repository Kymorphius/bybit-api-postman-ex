defmodule Bybit.API.OpenApiV5.BybitCard do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec query_mall_item_list_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Query Mall Item List
  Method: POST
  Path: /v5/card/reward/mall/item/list
  Requires signature: true
  """
  def query_mall_item_list_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/card/reward/mall/item/list",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"pageNo\": 0,\n    \"pageSize\": 0,\n    \"itemType\": 0,\n    \"itemBizType\": 0,\n    \"orderBy\": 0,\n    \"asc\": false,\n    \"source\": 0\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec query_cashback_detail_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Query Cashback Detail
  Method: POST
  Path: /v5/card/reward/point/cashback/detail
  Requires signature: true
  """
  def query_cashback_detail_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/card/reward/point/cashback/detail",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw: Keyword.get(opts, :body, "{\n    \"bizTxnId\": \"123456\"\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec query_point_balance_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Query Point Balance
  Method: POST
  Path: /v5/card/reward/points/balance
  Requires signature: true
  """
  def query_point_balance_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/card/reward/points/balance",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec query_point_records_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Query Point Records
  Method: POST
  Path: /v5/card/reward/points/records
  Requires signature: true
  """
  def query_point_records_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/card/reward/points/records",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"type\": \"\",\n    \"pageSize\": 0,\n    \"pageNo\": 0,\n    \"startTime\": 0,\n    \"endTime\": 0,\n    \"outOrderId\": \"123456\",\n    \"bizId\": \"123456\",\n    \"bizTxnId\": \"123456\",\n    \"side\": \"2\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec query_tier_info_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Query Tier Info
  Method: POST
  Path: /v5/card/reward/points/tier
  Requires signature: true
  """
  def query_tier_info_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/card/reward/points/tier",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec query_asset_records_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Query Asset Records
  Method: POST
  Path: /v5/card/transaction/query-asset-records
  Requires signature: true
  """
  def query_asset_records_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/card/transaction/query-asset-records",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"statusCode\": \"2\",\n    \"limit\": 0,\n    \"page\": 0,\n    \"pan4\": \"\",\n    \"createBeginTime\": 0,\n    \"createEndTime\": 0,\n    \"merchName\": \"\",\n    \"type\": \"SIDE_QUERY_AUTH\",\n    \"txnId\": \"123456\",\n    \"cardToken\": \"\",\n    \"orderNo\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
