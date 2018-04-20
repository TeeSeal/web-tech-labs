defmodule LabWeb.UserController do
  use LabWeb, :controller

  alias Lab.Auth
  alias Lab.Auth.User

  def new(conn, _params) do
    changeset = Auth.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Auth.create_user(user_params) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def me(conn, _) do
    render(conn, "show.html", user: Guardian.Plug.current_resource(conn))
  end
end
