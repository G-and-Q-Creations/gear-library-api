defmodule GearLibraryApi.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :email, :string
      add :role, :string

      timestamps()
    end

    create unique_index(:people, [:email])
  end
end
