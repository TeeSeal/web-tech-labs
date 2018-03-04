defmodule Lab.Repo.Migrations.AddTypeToTabs do
  use Ecto.Migration

  def change do
    alter table(:tabs) do
      add :type, :string
    end
  end
end
