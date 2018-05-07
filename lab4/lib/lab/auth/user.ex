defmodule Lab.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Lab.Auth.User
  alias Comeonin.Bcrypt

  schema "users" do
    field :password, :string
    field :username, :string
    field :perm_level, :integer

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password, :perm_level])
    |> validate_required([:username, :password])
    |> hash_password
  end

  def hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hashpwsalt(password))
  end

  def hash_password(changeset), do: changeset
end
