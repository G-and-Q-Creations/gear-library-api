defmodule GearLibraryApi.LibrariansFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GearLibraryApi.Librarians` context.
  """

  @doc """
  Generate a librarian.
  """
  def librarian_fixture(attrs \\ %{}) do
    {:ok, librarian} =
      attrs
      |> Enum.into(%{})
      |> GearLibraryApi.Librarians.create_librarian()

    librarian
  end
end
