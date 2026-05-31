defmodule Mix.Tasks.GenerateRawApi do
  use Mix.Task

  @shortdoc "Generate raw API Elixir files from Bybit Postman collections"

  @moduledoc """
  Generates raw API Elixir files from the Bybit Postman repository.
  """

  @impl Mix.Task
  def run(args) do
    Mix.Task.run("app.start")

    collections_dir =
      case args do
        ["--all" | _] -> Path.expand("lib/bybit_api_postman_repo/V5APIs")
        [path | _] -> Path.expand(path)
        _ -> Path.expand("lib/bybit_api_postman_repo/V5APIs")
      end

    if File.dir?(collections_dir) do
      clean_generated_api_dir()

      collections_dir
      |> Path.join("*.json")
      |> Path.wildcard()
      |> Enum.each(&BybitApiPostmanEx.generate_raw_api/1)

      Mix.shell().info("Generated raw API files for all collections under #{collections_dir}")
    else
      clean_generated_api_dir()
      BybitApiPostmanEx.generate_raw_api(collections_dir)
      Mix.shell().info("Generated raw API files from #{collections_dir}")
    end
  end

  defp clean_generated_api_dir do
    dir = Path.expand("lib/bybit/api")
    File.rm_rf!(dir)
    Mix.shell().info("Cleaned generated API directory: #{dir}")
  end
end
