defmodule Lab.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :lab,
    error_handler: Lab.Auth.ErrorHandler,
    module: Lab.Auth.Guardian

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
end
