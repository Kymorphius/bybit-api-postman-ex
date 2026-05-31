defmodule Bybit.API.TaxV3 do
  @moduledoc false

  @base_urls %{prod_url: "https://api.bybit.com", testnet_url: "https://api-testnet.bybit.com"}

  def base_url(key \\ :prod_url) do
    case Map.fetch(@base_urls, key) do
      {:ok, url} -> {:ok, url}
      :error -> {:error, {:unsupported_env, key}}
    end
  end

  @spec get_user_register_date_v3(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get User Register Date
  Method: POST
  Path: /fht/compliance/tax/v3/private/registertime
  Requires signature: true
  """
  def get_user_register_date_v3(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/fht/compliance/tax/v3/private/registertime",
          query: [],
          headers: [
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"X-BAPI-SIGN", "{{signature}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{mode: "raw", raw: Keyword.get(opts, :body, "")}
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec request_export_report_v3(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Request Export Report
  Method: POST
  Path: /fht/compliance/tax/v3/private/create
  Requires signature: true
  """
  def request_export_report_v3(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/fht/compliance/tax/v3/private/create",
          query: [],
          headers: [
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"X-BAPI-SIGN", "{{signature}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{
            mode: "raw",
            raw:
              Keyword.get(
                opts,
                :body,
                "{\r\n    \"type\": \"TRADE\",\r\n    \"number\":\"2\",\r\n    \"startTime\": \"1718143200\",\r\n    \"endTime\": \"1718283600\"\r\n}"
              )
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec get_export_report_status_v3(Bybit.Client.t(), Keyword.t()) ::
          {:ok, term()} | {:error, term()}
  @doc """
  Get Export Report Status
  Method: POST
  Path: /fht/compliance/tax/v3/private/status
  Requires signature: true
  """
  def get_export_report_status_v3(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/fht/compliance/tax/v3/private/status",
          query: [],
          headers: [
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"X-BAPI-SIGN", "{{signature}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{
            mode: "raw",
            raw: Keyword.get(opts, :body, "{\r\n    \"queryId\": \"12312312415325325\"\r\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end

  @spec retrieve_data_export_v3(Bybit.Client.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
  @doc """
  Retrieve Data Export
  Method: POST
  Path: /fht/compliance/tax/v3/private/url
  Requires signature: true
  """
  def retrieve_data_export_v3(client, opts \\ []) do
    with {:ok, base_url} <- base_url(client.env) do
      {:ok, request} =
        Bybit.RequestBuilder.build(%{
          client: client,
          requires_signature?: true,
          method: "POST",
          base_url: base_url,
          url: "/fht/compliance/tax/v3/private/url",
          query: [],
          headers: [
            {"X-BAPI-SIGN", "{{signature}}"},
            {"X-BAPI-API-KEY", "{{bybit-api-key}}"},
            {"X-BAPI-TIMESTAMP", "{{timestamp}}"},
            {"X-BAPI-RECV-WINDOW", "{{recvWindow}}"},
            {"X-BAPI-SIGN", "{{signature}}"},
            {"Content-Type", "application/json"}
          ],
          body: %{
            mode: "raw",
            raw: Keyword.get(opts, :body, "{\r\n    \"queryId\": \"12312312415325325\"\r\n}")
          }
        })

      Bybit.REST.HTTPClient.request(request)
    end
  end
end
