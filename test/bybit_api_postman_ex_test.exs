defmodule BybitApiPostmanExTest do
  use ExUnit.Case
  doctest BybitApiPostmanEx

  test "request builder injects Bybit auth headers for signed requests" do
    client = Bybit.Client.new("api-key", "api-secret", :testnet)

    assert {:ok, request} =
             Bybit.RequestBuilder.build(%{
               client: client,
               requires_signature?: true,
               method: "GET",
               base_url: "https://api-testnet.bybit.com",
               url: "/v5/market/kline",
               query: [category: "linear", symbol: "BTCUSDT"],
               headers: [{"Content-Type", "application/json"}],
               body: nil
             })

    assert Keyword.fetch!(request.headers, :"X-BAPI-API-KEY") == "api-key"
    assert Keyword.fetch!(request.headers, :"X-BAPI-RECV-WINDOW") == "5000"
    assert Keyword.fetch!(request.headers, :"Content-Type") == "application/json"
    assert Keyword.fetch!(request.headers, :"X-BAPI-TIMESTAMP") |> is_binary()
    assert Keyword.fetch!(request.headers, :"X-BAPI-SIGN") =~ ~r/^[a-f0-9]{64}$/
  end

  test "http client returns ok for successful Bybit business responses" do
    body = %{"retCode" => 0, "retMsg" => "OK", "result" => %{"orderId" => "abc"}}

    assert Bybit.REST.HTTPClient.normalize_response({:ok, %Req.Response{status: 200, body: body}}) ==
             {:ok, body}
  end

  test "http client returns error for failed Bybit business responses" do
    body = %{
      "retCode" => 110_007,
      "retMsg" => "ab not enough for new order",
      "result" => %{}
    }

    assert Bybit.REST.HTTPClient.normalize_response({:ok, %Req.Response{status: 200, body: body}}) ==
             {:error, {:bybit_error, 110_007, "ab not enough for new order", body}}
  end
end
