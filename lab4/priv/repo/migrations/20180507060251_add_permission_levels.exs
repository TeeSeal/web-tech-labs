defmodule Lab.Repo.Migrations.AddPermissionLevels do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :perm_level, :integer, default: 0
    end
  end
end
