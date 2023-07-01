defmodule GearLibraryApi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GearLibraryApi.Accounts` context.
  """

  @doc """
  Generate a unique person email.
  """
  def unique_person_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a person.
  """
  def person_fixture(attrs \\ %{}) do
    {:ok, person} =
      attrs
      |> Enum.into(%{
        name: "some name",
        role: :admin,
        email: unique_person_email()
      })
      |> GearLibraryApi.Accounts.create_person()

    person
  end
end
