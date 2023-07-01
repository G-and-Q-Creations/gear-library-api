defmodule GearLibraryApi.Gear.Library do
  @moduledoc """
  The Library schema manager
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "libraries" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(library, attrs) do
    library
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
