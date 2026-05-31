defmodule Bybit.Example do
  @moduledoc """
  Small examples for calling generated raw Bybit API modules manually.
  """

  alias Bybit.Client
  alias Bybit.API.OpenApiV5.Account
  alias Bybit.API.OpenApiV5.Market
  alias Bybit.API.OpenApiV5.Order
  alias Bybit.API.TaxV3

  @commands [
    {"mix pull_repo",
     "Clone or update the Bybit Postman repository into lib/bybit_api_postman_repo"},
    {"mix generate_raw_api --all", "Generate raw API modules from all Bybit Postman collections"},
    {"mix compile", "Compile the project after code changes"},
    {"mix test", "Run the test suite"},
    {"iex -S mix", "Open an interactive shell with the project loaded"}
  ]

  def commands do
    @commands
  end

  def prompt do
    Enum.map_join(@commands, "\n", fn {command, description} ->
      "- #{command} - #{description}"
    end)
  end

  def sample_client do
    load_dotenv()

    api_key = System.fetch_env!("BYBIT_API_KEY")
    api_secret = System.fetch_env!("BYBIT_API_SECRET")
    env = System.get_env("BYBIT_ENV", "testnet") |> String.to_atom()

    Client.new(api_key, api_secret, env)
  end

  def server_time do
    Market.get_bybit_server_time(sample_client())
  end

  def market_tickers(category \\ "linear", base_coin \\ "BTC") do
    Market.get_tickers(sample_client(), category, base_coin)
  end

  def orderbook(category \\ "linear", symbol \\ "BTCUSDT", limit \\ "25") do
    Market.get_orderbook(sample_client(), category, symbol, limit)
  end

  def wallet_balance(account_type \\ "UNIFIED", opts \\ []) do
    Account.get_wallet_balance(sample_client(), account_type, opts)
  end

  def place_order(body) when is_map(body) or is_binary(body) do
    Order.place_order_linear_market_order_create(sample_client(), body: body)
  end

  def tax_register_date(body \\ "") do
    TaxV3.get_user_register_date(sample_client(), body: body)
  end

  defp load_dotenv(path \\ ".env") do
    if File.exists?(path) do
      path
      |> File.stream!()
      |> Stream.map(&String.trim/1)
      |> Stream.reject(&(&1 == "" or String.starts_with?(&1, "#")))
      |> Enum.each(&put_env_line/1)
    end

    :ok
  end

  defp put_env_line(line) do
    case String.split(line, "=", parts: 2) do
      [key, value] -> System.put_env(String.trim(key), trim_env_value(value))
      _ -> :ok
    end
  end

  defp trim_env_value(value) do
    value
    |> String.trim()
    |> String.trim_leading("\"")
    |> String.trim_trailing("\"")
    |> String.trim_leading("'")
    |> String.trim_trailing("'")
  end
end
