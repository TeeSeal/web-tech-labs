defmodule Lab.Library.Tab do
  use Ecto.Schema
  import Ecto.Changeset
  alias Lab.Library.Tab


  schema "tabs" do
    field :album, :string
    field :album_image_url, :string
    field :artist, :string
    field :genre, :string
    field :tab, :string
    field :title, :string
    field :user_id, :id
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(%Tab{} = tab, attrs) do
    tab
    |> cast(attrs, [:title, :artist, :album, :album_image_url, :genre, :tab, :type])
    |> validate_required([:title, :artist, :album, :album_image_url, :genre, :tab, :type])
  end
end
