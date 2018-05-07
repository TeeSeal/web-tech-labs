defmodule LabWeb.SessionController do
  use LabWeb, :controller
  alias Lab.Auth
  alias Lab.Auth.User
  alias Lab.Auth.Guardian

  def new(conn, _params) do
    changeset = Auth.change_user(%User{})
    render(conn, "new.html", changeset: changeset, action: session_path(conn, :create))
  end

  def create(conn, %{"user" => %{"username" => username, "password" => password}}) do
    Auth.authenticate_user(username, password)
    |> login_reply(conn)
  end

  defp login_reply({:error, error}, conn) do
    conn
    |> put_flash(:error, error)
    |> redirect(to: "/")
  end

  defp login_reply({:ok, user}, conn) do
    conn
    |> put_flash(:success, "Welcome")
    |> Guardian.Plug.sign_in(user)
    |> redirect(to: "/")
  end

  def delete(conn, _) do
    conn
    |> put_flash(:success, "You have been logged out")
    |> Guardian.Plug.sign_out()
    |> redirect(to: "/")
  end
end
