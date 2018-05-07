defmodule Lab.Repo.Migrations.CreateTabs do
  use Ecto.Migration

  def change do
    create table(:tabs) do
      add :title, :string
      add :artist, :string
      add :album, :string
      add :album_image_url, :string
      add :genre, :string
      add :tab, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:tabs, [:user_id])
  end
end
