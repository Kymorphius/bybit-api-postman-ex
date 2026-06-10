defmodule Bybit.API.OpenApiV5.Bot do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec close_dca_bot_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Close DCA Bot
  Method: POST
  Path: /v5/dca/close-bot
  Requires signature: true
  """
  def close_dca_bot_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/dca/close-bot",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"botid\": \"123456\",\n    \"closemode\": \"2\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec create_dca_bot_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Create DCA Bot
  Method: POST
  Path: /v5/dca/create-bot
  Requires signature: true
  """
  def create_dca_bot_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/dca/create-bot",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"parameters\": {\n        \"frequencyinsecond\": 0,\n        \"quotecoin\": \"USDT\",\n        \"pairs\": [\n            {\n                \"base\": \"BTC\",\n                \"amount\": \"1\"\n            },\n            {\n                \"base\": \"ETH\",\n                \"amount\": \"88\"\n            }\n        ],\n        \"maxinvestamount\": \"\"\n    }\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec close_bot_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Close Bot
  Method: POST
  Path: /v5/fcombobot/close
  Requires signature: true
  """
  def close_bot_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/fcombobot/close",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"botid\": \"123456\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec create_bot_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Create Bot
  Method: POST
  Path: /v5/fcombobot/create
  Requires signature: true
  """
  def create_bot_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/fcombobot/create",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"leverage\": \"\\\"5\\\"\",\n    \"initmargin\": \"\\\"1000\\\"\",\n    \"adjustpositionmode\": 0,\n    \"symbolsettings\": [\n        {\n            \"symbol\": \"BTCUSDT\",\n            \"targetpositionpercent\": \"\\\"0.5\\\"\",\n            \"side\": 0\n        }\n    ],\n    \"adjustpositionpercent\": \"\\\"0.05\\\"\",\n    \"adjustpositiontimeinterval\": 0,\n    \"slpercent\": \"\\\"0.2\\\"\",\n    \"tppercent\": \"\\\"0.5\\\"\",\n    \"trailingstoppercent\": \"\\\"0.05\\\"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_bot_detail_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Get Bot Detail
  Method: POST
  Path: /v5/fcombobot/detail
  Requires signature: true
  """
  def get_bot_detail_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/fcombobot/detail",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"botid\": \"123456\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_bot_parameter_limit_fcombobot_getlimit(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Bot Parameter Limit
  Method: POST
  Path: /v5/fcombobot/getlimit
  Requires signature: true
  """
  def get_bot_parameter_limit_fcombobot_getlimit(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/fcombobot/getlimit",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"leverage\": \"\\\"5\\\"\",\n    \"initmargin\": \"\",\n    \"adjustpositionmode\": 0,\n    \"symbolsettings\": [\n        {\n            \"symbol\": \"BTCUSDT\",\n            \"targetpositionpercent\": \"\",\n            \"side\": 0\n        }\n    ],\n    \"adjustpositionpercent\": \"\",\n    \"adjustpositiontimeinterval\": 0,\n    \"slpercent\": \"\\\"0.2\\\"\",\n    \"tppercent\": \"\\\"0.5\\\"\",\n    \"trailingstoppercent\": \"\\\"0.05\\\"\",\n    \"needtoslippage\": false\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec close_grid_bot_fgridbot_close(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Close Grid Bot
  Method: POST
  Path: /v5/fgridbot/close
  Requires signature: true
  """
  def close_grid_bot_fgridbot_close(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/fgridbot/close",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"botid\": \"123456\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec create_grid_bot_fgridbot_create(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Create Grid Bot
  Method: POST
  Path: /v5/fgridbot/create
  Requires signature: true
  """
  def create_grid_bot_fgridbot_create(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/fgridbot/create",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"symbol\": \"BTCUSDT\",\n    \"gridmode\": 0,\n    \"minprice\": \"1\",\n    \"maxprice\": \"1\",\n    \"cellnumber\": 0,\n    \"leverage\": \"\\\"5\\\"\",\n    \"gridtype\": 0,\n    \"totalinvestment\": \"\\\"1000\\\"\",\n    \"takeprofitper\": \"\\\"0.2\\\"\",\n    \"stoplossper\": \"\\\"0.1\\\"\",\n    \"takeprofitprice\": \"1\",\n    \"stoplossprice\": \"1\",\n    \"tpsltype\": 0,\n    \"entryprice\": \"1\",\n    \"trailingstopper\": \"\\\"0.05\\\"\",\n    \"moveupprice\": \"1\",\n    \"movedownprice\": \"1\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_grid_bot_detail_fgridbot_detail(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Grid Bot Detail
  Method: POST
  Path: /v5/fgridbot/detail
  Requires signature: true
  """
  def get_grid_bot_detail_fgridbot_detail(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/fgridbot/detail",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"botid\": \"123456\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec validate_grid_input_fgridbot(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Validate Grid Input
  Method: POST
  Path: /v5/fgridbot/validate
  Requires signature: true
  """
  def validate_grid_input_fgridbot(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/fgridbot/validate",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"symbol\": \"BTCUSDT\",\n    \"cellnumber\": 0,\n    \"minprice\": \"1\",\n    \"maxprice\": \"1\",\n    \"leverage\": \"\\\"5\\\"\",\n    \"gridtype\": 0,\n    \"gridmode\": 0,\n    \"stoplossprice\": \"1\",\n    \"takeprofitprice\": \"1\",\n    \"tpsltype\": 0,\n    \"entryprice\": \"1\",\n    \"stoplossper\": \"\\\"10\\\"\",\n    \"takeprofitper\": \"\\\"20\\\"\",\n    \"trailingstopper\": \"\\\"5\\\"\",\n    \"initmargin\": \"\",\n    \"moveupprice\": \"1\",\n    \"movedownprice\": \"1\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec close_martingale_bot_v5(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Close Martingale Bot
  Method: POST
  Path: /v5/fmartingalebot/close
  Requires signature: true
  """
  def close_martingale_bot_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/fmartingalebot/close",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"botid\": \"123456\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec create_martingale_bot_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Create Martingale Bot
  Method: POST
  Path: /v5/fmartingalebot/create
  Requires signature: true
  """
  def create_martingale_bot_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/fmartingalebot/create",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"symbol\": \"BTCUSDT\",\n    \"martingalemode\": 0,\n    \"leverage\": \"\\\"5\\\"\",\n    \"pricefloatpercent\": \"1\",\n    \"addpositionpercent\": \"\\\"1.1\\\"\",\n    \"addpositionnum\": 0,\n    \"initmargin\": \"\\\"1000\\\"\",\n    \"roundtppercent\": \"\\\"0.03\\\"\",\n    \"autocycletoggle\": 0,\n    \"slpercent\": \"\\\"0.2\\\"\",\n    \"entryprice\": \"1\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_martingale_bot_detail_v5(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Martingale Bot Detail
  Method: POST
  Path: /v5/fmartingalebot/detail
  Requires signature: true
  """
  def get_martingale_bot_detail_v5(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/fmartingalebot/detail",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"botid\": \"123456\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_bot_parameter_limit_fmartingalebot_getlimit(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Bot Parameter Limit
  Method: POST
  Path: /v5/fmartingalebot/getlimit
  Requires signature: true
  """
  def get_bot_parameter_limit_fmartingalebot_getlimit(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/fmartingalebot/getlimit",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"symbol\": \"BTCUSDT\",\n    \"martingalemode\": 0,\n    \"leverage\": \"\\\"5\\\"\",\n    \"pricefloatpercent\": \"1\",\n    \"addpositionpercent\": \"\\\"1\\\"\",\n    \"addpositionnum\": 0,\n    \"initmargin\": \"\",\n    \"roundtppercent\": \"\\\"0.03\\\"\",\n    \"slpercent\": \"\\\"0.2\\\"\",\n    \"entryprice\": \"1\",\n    \"needtoslippage\": false\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec close_grid_bot_grid_close_grid(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Close Grid Bot
  Method: POST
  Path: /v5/grid/close-grid
  Requires signature: true
  """
  def close_grid_bot_grid_close_grid(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/grid/close-grid",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"gridid\": \"123456\",\n    \"closemode\": \"2\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec create_grid_bot_grid_create_grid(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Create Grid Bot
  Method: POST
  Path: /v5/grid/create-grid
  Requires signature: true
  """
  def create_grid_bot_grid_create_grid(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/grid/create-grid",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"symbol\": \"BTCUSDT\",\n    \"maxprice\": \"1\",\n    \"minprice\": \"1\",\n    \"cellnumber\": 0,\n    \"investmode\": 0,\n    \"baseinvestment\": \"invest_mode\",\n    \"quoteinvestment\": \"invest_mode\",\n    \"entryprice\": \"1\",\n    \"stoplossprice\": \"1\",\n    \"takeprofitprice\": \"1\",\n    \"tspercent\": \"[0, 0.99]\",\n    \"enabletrailing\": false,\n    \"limitupprice\": \"1\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_grid_bot_detail_grid_query_grid_detail(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Grid Bot Detail
  Method: POST
  Path: /v5/grid/query-grid-detail
  Requires signature: true
  """
  def get_grid_bot_detail_grid_query_grid_detail(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/grid/query-grid-detail",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"gridid\": \"123456\"\n}")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec validate_grid_input_grid(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Validate Grid Input
  Method: POST
  Path: /v5/grid/validate-input
  Requires signature: true
  """
  def validate_grid_input_grid(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/v5/grid/validate-input",
          query: [],
          headers: [{"Content-Type", "application/json"}],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\n    \"symbol\": \"BTCUSDT\",\n    \"cellnumber\": 0,\n    \"minprice\": \"1\",\n    \"maxprice\": \"1\",\n    \"investmode\": 0,\n    \"baseinvestment\": \"invest_mode\",\n    \"quoteinvestment\": \"invest_mode\",\n    \"stoploss\": \"\",\n    \"takeprofit\": \"\",\n    \"entryprice\": \"1\",\n    \"tspercent\": \"[0, 0.99]\",\n    \"enabletrailing\": false,\n    \"limitupprice\": \"1\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
