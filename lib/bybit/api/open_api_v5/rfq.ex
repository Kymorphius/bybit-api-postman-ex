defmodule Bybit.API.OpenApiV5.Rfq do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec accept_non_lp_quote_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Accept non-LP Quote
  Method: POST
  Path: /v5/rfq/accept-other-quote
  Requires signature: true
  """
  def accept_non_lp_quote_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/rfq/accept-other-quote",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"rfqId\": \"123456\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec cancel_all_quotes_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Cancel All Quotes
  Method: POST
  Path: /v5/rfq/cancel-all-quotes
  Requires signature: true
  """
  def cancel_all_quotes_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/rfq/cancel-all-quotes",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec cancel_all_rfqs_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Cancel All RFQs
  Method: POST
  Path: /v5/rfq/cancel-all-rfq
  Requires signature: true
  """
  def cancel_all_rfqs_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/rfq/cancel-all-rfq",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec cancel_quote_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Cancel Quote
  Method: POST
  Path: /v5/rfq/cancel-quote
  Requires signature: true
  """
  def cancel_quote_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/rfq/cancel-quote",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"quoteId\": \"123456\",\n    \"rfqId\": \"123456\",\n    \"quoteLinkId\": \"123456\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec cancel_rfq_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Cancel RFQ
  Method: POST
  Path: /v5/rfq/cancel-rfq
  Requires signature: true
  """
  def cancel_rfq_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/rfq/cancel-rfq",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"rfqId\": \"123456\",\n    \"rfqLinkId\": \"123456\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_rfq_configuration_v5(Bybit.Client.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get RFQ Configuration
  Method: GET
  Path: /v5/rfq/config
  Requires signature: true
  """
  def get_rfq_configuration_v5(client) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/rfq/config",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec create_quote_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Create Quote
  Method: POST
  Path: /v5/rfq/create-quote
  Requires signature: true
  """
  def create_quote_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/rfq/create-quote",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"rfqId\": \"123456\",\n    \"quoteLinkId\": \"123456\",\n    \"anonymous\": false,\n    \"expireIn\": 0,\n    \"quoteBuyList\": [\n        {\n            \"category\": \"spot\",\n            \"symbol\": \"BTCUSDT\",\n            \"price\": \"1\"\n        }\n    ],\n    \"quoteSellList\": [\n        {\n            \"category\": \"spot\",\n            \"symbol\": \"BTCUSDT\",\n            \"price\": \"1\"\n        }\n    ]\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec create_rfq_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Create RFQ
  Method: POST
  Path: /v5/rfq/create-rfq
  Requires signature: true
  """
  def create_rfq_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/rfq/create-rfq",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"counterparties\": [],\n    \"rfqLinkId\": \"123456\",\n    \"anonymous\": false,\n    \"strategyType\": \"custom\",\n    \"list\": [\n        {\n            \"category\": \"spot\",\n            \"symbol\": \"BTCUSDT\",\n            \"side\": \"Buy\",\n            \"qty\": \"1\"\n        }\n    ]\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec execute_quote_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Execute Quote
  Method: POST
  Path: /v5/rfq/execute-quote
  Requires signature: true
  """
  def execute_quote_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/rfq/execute-quote",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"rfqId\": \"123456\",\n    \"quoteId\": \"123456\",\n    \"quoteSide\": \"Buy\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_public_trades_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Public Trades
  Method: GET
  Path: /v5/rfq/public-trades
  Requires signature: true
  Optional: startTime, endTime, limit, cursor
  """
  def get_public_trades_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/rfq/public-trades",
          query: [
            startTime: Keyword.get(opts, :startTime),
            endTime: Keyword.get(opts, :endTime),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_quotes_rfq_quote_list(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Quotes
  Method: GET
  Path: /v5/rfq/quote-list
  Requires signature: true
  Optional: rfqId, quoteId, quoteLinkId, traderType, status, limit, cursor
  """
  def get_quotes_rfq_quote_list(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/rfq/quote-list",
          query: [
            rfqId: Keyword.get(opts, :rfqId),
            quoteId: Keyword.get(opts, :quoteId),
            quoteLinkId: Keyword.get(opts, :quoteLinkId),
            traderType: Keyword.get(opts, :traderType),
            status: Keyword.get(opts, :status),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_quotes_real_time_rfq_quote_realtime(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Quotes
  Variant: Real Time
  Tags: real_time
  Method: GET
  Path: /v5/rfq/quote-realtime
  Requires signature: true
  Optional: rfqId, quoteId, quoteLinkId, traderType
  """
  def get_quotes_real_time_rfq_quote_realtime(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/rfq/quote-realtime",
          query: [
            rfqId: Keyword.get(opts, :rfqId),
            quoteId: Keyword.get(opts, :quoteId),
            quoteLinkId: Keyword.get(opts, :quoteLinkId),
            traderType: Keyword.get(opts, :traderType)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_rfqs_rfq_rfq_list(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get RFQs
  Method: GET
  Path: /v5/rfq/rfq-list
  Requires signature: true
  Optional: rfqId, rfqLinkId, traderType, status, limit, cursor
  """
  def get_rfqs_rfq_rfq_list(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/rfq/rfq-list",
          query: [
            rfqId: Keyword.get(opts, :rfqId),
            rfqLinkId: Keyword.get(opts, :rfqLinkId),
            traderType: Keyword.get(opts, :traderType),
            status: Keyword.get(opts, :status),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_rfqs_real_time_rfq_rfq_realtime(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get RFQs
  Variant: Real Time
  Tags: real_time
  Method: GET
  Path: /v5/rfq/rfq-realtime
  Requires signature: true
  Optional: rfqId, rfqLinkId, traderType
  """
  def get_rfqs_real_time_rfq_rfq_realtime(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/rfq/rfq-realtime",
          query: [
            rfqId: Keyword.get(opts, :rfqId),
            rfqLinkId: Keyword.get(opts, :rfqLinkId),
            traderType: Keyword.get(opts, :traderType)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_trade_history_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Trade History
  Method: GET
  Path: /v5/rfq/trade-list
  Requires signature: true
  Optional: rfqId, rfqLinkId, quoteId, quoteLinkId, traderType, status, limit, cursor
  """
  def get_trade_history_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "GET",
          base_url: base_url,
          url: "/v5/rfq/trade-list",
          query: [
            rfqId: Keyword.get(opts, :rfqId),
            rfqLinkId: Keyword.get(opts, :rfqLinkId),
            quoteId: Keyword.get(opts, :quoteId),
            quoteLinkId: Keyword.get(opts, :quoteLinkId),
            traderType: Keyword.get(opts, :traderType),
            status: Keyword.get(opts, :status),
            limit: Keyword.get(opts, :limit),
            cursor: Keyword.get(opts, :cursor)
          ],
          headers: [{"Content-Type", "application/json"}],
          body: nil
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
