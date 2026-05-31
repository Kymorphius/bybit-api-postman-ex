defmodule Bybit.REST.Request do
  @moduledoc false

  defstruct [:method, :url, :headers, :body]
end
