defmodule GearLibraryApi.Librarians.Librarian do
  @moduledoc """
  The Librarian schema manager
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "librarians" do
    field :person, :binary_id
    field :library, :binary_id

    timestamps()
  end

  @doc false
  def changeset(librarian, attrs) do
    librarian
    |> cast(attrs, [])
    |> validate_required([])
  end
end
