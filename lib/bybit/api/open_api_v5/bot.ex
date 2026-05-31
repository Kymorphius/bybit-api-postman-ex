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
                "{\n    \"bot_id\": \"123456\",\n    \"close_mode\": \"2\"\n}"
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
                "{\n    \"parameters\": {\n        \"frequency_in_second\": 0,\n        \"quote_coin\": \"USDT\",\n        \"pairs\": [\n            {\n                \"base\": \"BTC\",\n                \"amount\": \"1\"\n            }\n        ],\n        \"max_invest_amount\": \"\"\n    }\n}"
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
          headers: [
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"bot_id\": \"123456\"\n}")}
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
                "{\n    \"leverage\": \"\\\"5\\\"\",\n    \"init_margin\": \"\\\"1000\\\"\",\n    \"adjust_position_mode\": 0,\n    \"symbol_settings\": [\n        {\n            \"symbol\": \"BTCUSDT\",\n            \"target_position_percent\": \"\\\"0.5\\\"\",\n            \"side\": 0\n        }\n    ],\n    \"adjust_position_percent\": \"\\\"0.05\\\"\",\n    \"adjust_position_time_interval\": 0,\n    \"sl_percent\": \"\\\"0.2\\\"\",\n    \"tp_percent\": \"\\\"0.5\\\"\",\n    \"trailing_stop_percent\": \"\\\"0.05\\\"\"\n}"
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
          headers: [
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"bot_id\": \"123456\"\n}")}
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
                "{\n    \"leverage\": \"\\\"5\\\"\",\n    \"init_margin\": \"\",\n    \"adjust_position_mode\": 0,\n    \"symbol_settings\": [\n        {\n            \"symbol\": \"BTCUSDT\",\n            \"target_position_percent\": \"\",\n            \"side\": 0\n        }\n    ],\n    \"adjust_position_percent\": \"\",\n    \"adjust_position_time_interval\": 0,\n    \"sl_percent\": \"\\\"0.2\\\"\",\n    \"tp_percent\": \"\\\"0.5\\\"\",\n    \"trailing_stop_percent\": \"\\\"0.05\\\"\",\n    \"need_to_slippage\": false\n}"
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
          headers: [
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"bot_id\": \"123456\"\n}")}
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
                "{\n    \"symbol\": \"BTCUSDT\",\n    \"grid_mode\": 0,\n    \"min_price\": \"\",\n    \"max_price\": \"\",\n    \"cell_number\": 0,\n    \"leverage\": \"\\\"5\\\"\",\n    \"grid_type\": 0,\n    \"total_investment\": \"\\\"1000\\\"\",\n    \"take_profit_per\": \"\\\"0.2\\\"\",\n    \"stop_loss_per\": \"\\\"0.1\\\"\",\n    \"take_profit_price\": \"tp_sl_type\",\n    \"stop_loss_price\": \"tp_sl_type\",\n    \"tp_sl_type\": 0,\n    \"entry_price\": \"\",\n    \"trailing_stop_per\": \"\\\"0.05\\\"\",\n    \"move_up_price\": \"2\",\n    \"move_down_price\": \"2\"\n}"
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
          headers: [
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"bot_id\": \"123456\"\n}")}
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
                "{\n    \"symbol\": \"BTCUSDT\",\n    \"cell_number\": 0,\n    \"min_price\": \"\",\n    \"max_price\": \"\",\n    \"leverage\": \"\\\"5\\\"\",\n    \"grid_type\": 0,\n    \"grid_mode\": 0,\n    \"stop_loss_price\": \"tp_sl_type\",\n    \"take_profit_price\": \"tp_sl_type\",\n    \"tp_sl_type\": 0,\n    \"entry_price\": \"\",\n    \"stop_loss_per\": \"\\\"10\\\"\",\n    \"take_profit_per\": \"\\\"20\\\"\",\n    \"trailing_stop_per\": \"\\\"5\\\"\",\n    \"init_margin\": \"\",\n    \"move_up_price\": \"\",\n    \"move_down_price\": \"\"\n}"
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
          headers: [
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"bot_id\": \"123456\"\n}")}
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
                "{\n    \"symbol\": \"BTCUSDT\",\n    \"martingale_mode\": 0,\n    \"leverage\": \"\\\"5\\\"\",\n    \"price_float_percent\": \"\\\"0.015\\\"\",\n    \"add_position_percent\": \"\\\"1.1\\\"\",\n    \"add_position_num\": 0,\n    \"init_margin\": \"\\\"1000\\\"\",\n    \"round_tp_percent\": \"\\\"0.03\\\"\",\n    \"auto_cycle_toggle\": 0,\n    \"sl_percent\": \"\\\"0.2\\\"\",\n    \"entry_price\": \"\"\n}"
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
          headers: [
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"bot_id\": \"123456\"\n}")}
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
                "{\n    \"symbol\": \"BTCUSDT\",\n    \"martingale_mode\": 0,\n    \"leverage\": \"\\\"5\\\"\",\n    \"price_float_percent\": \"\\\"0.015\\\"\",\n    \"add_position_percent\": \"\\\"1\\\"\",\n    \"add_position_num\": 0,\n    \"init_margin\": \"\",\n    \"round_tp_percent\": \"\\\"0.03\\\"\",\n    \"sl_percent\": \"\\\"0.2\\\"\",\n    \"entry_price\": \"\",\n    \"need_to_slippage\": false\n}"
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
                "{\n    \"grid_id\": \"123456\",\n    \"close_mode\": \"2\"\n}"
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
                "{\n    \"symbol\": \"BTCUSDT\",\n    \"max_price\": \"\",\n    \"min_price\": \"\",\n    \"cell_number\": 0,\n    \"invest_mode\": 0,\n    \"base_investment\": \"invest_mode\",\n    \"quote_investment\": \"invest_mode\",\n    \"entry_price\": \"\",\n    \"stop_loss_price\": \"\",\n    \"take_profit_price\": \"\",\n    \"ts_percent\": \"[0, 0.99]\",\n    \"enable_trailing\": false,\n    \"limit_up_price\": \"\"\n}"
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
          headers: [
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "{\n    \"grid_id\": \"123456\"\n}")}
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
                "{\n    \"symbol\": \"BTCUSDT\",\n    \"cell_number\": 0,\n    \"min_price\": \"\",\n    \"max_price\": \"min_price\",\n    \"invest_mode\": 0,\n    \"base_investment\": \"invest_mode\",\n    \"quote_investment\": \"invest_mode\",\n    \"stop_loss\": \"\",\n    \"take_profit\": \"\",\n    \"entry_price\": \"\",\n    \"ts_percent\": \"[0, 0.99]\",\n    \"enable_trailing\": false,\n    \"limit_up_price\": \"\"\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
