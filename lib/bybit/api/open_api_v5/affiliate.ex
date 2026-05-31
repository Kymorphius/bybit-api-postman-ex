defmodule Bybit.API.OpenApiV5.Affiliate do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_affiliate_user_list_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Affiliate User List
  Method: GET
  Path: /v5/affiliate/aff-user-list
  Requires signature: true
  Optional: size, cursor, needDeposit, need30, need365, startDate, endDate
  """
  def get_affiliate_user_list_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/affiliate/aff-user-list",
          query: [
            size: Keyword.get(opts, :size),
            cursor: Keyword.get(opts, :cursor),
            needDeposit: Keyword.get(opts, :needDeposit),
            need30: Keyword.get(opts, :need30),
            need365: Keyword.get(opts, :need365),
            startDate: Keyword.get(opts, :startDate),
            endDate: Keyword.get(opts, :endDate)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
