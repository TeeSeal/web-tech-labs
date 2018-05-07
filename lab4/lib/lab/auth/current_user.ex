defmodule Lab.CurrentUser do
  import Plug.Conn
  import Guardian.Plug

  def init(opts), do: opts

  def call(conn, _opts) do
    current_user = current_resource(conn)
    attach_user(conn, current_user)
  end

  def attach_user(conn, nil) do
    conn
    |> assign(:current_user, nil)
    |> assign(:admin_session, false)
  end

  def attach_user(conn, user) do
    conn
    |> assign(:current_user, user)
    |> assign(:admin_session, user.perm_level == 1)
  end
end
