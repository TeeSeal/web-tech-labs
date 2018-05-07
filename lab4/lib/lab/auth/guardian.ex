defmodule Lab.Auth.Guardian do
  use Guardian, otp_app: :lab
  alias Lab.Auth

  def subject_for_token(user, _claims) do
    IO.inspect user
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(claims) do
    user = Auth.get_user!(claims["sub"])
    {:ok, user}
  end
end
