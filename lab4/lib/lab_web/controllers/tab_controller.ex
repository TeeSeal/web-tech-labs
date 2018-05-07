defmodule LabWeb.TabController do
  use LabWeb, :controller

  alias Lab.Library

  plug :check_access when action in [:edit, :update, :delete]

  def index(conn, %{"type" => type}) do
    tabs = Library.list_tabs_of_type(type)
    render(conn, "index.html", tabs: tabs, type: type)
  end

  def index(conn, _params) do
    tabs = Library.list_tabs()
    render(conn, "index.html", tabs: tabs)
  end

  def new(conn, %{"type" => type}) do
    changeset = Library.change_tab()
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
      {:ok, _tab} ->
        conn
        |> put_flash(:info, "Tab updated successfully.")
        |> redirect(to: tab_path(conn, :index, tab_params["type"]))
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

  defp check_access(conn, _params) do
    tab = Library.get_tab!(conn.params["id"])
    user = conn.assigns.current_user
    case tab.user_id == user.id || user.perm_level == 1 do
      true -> conn
      false -> unauthorize(conn)
    end
  end

  defp unauthorize(conn) do
    conn
    |> put_status(403)
    |> render(LabWeb.ErrorView, "403.html", [])
  end
end
