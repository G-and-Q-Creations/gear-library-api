defmodule GearLibraryApi.Repo.Migrations.CreateLibrarians do
  use Ecto.Migration

  def change do
    create table(:librarians, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :person, references(:people, on_delete: :nothing, type: :binary_id)
      add :library, references(:libraries, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:librarians, [:person])
    create index(:librarians, [:library])
  end
end
