defmodule Bybit.API.OpenApiV5.Broker do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_issued_voucher(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Issued Voucher
  Method: POST
  Path: /v5/broker/award/distribution-record
  Requires signature: true
  """
  def get_issued_voucher(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/broker/award/distribution-record",
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
                "{\n    \"accountId\": \"5714139\",\n    \"awardId\": \"189528\",\n    \"specCode\": \"demo000\",\n    \"withUsedAmount\": false\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_voucher_spec(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Voucher Spec
  Method: POST
  Path: /v5/broker/award/info
  Requires signature: true
  """
  def get_voucher_spec(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/broker/award/info",
          query: [],
          headers: [
            {"X-BAPI-SIGN-TYPE", "2"},
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"id\": \"80209\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec issue_voucher(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Issue Voucher
  Method: POST
  Path: /v5/broker/award/distribute-award
  Requires signature: true
  """
  def issue_voucher(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/broker/award/distribute-award",
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
                "{\n    \"accountId\": \"2846381\",\n    \"awardId\": \"123456\",\n    \"specCode\": \"award-001\",\n    \"amount\": \"100\",\n    \"brokerId\": \"v-28478\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_account_info(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Account Info
  Method: GET
  Path: /v5/broker/account-info
  Requires signature: true
  """
  def get_account_info(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/broker/account-info",
          query: [],
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

  @spec get_broker_earning(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Broker Earning
  Method: GET
  Path: /v5/broker/earning-record
  Requires signature: true
  Optional: bizType, startTime, endTime, limit, cursor
  """
  def get_broker_earning(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/broker/earning-record",
          query: [
            bizType: Keyword.get(opts, :bizType),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
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

  @spec get_sub_account_deposit_records(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Sub Account Deposit Records
  Method: GET
  Path: /v5/broker/asset/query-sub-member-deposit-record
  Requires signature: true
  Optional: id, txID, subMemberId, coin, startTime, endTime, limit, cursor
  """
  def get_sub_account_deposit_records(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/broker/asset/query-sub-member-deposit-record",
          query: [
            id: Keyword.get(opts, :id),
            txID: Keyword.get(opts, :txID),
            subMemberId: Keyword.get(opts, :subMemberId),
            coin: Keyword.get(opts, :coin),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
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

  @spec get_all_rate_limits(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get All Rate Limits
  Method: GET
  Path: /v5/broker/apilimit/query-all
  Requires signature: true
  Optional: limit, cursor, uids
  """
  def get_all_rate_limits(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/broker/apilimit/query-all",
          query: [
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor),
            uids: Keyword.get(opts, :uids)
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

  @spec get_rate_limit_cap(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Rate Limit Cap
  Method: GET
  Path: /v5/broker/apilimit/query-cap
  Requires signature: true
  """
  def get_rate_limit_cap(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/broker/apilimit/query-cap",
          query: [],
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

  @spec set_rate_limit(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Set Rate Limit
  Method: POST
  Path: /v5/broker/apilimit/set
  Requires signature: true
  """
  def set_rate_limit(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/broker/apilimit/set",
          query: [],
          headers: [
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
                "{\n    \"list\": [\n        {\n            \"uids\": \"\",\n            \"bizType\": \"\",\n            \"rate\": 0\n        }\n    ]\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_earning(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Earning
  Method: GET
  Path: /v5/broker/earnings-info
  Requires signature: true
  Optional: bizType, begin, end, uid, limit, cursor
  """
  def get_earning(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/broker/earnings-info",
          query: [
            bizType: Keyword.get(opts, :bizType),
            begin: Keyword.get(opts, :begin),
            end: Keyword.get(opts, :end),
            uid: Keyword.get(opts, :uid),
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
