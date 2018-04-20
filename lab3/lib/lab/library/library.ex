defmodule Lab.Library do
  @moduledoc """
  The Library context.
  """

  import Ecto.Query, warn: false
  alias Lab.Repo

  alias Lab.Library.Tab

  @doc """
  Returns the list of tabs.

  ## Examples

      iex> list_tabs()
      [%Tab{}, ...]

  """
  def list_tabs do
    Repo.all(Tab)
  end

  def list_tabs_of_type(type) do
    Repo.all(from tab in Tab, where: tab.type == ^type)
  end

  def list_tabs_for_user(id) do
    Repo.all(from tab in Tab, where: tab.user_id == ^id)
  end

  @doc """
  Gets a single tab.

  Raises `Ecto.NoResultsError` if the Tab does not exist.

  ## Examples

      iex> get_tab!(123)
      %Tab{}

      iex> get_tab!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tab!(id), do: Repo.get!(Tab, id)

  @doc """
  Creates a tab.

  ## Examples

      iex> create_tab(%{field: value})
      {:ok, %Tab{}}

      iex> create_tab(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tab(attrs \\ %{}) do
    %Tab{}
    |> Tab.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tab.

  ## Examples

      iex> update_tab(tab, %{field: new_value})
      {:ok, %Tab{}}

      iex> update_tab(tab, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tab(%Tab{} = tab, attrs) do
    tab
    |> Tab.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tab.

  ## Examples

      iex> delete_tab(tab)
      {:ok, %Tab{}}

      iex> delete_tab(tab)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tab(%Tab{} = tab) do
    Repo.delete(tab)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tab changes.

  ## Examples

      iex> change_tab(tab)
      %Ecto.Changeset{source: %Tab{}}

  """
  def change_tab(%Tab{} = tab \\ %Tab{}) do
    Tab.changeset(tab, %{})
  end
end
