defmodule Bybit.API.OpenApiV5.User do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec create_sub_uid_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Create Sub UID
  Method: POST
  Path: /v5/user/create-sub-member
  Requires signature: true
  """
  def create_sub_uid_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/user/create-sub-member",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"username\": \"06062024Test\",\n    \"password\": \"\",\n    \"memberType\": 1,\n    \"switch\": 1,\n    \"isUta\": true,\n    \"note\": \"testnet sub UM acct\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec create_sub_uid_api_key_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Create Sub UID API Key
  Method: POST
  Path: /v5/user/create-sub-api
  Requires signature: true
  """
  def create_sub_uid_api_key_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/user/create-sub-api",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"subuid\": 1187021,\n    \"note\": \"10thtest2\",\n    \"readOnly\": 1,\n    \"ips\": \"\\\"192.168.0.1,192.168.0.2\\\"\",\n    \"permissions\": {\n        \"ContractTrade\": [\n            \"Order\",\n            \"Position\"\n        ],\n        \"Spot\": [\n            \"SpotTrade\"\n        ],\n        \"Options\": [\n            \"OptionsTrade\"\n        ],\n        \"Wallet\": [\n            \"AccountTransfer\"\n        ],\n        \"Exchange\": [\n            \"ExchangeHistory\"\n        ],\n        \"Earn\": []\n    }\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_sub_uid_list_limited_user_query_sub_members(Bybit.Client.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Sub UID List
  Variant: Limited
  Tags: limited
  Method: GET
  Path: /v5/user/query-sub-members
  Requires signature: true
  """
  def get_sub_uid_list_limited_user_query_sub_members(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/user/query-sub-members",
          query: [],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_sub_uid_list_unlimited_user_submembers(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Sub UID List
  Variant: Unlimited
  Tags: unlimited
  Method: GET
  Path: /v5/user/submembers
  Requires signature: true
  Optional: pageSize, nextCursor
  """
  def get_sub_uid_list_unlimited_user_submembers(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/user/submembers",
          query: [
            pageSize: Keyword.get(opts, :pageSize),
            nextCursor: Keyword.get(opts, :nextCursor)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_api_key_information_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get API Key Information
  Method: GET
  Path: /v5/user/query-api
  Requires signature: true
  """
  def get_api_key_information_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/user/query-api",
          query: [],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_sub_account_all_api_keys_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Sub Account All API Keys
  Method: GET
  Path: /v5/user/sub-apikeys
  Requires signature: true
  Required: subMemberId
  Optional: limit, cursor
  """
  def get_sub_account_all_api_keys_v5(client, subMemberId, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/user/sub-apikeys",
          query: [
            subMemberId: subMemberId,
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_uid_wallet_type_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get UID Wallet Type
  Method: GET
  Path: /v5/user/get-member-type
  Requires signature: true
  Optional: memberIds
  """
  def get_uid_wallet_type_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/user/get-member-type",
          query: [memberIds: Keyword.get(opts, :memberIds)],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_affiliate_user_info_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Affiliate User Info
  Method: GET
  Path: /v5/user/aff-customer-info
  Requires signature: true
  Required: uid
  Optional: coin, business
  """
  def get_affiliate_user_info_v5(client, uid, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/user/aff-customer-info",
          query: [
            uid: uid,
            coin: Keyword.get(opts, :coin),
            business: Keyword.get(opts, :business)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec freeze_sub_uid_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Freeze Sub UID
  Method: POST
  Path: /v5/user/frozen-sub-member
  Requires signature: true
  """
  def freeze_sub_uid_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/user/frozen-sub-member",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw: Keyword.get(opts, :body, "{\n    \"subuid\": 1187021,\n    \"frozen\": 0\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec delete_sub_uid_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Delete Sub UID
  Method: POST
  Path: /v5/user/del-submember
  Requires signature: true
  """
  def delete_sub_uid_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/user/del-submember",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw: Keyword.get(opts, :body, "{\n    \"subMemberId\": \"101472685\"\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec modify_master_api_key_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Modify Master API Key
  Method: POST
  Path: /v5/user/update-api
  Requires signature: true
  """
  def modify_master_api_key_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/user/update-api",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"readOnly\": 0,\n    \"permissions\": {\n        \"ContractTrade\": [\n            \"Order\",\n            \"Position\"\n        ],\n        \"Spot\": [\n            \"SpotTrade\"\n        ],\n        \"Wallet\": [\n            \"AccountTransfer\",\n            \"SubMemberTransfer\"\n        ],\n        \"Options\": [\n            \"OptionsTrade\"\n        ],\n        \"Exchange\": [\n            \"ExchangeHistory\"\n        ],\n        \"Earn\": [],\n        \"FiatP2P\": [],\n        \"FiatBitPay\": [],\n        \"FiatConvertBroker\": [],\n        \"BitCard\": [],\n        \"ByXPost\": [],\n        \"Affiliate\": [],\n        \"Derivatives\": [\n            \"DerivativesTrade\"\n        ],\n        \"BlockTrade\": [\n            \"BlockTrade\"\n        ]\n    }\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec delete_master_api_key_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Delete Master API Key
  Method: POST
  Path: /v5/user/delete-api
  Requires signature: true
  """
  def delete_master_api_key_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/user/delete-api",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec modify_sub_api_key_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Modify Sub API Key
  Method: POST
  Path: /v5/user/update-sub-api
  Requires signature: true
  """
  def modify_sub_api_key_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/user/update-sub-api",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"apikey\": \"apikey\",\n    \"readOnly\": 0,\n    \"ips\": \"\\\"192.168.0.1,192.168.0.2\\\"\",\n    \"permissions\": {\n        \"ContractTrade\": [\n            \"Order\",\n            \"Position\"\n        ],\n        \"Spot\": [\n            \"SpotTrade\"\n        ],\n        \"Wallet\": [\n            \"AccountTransfer\",\n            \"SubMemberTransfer\"\n        ],\n        \"Options\": [\n            \"OptionsTrade\"\n        ],\n        \"Derivatives\": [\n            \"DerivativesTrade\"\n        ],\n        \"Exchange\": [\n            \"ExchangeHistory\"\n        ],\n        \"Earn\": []\n    }\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec delete_sub_api_key_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Delete Sub API Key
  Method: POST
  Path: /v5/user/delete-sub-api
  Requires signature: true
  """
  def delete_sub_api_key_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/user/delete-sub-api",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"apikey\": \"apikey\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_fund_custodial_sub_acct_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Fund Custodial Sub Acct
  Method: GET
  Path: /v5/user/escrow_sub_members
  Requires signature: true
  Optional: pageSize, nextCursor
  """
  def get_fund_custodial_sub_acct_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/user/escrow_sub_members",
          query: [
            pageSize: Keyword.get(opts, :pageSize),
            nextCursor: Keyword.get(opts, :nextCursor)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_friend_referrals_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Friend Referrals
  Method: GET
  Path: /v5/user/invitation/referrals
  Requires signature: true
  Optional: status, size, cursor
  """
  def get_friend_referrals_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/user/invitation/referrals",
          query: [
            status: Keyword.get(opts, :status),
            size: Keyword.get(opts, :size),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
