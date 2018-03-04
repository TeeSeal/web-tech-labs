defmodule LabWeb.TabView do
  use LabWeb, :view

  def capitalize(string) do
    (String.first(string) |> String.upcase()) <> String.slice(string, 1..-1)
  end
end
