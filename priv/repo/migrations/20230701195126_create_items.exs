defmodule GearLibraryApi.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :text
      add :library_id, references(:libraries, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:items, [:library_id])
  end
end
