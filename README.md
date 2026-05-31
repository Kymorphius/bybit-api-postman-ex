# BybitApiPostmanEx

Generate Elixir raw API modules from Bybit's official `QuickStartWithPostman` collections.

This project is a thin generated REST layer:

- clone or update `bybit-exchange/QuickStartWithPostman`;
- parse Postman collection files under `V5APIs`;
- generate Elixir modules under `lib/bybit/api/**`;
- build signed and unsigned Bybit REST requests;
- provide small IEx helpers for manual checks.

## Requirements

- Elixir `~> 1.19`
- Mix
- Network access to GitHub and Bybit endpoints

## Setup

```bash
mix deps.get
mix compile
```

## Pull Bybit Postman Collections

```bash
mix pull_repo
```

This clones or updates the upstream repository into `lib/bybit_api_postman_repo`.

## Generate Raw API Modules

Generate all Bybit V5 and Tax V3 modules:

```bash
mix generate_raw_api --all
```

Generate from one collection file:

```elixir
BybitApiPostmanEx.generate_raw_api("lib/bybit_api_postman_repo/V5APIs/Open API V5.postman_collection.json")
```

Generated modules are written under:

```text
lib/bybit/api/
├── open_api_v5/
│   ├── market.ex
│   ├── order.ex
│   ├── account.ex
│   └── ...
└── tax_v3/
    └── tax_v3.ex
```

Example raw calls:

```elixir
client = Bybit.Client.new("api_key", "api_secret", :testnet)

Bybit.API.OpenApiV5.Market.get_bybit_server_time_v5(client)
Bybit.API.OpenApiV5.Market.get_tickers_v5(client, "linear", "BTC")
Bybit.API.OpenApiV5.Market.get_orderbook_v5(client, "linear", "BTCUSDT", "25")

Bybit.API.OpenApiV5.Account.get_wallet_balance_v5(client, "UNIFIED")

Bybit.API.OpenApiV5.Order.place_order_linear_market_order_create(client,
  body: %{
    category: "linear",
    symbol: "BTCUSDT",
    side: "Buy",
    orderType: "Market",
    qty: "0.001"
  }
)
```

## Local Credentials

For local manual testing, copy `.env.example` to `.env` and fill in credentials:

```bash
BYBIT_API_KEY=your_api_key
BYBIT_API_SECRET=your_api_secret
BYBIT_ENV=testnet
```

Supported environment values are `prod` / `prod_url` and `testnet` / `testnet_url`.

## Request Behavior

The generated raw API functions call:

- `Bybit.RequestBuilder` to build URLs, headers and Bybit `X-BAPI-*` signatures;
- `Bybit.REST.HTTPClient` to execute requests through `Req`.

For signed Bybit endpoints, the request builder signs:

- GET: `timestamp + api_key + recv_window + query_string`;
- non-GET: `timestamp + api_key + recv_window + raw_body`.

## Tests

```bash
mix test
```
