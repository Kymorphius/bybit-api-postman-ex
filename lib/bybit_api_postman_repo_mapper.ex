defmodule BybitApiPostmanRepoMapper do
  @moduledoc """
  Maps parsed Postman collections and folders to output paths.
  """

  def collection_dir(collection_name) do
    (["lib", "bybit", "api"] ++ collection_dir_parts(collection_name))
    |> Path.join()
  end

  def collection_base_url(collection_variables) when is_map(collection_variables) do
    collection_variables
    |> Map.take(["prod_url", "testnet_url", "demo_url"])
    |> Enum.find_value(fn
      {_key, value} when is_binary(value) and value != "" -> value
      _ -> nil
    end)
  end

  def collection_base_url(_), do: nil

  def module_name(collection_name, folder_name) do
    collection_module = collection_module_name_parts(collection_name)
    folder_module = folder_name |> normalize_name() |> Macro.camelize()

    (["Bybit", "API"] ++
       collection_module ++ maybe_append_folder_module(collection_module, folder_module))
    |> Enum.join(".")
  end

  defp maybe_append_folder_module(collection_module, folder_module) do
    if List.last(collection_module) == folder_module do
      []
    else
      [folder_module]
    end
  end

  def folder_file_name(folder_name) do
    folder_name
    |> normalize_name()
    |> Kernel.<>(".ex")
  end

  defp collection_dir_parts(collection_name) do
    collection_name
    |> String.replace_prefix("Bybit ", "")
    |> String.replace_suffix(" english standard", "")
    |> String.replace_suffix(" REST API", "")
    |> String.replace_suffix(" API", "")
    |> String.trim()
    |> case do
      <<"Derivatives Trading ", rest::binary>> ->
        ["derivatives_trading", normalize_name(rest)]

      other ->
        [normalize_name(other)]
    end
  end

  defp collection_module_name_parts(collection_name) do
    collection_name
    |> String.replace_prefix("Bybit ", "")
    |> String.replace_suffix(" english standard", "")
    |> String.replace_suffix(" REST API", "")
    |> String.replace_suffix(" API", "")
    |> String.trim()
    |> case do
      <<"Derivatives Trading ", rest::binary>> ->
        ["DerivativesTrading", Macro.camelize(normalize_name(rest))]

      other ->
        [Macro.camelize(normalize_name(other))]
    end
  end

  def normalize_name(name) do
    name
    |> String.downcase()
    |> String.replace(~r/\(.*?\)/u, "")
    |> String.replace(~r/[^a-z0-9]+/u, "_")
    |> String.trim("_")
  end
end
