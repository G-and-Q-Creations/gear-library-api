defmodule GearLibraryApi.Librarians.Librarian do
  @moduledoc """
  The Librarian schema manager
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "librarians" do
    belongs_to :person, GearLibraryApi.Accounts.Person
    belongs_to :library, GearLibraryApi.Gear.Library

    timestamps()
  end

  @doc false
  def changeset(librarian, attrs) do
    librarian
    |> cast(attrs, [:person_id, :library_id])
    |> validate_required([:person_id, :library_id])
  end
end
