alias BybitApiPostmanEx
alias Bybit.Example

IO.puts("""

Bybit API Postman Ex IEx helpers

Code generation:
  BybitApiPostmanEx.pull_repo()
  BybitApiPostmanEx.generate_raw_api("lib/bybit_api_postman_repo/V5APIs/Open API V5.postman_collection.json")

Mix task shortcuts:
  mix pull_repo
  mix generate_raw_api --all

Bybit.Example examples:
  Bybit.Example.server_time()
  Bybit.Example.market_tickers("linear", "BTC")
  Bybit.Example.orderbook("linear", "BTCUSDT", "25")
  Bybit.Example.wallet_balance("UNIFIED")

Environment file:
  Copy .env.example to .env and fill in BYBIT_API_KEY, BYBIT_API_SECRET, BYBIT_ENV.
""")

Logger.configure(level: :debug)
