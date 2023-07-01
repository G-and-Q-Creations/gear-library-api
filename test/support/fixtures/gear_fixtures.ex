defmodule GearLibraryApi.GearFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GearLibraryApi.Gear` context.
  """

  @doc """
  Generate a library.
  """
  def library_fixture(attrs \\ %{}) do
    {:ok, library} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> GearLibraryApi.Gear.create_library()

    library
  end

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description"
      })
      |> GearLibraryApi.Gear.create_item()

    item
  end
end