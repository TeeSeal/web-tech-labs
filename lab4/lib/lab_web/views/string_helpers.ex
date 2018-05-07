defmodule LabWeb.StringHelpers do
  def capitalize(string) do
    (String.first(string) |> String.upcase()) <> String.slice(string, 1..-1)
  end
end
