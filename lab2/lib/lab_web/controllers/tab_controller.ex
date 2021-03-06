defmodule LabWeb.TabController do
  use LabWeb, :controller

  alias Lab.Library
  alias Lab.Library.Tab

  def index(conn, %{"type" => type}) do
    tabs = Library.list_tabs_of_type(type)
    render(conn, "index.html", tabs: tabs, type: type)
  end

  def index(conn, _params) do
    tabs = Library.list_tabs()
    render(conn, "index.html", tabs: tabs)
  end

  def new(conn, %{"type" => type}) do
    changeset = Library.change_tab(%Tab{})
    render(conn, "new.html", changeset: changeset, type: type)
  end

  def create(conn, %{"tab" => tab_params}) do
    case Library.create_tab(tab_params) do
      {:ok, _tab} ->
        conn
        |> put_flash(:info, "Tab created successfully.")
        |> redirect(to: tab_path(conn, :index, tab_params["type"]))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tab = Library.get_tab!(id)
    render(conn, "show.html", tab: tab)
  end

  def edit(conn, %{"id" => id}) do
    tab = Library.get_tab!(id)
    changeset = Library.change_tab(tab)
    render(conn, "edit.html", tab: tab, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tab" => tab_params}) do
    tab = Library.get_tab!(id)

    case Library.update_tab(tab, tab_params) do
      {:ok, tab} ->
        conn
        |> put_flash(:info, "Tab updated successfully.")
        |> redirect(to: tab_path(conn, :show, tab))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tab: tab, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tab = Library.get_tab!(id)
    {:ok, _tab} = Library.delete_tab(tab)

    conn
    |> put_flash(:info, "Tab deleted successfully.")
    |> redirect(to: tab_path(conn, :index, tab.type))
  end
end
