defmodule Bybit.API.OpenApiV5.Asset do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_convert_coin_list_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Convert Coin List
  Method: GET
  Path: /v5/asset/exchange/query-coin-list
  Requires signature: true
  Required: accountType, coin
  Optional: side
  """
  def get_convert_coin_list_v5(client, accountType, coin, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/exchange/query-coin-list",
          query: [accountType: accountType, coin: coin, side: Keyword.get(opts, :side)],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_convert_status_exchange_convert_result_query(Bybit.Client.t(), term(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Convert Status
  Method: GET
  Path: /v5/asset/exchange/convert-result-query
  Requires signature: true
  Required: quoteTxId, accountType
  """
  def get_convert_status_exchange_convert_result_query(client, quoteTxId, accountType) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/exchange/convert-result-query",
          query: [quoteTxId: quoteTxId, accountType: accountType],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_convert_history_exchange_query_convert_history(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Convert History
  Method: GET
  Path: /v5/asset/exchange/query-convert-history
  Requires signature: true
  Optional: accountType, index, limit
  """
  def get_convert_history_exchange_query_convert_history(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/exchange/query-convert-history",
          query: [
            accountType: Keyword.get(opts, :accountType),
            index: Keyword.get(opts, :index),
            limit: Keyword.get(opts, :limit)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec request_a_quote_exchange_quote_apply(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Request a Quote
  Method: POST
  Path: /v5/asset/exchange/quote-apply
  Requires signature: true
  """
  def request_a_quote_exchange_quote_apply(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/asset/exchange/quote-apply",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"accountType\": \"UNIFIED\",\n    \"fromCoin\": \"BTC\",\n    \"toCoin\": \"ETH\",\n    \"requestCoin\": \"BTC\",\n    \"requestAmount\": \"1\",\n    \"fromCoinType\": \"crypto\",\n    \"toCoinType\": \"crypto\",\n    \"paramType\": \"opFrom\",\n    \"paramValue\": \"\",\n    \"requestId\": \"123456\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec confirm_a_quote_exchange_convert_execute(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Confirm a Quote
  Method: POST
  Path: /v5/asset/exchange/convert-execute
  Requires signature: true
  """
  def confirm_a_quote_exchange_convert_execute(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/asset/exchange/convert-execute",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"quoteTxId\": \"10102225215434451987621355520\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_single_coin_balance_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Single Coin Balance
  Method: GET
  Path: /v5/asset/transfer/query-account-coin-balance
  Requires signature: true
  Required: accountType, coin
  Optional: memberId, toMemberId, toAccountType, withBonus, withTransferSafeAmount, withLtvTransferSafeAmount
  """
  def get_single_coin_balance_v5(client, accountType, coin, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/transfer/query-account-coin-balance",
          query: [
            memberId: Keyword.get(opts, :memberId),
            toMemberId: Keyword.get(opts, :toMemberId),
            accountType: accountType,
            toAccountType: Keyword.get(opts, :toAccountType),
            coin: coin,
            withBonus: Keyword.get(opts, :withBonus),
            withTransferSafeAmount: Keyword.get(opts, :withTransferSafeAmount),
            withLtvTransferSafeAmount: Keyword.get(opts, :withLtvTransferSafeAmount)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_all_coins_balance_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get All Coins Balance
  Method: GET
  Path: /v5/asset/transfer/query-account-coins-balance
  Requires signature: true
  Required: accountType
  Optional: memberId, coin, withBonus
  """
  def get_all_coins_balance_v5(client, accountType, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/transfer/query-account-coins-balance",
          query: [
            memberId: Keyword.get(opts, :memberId),
            accountType: accountType,
            coin: Keyword.get(opts, :coin),
            withBonus: Keyword.get(opts, :withBonus)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_withdrawable_amount_v5(Bybit.Client.t(), term()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Withdrawable Amount
  Method: GET
  Path: /v5/asset/withdraw/withdrawable-amount
  Requires signature: true
  Required: coin
  """
  def get_withdrawable_amount_v5(client, coin) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/withdraw/withdrawable-amount",
          query: [coin: coin],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_asset_info_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Asset Info
  Method: GET
  Path: /v5/asset/transfer/query-asset-info
  Requires signature: true
  Required: accountType
  Optional: coin
  """
  def get_asset_info_v5(client, accountType, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/transfer/query-asset-info",
          query: [accountType: accountType, coin: Keyword.get(opts, :coin)],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec asset_overview_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Asset Overview
  Method: GET
  Path: /v5/asset/asset-overview
  Requires signature: true
  Optional: memberId, valuationCurrency, accountType
  """
  def asset_overview_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/asset-overview",
          query: [
            memberId: Keyword.get(opts, :memberId),
            valuationCurrency: Keyword.get(opts, :valuationCurrency),
            accountType: Keyword.get(opts, :accountType)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_sub_uid_v5_11(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Sub UID
  Method: GET
  Path: /v5/asset/transfer/query-sub-member-list
  Requires signature: true
  """
  def get_sub_uid_v5_11(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/transfer/query-sub-member-list",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_internal_transfer_records_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Internal Transfer Records
  Method: GET
  Path: /v5/asset/transfer/query-inter-transfer-list
  Requires signature: true
  Optional: transferId, coin, status, startTime, endTime, limit, cursor
  """
  def get_internal_transfer_records_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/transfer/query-inter-transfer-list",
          query: [
            transferId: Keyword.get(opts, :transferId),
            coin: Keyword.get(opts, :coin),
            status: Keyword.get(opts, :status),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_universal_transfer_records_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Universal Transfer Records
  Method: GET
  Path: /v5/asset/transfer/query-universal-transfer-list
  Requires signature: true
  Optional: transferId, coin, status, startTime, endTime, limit, cursor
  """
  def get_universal_transfer_records_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/transfer/query-universal-transfer-list",
          query: [
            transferId: Keyword.get(opts, :transferId),
            coin: Keyword.get(opts, :coin),
            status: Keyword.get(opts, :status),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec enable_universal_transfer_for_sub_uid_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Enable Universal Transfer for Sub UID
  Method: POST
  Path: /v5/asset/transfer/save-transfer-sub-member
  Requires signature: true
  """
  def enable_universal_transfer_for_sub_uid_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/asset/transfer/save-transfer-sub-member",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"subMemberIds\": []\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_transferable_coin_v5(Bybit.Client.t(), term(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Transferable Coin
  Method: GET
  Path: /v5/asset/transfer/query-transfer-coin-list
  Requires signature: true
  Required: fromAccountType, toAccountType
  """
  def get_transferable_coin_v5(client, fromAccountType, toAccountType) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/transfer/query-transfer-coin-list",
          query: [fromAccountType: fromAccountType, toAccountType: toAccountType],
          headers: [
            {"Content-Type", "application/json"},
            {"X-BAPI-SIGN-TYPE", "2"},
            {"Content-Type", "application/json"}
          ],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec create_internal_transfer_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Create Internal Transfer
  Method: POST
  Path: /v5/asset/transfer/inter-transfer
  Requires signature: true
  """
  def create_internal_transfer_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/asset/transfer/inter-transfer",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"transferId\": \"11ff9b44-2d5d-4293-913d-4597c9ad2188\",\n    \"coin\": \"USDT\",\n    \"amount\": \"1\",\n    \"fromAccountType\": \"\",\n    \"toAccountType\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec create_universal_transfer_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Create Universal Transfer
  Method: POST
  Path: /v5/asset/transfer/universal-transfer
  Requires signature: true
  """
  def create_universal_transfer_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/asset/transfer/universal-transfer",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"transferId\": \"be7a2462-1138-4e27-80b1-62653f24925e\",\n    \"coin\": \"USDC\",\n    \"amount\": \"5000\",\n    \"fromMemberId\": 0,\n    \"toMemberId\": 0,\n    \"fromAccountType\": \"\",\n    \"toAccountType\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_master_deposit_address_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Master Deposit Address
  Method: GET
  Path: /v5/asset/deposit/query-address
  Requires signature: true
  Required: coin
  Optional: chainType
  """
  def get_master_deposit_address_v5(client, coin, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/deposit/query-address",
          query: [coin: coin, chainType: Keyword.get(opts, :chainType)],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_deposit_records_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Deposit Records
  Variant: On Chain
  Tags: on_chain
  Method: GET
  Path: /v5/asset/deposit/query-record
  Requires signature: true
  Optional: id, txID, coin, startTime, endTime, limit, cursor
  """
  def get_deposit_records_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/deposit/query-record",
          query: [
            id: Keyword.get(opts, :id),
            txID: Keyword.get(opts, :txID),
            coin: Keyword.get(opts, :coin),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_sub_deposit_address_v5(Bybit.Client.t(), term(), term(), term()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Sub Deposit Address
  Method: GET
  Path: /v5/asset/deposit/query-sub-member-address
  Requires signature: false
  Required: coin, chainType, subMemberId
  """
  def get_sub_deposit_address_v5(client, coin, chainType, subMemberId) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: false,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/deposit/query-sub-member-address",
          query: [coin: coin, chainType: chainType, subMemberId: subMemberId],
          headers: [],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_sub_deposit_records_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Sub Deposit Records
  Variant: On Chain
  Tags: on_chain
  Method: GET
  Path: /v5/asset/deposit/query-sub-member-record
  Requires signature: true
  Required: subMemberId
  Optional: id, txID, coin, startTime, endTime, limit, cursor
  """
  def get_sub_deposit_records_v5(client, subMemberId, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/deposit/query-sub-member-record",
          query: [
            id: Keyword.get(opts, :id),
            txID: Keyword.get(opts, :txID),
            subMemberId: subMemberId,
            coin: Keyword.get(opts, :coin),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec set_deposit_account_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Set Deposit Account
  Method: POST
  Path: /v5/asset/deposit/deposit-to-account
  Requires signature: true
  """
  def set_deposit_account_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/asset/deposit/deposit-to-account",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw: Keyword.get(opts, :body, "{\n    \"accountType\": \"UNIFIED\"\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_internal_deposit_records_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Internal Deposit Records
  Variant: Off Chain
  Tags: off_chain
  Method: GET
  Path: /v5/asset/deposit/query-internal-record
  Requires signature: true
  Optional: txID, startTime, endTime, coin, cursor, limit
  """
  def get_internal_deposit_records_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/deposit/query-internal-record",
          query: [
            txID: Keyword.get(opts, :txID),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            coin: Keyword.get(opts, :coin),
            cursor: Keyword.get(opts, :cursor),
            limit: Keyword.get(opts, :limit)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_withdrawal_records_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Withdrawal Records
  Method: GET
  Path: /v5/asset/withdraw/query-record
  Requires signature: true
  Optional: withdrawID, txID, coin, withdrawType, startTime, endTime, limit, cursor
  """
  def get_withdrawal_records_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/withdraw/query-record",
          query: [
            withdrawID: Keyword.get(opts, :withdrawID),
            txID: Keyword.get(opts, :txID),
            coin: Keyword.get(opts, :coin),
            withdrawType: Keyword.get(opts, :withdrawType),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec withdraw_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Withdraw
  Method: POST
  Path: /v5/asset/withdraw/create
  Requires signature: true
  """
  def withdraw_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/asset/withdraw/create",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"coin\": \"BTC\",\n    \"chain\": \"BTC\",\n    \"address\": \"n3Hy3vwUY1sqbXhvFbaCbtoM2ZnbSnqa1J\",\n    \"tag\": \"\",\n    \"amount\": \"0.0213\",\n    \"timestamp\": 0,\n    \"forceChain\": 0,\n    \"accountType\": \"FUND\",\n    \"feeType\": 0,\n    \"requestId\": \"123456\",\n    \"transactionPurpose\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec cancel_withdrawal_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Cancel Withdrawal
  Method: POST
  Path: /v5/asset/withdraw/cancel
  Requires signature: true
  """
  def cancel_withdrawal_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/asset/withdraw/cancel",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"id\": \"36604\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_withdrawal_address_list_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Withdrawal Address List
  Method: GET
  Path: /v5/asset/withdraw/query-address
  Requires signature: true
  Optional: coin, chain, addressType, limit, cursor
  """
  def get_withdrawal_address_list_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/withdraw/query-address",
          query: [
            coin: Keyword.get(opts, :coin),
            chain: Keyword.get(opts, :chain),
            addressType: Keyword.get(opts, :addressType),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_available_vasps_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get available VASPs
  Method: GET
  Path: /v5/asset/withdraw/vasp/list
  Requires signature: true
  """
  def get_available_vasps_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/withdraw/vasp/list",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_usdc_session_settlement_v5(Bybit.Client.t(), term(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get USDC Session Settlement
  Method: GET
  Path: /v5/asset/settlement-record
  Requires signature: true
  Required: category, symbol
  Optional: startTime, endTime, limit, cursor
  """
  def get_usdc_session_settlement_v5(client, category, symbol, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/settlement-record",
          query: [
            category: category,
            symbol: symbol,
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_coin_exchange_records_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Coin Exchange Records
  Method: GET
  Path: /v5/asset/exchange/order-record
  Requires signature: true
  Required: limit
  Optional: fromCoin, toCoin, cursor
  """
  def get_coin_exchange_records_v5(client, limit, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/exchange/order-record",
          query: [
            fromCoin: Keyword.get(opts, :fromCoin),
            toCoin: Keyword.get(opts, :toCoin),
            limit: limit,
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_coin_info_v5(Bybit.Client.t(), term()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Coin Info
  Method: GET
  Path: /v5/asset/coin/query-info
  Requires signature: true
  Required: coin
  """
  def get_coin_info_v5(client, coin) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/coin/query-info",
          query: [coin: coin],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_sub_uid_v5_32(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Sub UID
  Method: GET
  Path: /v5/asset/transfer/query-sub-member-list
  Requires signature: true
  """
  def get_sub_uid_v5_32(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/transfer/query-sub-member-list",
          query: [],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_delivery_record_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Delivery Record
  Method: GET
  Path: /v5/asset/delivery-record
  Requires signature: true
  Required: category
  Optional: symbol, startTime, endTime, expDate, limit, cursor
  """
  def get_delivery_record_v5(client, category, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/delivery-record",
          query: [
            category: category,
            symbol: Keyword.get(opts, :symbol),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            expDate: Keyword.get(opts, :expDate),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"X-BAPI-SIGN-TYPE", "2"}, {"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec request_a_quote_covert_get_quote(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Request a Quote
  Method: POST
  Path: /v5/asset/covert/get-quote
  Requires signature: true
  """
  def request_a_quote_covert_get_quote(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/asset/covert/get-quote",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"accountType\": \"eb_convert_uta\",\n    \"fromCoinList\": [],\n    \"toCoin\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec confirm_a_quote_covert_small_balance_execute(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Confirm a Quote
  Method: POST
  Path: /v5/asset/covert/small-balance-execute
  Requires signature: true
  """
  def confirm_a_quote_covert_small_balance_execute(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/asset/covert/small-balance-execute",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"quoteId\": \"123456\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_exchange_history_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Exchange History
  Method: GET
  Path: /v5/asset/covert/small-balance-history
  Requires signature: true
  Optional: accountType, quoteId, startTime, endTime, cursor, size
  """
  def get_exchange_history_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/covert/small-balance-history",
          query: [
            accountType: Keyword.get(opts, :accountType),
            quoteId: Keyword.get(opts, :quoteId),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            cursor: Keyword.get(opts, :cursor),
            size: Keyword.get(opts, :size)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_small_balance_coins_v5(Bybit.Client.t(), term(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Small Balance Coins
  Method: GET
  Path: /v5/asset/covert/small-balance-list
  Requires signature: true
  Required: accountType
  Optional: fromCoin
  """
  def get_small_balance_coins_v5(client, accountType, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/covert/small-balance-list",
          query: [accountType: accountType, fromCoin: Keyword.get(opts, :fromCoin)],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec funding_account_transaction_history_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Funding Account Transaction History
  Method: GET
  Path: /v5/asset/fundinghistory
  Requires signature: true
  Optional: createTimeFrom, createTimeTo, limit, cursor
  """
  def funding_account_transaction_history_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/fundinghistory",
          query: [
            createTimeFrom: Keyword.get(opts, :createTimeFrom),
            createTimeTo: Keyword.get(opts, :createTimeTo),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_portfolio_margin_info_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Portfolio Margin Info
  Method: GET
  Path: /v5/asset/portfolio-margin
  Requires signature: true
  Optional: baseCoin
  """
  def get_portfolio_margin_info_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/portfolio-margin",
          query: [baseCoin: Keyword.get(opts, :baseCoin)],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_total_members_assets_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Total Members Assets
  Method: GET
  Path: /v5/asset/total-members-assets
  Requires signature: true
  Optional: coin
  """
  def get_total_members_assets_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/asset/total-members-assets",
          query: [coin: Keyword.get(opts, :coin)],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_balance_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Balance
  Method: GET
  Path: /v5/fiat/balance-query
  Requires signature: true
  Optional: currency
  """
  def get_balance_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/fiat/balance-query",
          query: [currency: Keyword.get(opts, :currency)],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_trading_pair_list_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Trading Pair List
  Method: GET
  Path: /v5/fiat/query-coin-list
  Requires signature: true
  Optional: side
  """
  def get_trading_pair_list_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/fiat/query-coin-list",
          query: [side: Keyword.get(opts, :side)],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_convert_history_fiat_query_trade_history(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Convert History
  Method: GET
  Path: /v5/fiat/query-trade-history
  Requires signature: true
  Optional: index, limit, startTime, endTime
  """
  def get_convert_history_fiat_query_trade_history(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/fiat/query-trade-history",
          query: [
            index: Keyword.get(opts, :index),
            limit: Keyword.get(opts, :limit),
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec request_a_quote_fiat_quote_apply(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Request a Quote
  Method: POST
  Path: /v5/fiat/quote-apply
  Requires signature: true
  """
  def request_a_quote_fiat_quote_apply(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/fiat/quote-apply",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"fromCoin\": \"\",\n    \"fromCoinType\": \"fiat\",\n    \"toCoin\": \"\",\n    \"toCoinType\": \"fiat\",\n    \"requestAmount\": \"\",\n    \"requestCoinType\": \"fiat\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_reference_price_v5(Bybit.Client.t(), term()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Reference Price
  Method: GET
  Path: /v5/fiat/reference-price
  Requires signature: true
  Required: symbol
  """
  def get_reference_price_v5(client, symbol) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/fiat/reference-price",
          query: [symbol: symbol],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec confirm_a_quote_fiat_trade_execute(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Confirm a Quote
  Method: POST
  Path: /v5/fiat/trade-execute
  Requires signature: true
  """
  def confirm_a_quote_fiat_trade_execute(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/fiat/trade-execute",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"quoteTxId\": \"123456\",\n    \"subUserId\": \"123456\",\n    \"webhookUrl\": \"\",\n    \"MerchantRequestId\": \"123456\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_convert_status_fiat_trade_query(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Convert Status
  Method: GET
  Path: /v5/fiat/trade-query
  Requires signature: true
  Optional: tradeNo, merchantRequestId
  """
  def get_convert_status_fiat_trade_query(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/fiat/trade-query",
          query: [
            tradeNo: Keyword.get(opts, :tradeNo),
            merchantRequestId: Keyword.get(opts, :merchantRequestId)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
