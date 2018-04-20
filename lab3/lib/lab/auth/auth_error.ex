defmodule Lab.Auth.ErrorHandler do
  alias Phoenix.Controller
  def auth_error(conn, {_type, _reason}, _opts) do
    conn
    |> Controller.put_flash(:info, "You need to login first")
    |> Controller.redirect(to: "/login")
  end
end
