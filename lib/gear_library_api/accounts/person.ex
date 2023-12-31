defmodule GearLibraryApi.Accounts.Person do
  @moduledoc """
  The Person schema manager
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "people" do
    field :name, :string
    field :role, Ecto.Enum, values: [:admin, :regular]
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :email])
    |> put_change(:role, :regular)
    |> validate_required([:name, :email, :role])
    |> unique_constraint(:email)
  end
end
