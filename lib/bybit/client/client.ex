defmodule Bybit.Client do
  @moduledoc false

  @enforce_keys [:api_key, :api_secret, :env]
  defstruct [:api_key, :api_secret, :env]

  @type env :: :prod_url | :testnet_url | :demo_url | atom() | binary()
  @type t :: %__MODULE__{
          api_key: binary(),
          api_secret: binary(),
          env: env()
        }

  def new(api_key, api_secret, env \\ :prod) do
    %__MODULE__{
      api_key: api_key,
      api_secret: api_secret,
      env: normalize_env(env)
    }
  end

  defp normalize_env(env) when is_atom(env) do
    env
    |> Atom.to_string()
    |> normalize_env()
  end

  defp normalize_env(env) when is_binary(env) do
    case env do
      "prod" -> :prod_url
      "testnet" -> :testnet_url
      "demo" -> :demo_url
      "prod_url" -> :prod_url
      "testnet_url" -> :testnet_url
      "demo_url" -> :demo_url
      other -> String.to_existing_atom(other)
    end
  end
end
