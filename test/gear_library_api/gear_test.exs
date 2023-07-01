defmodule GearLibraryApi.GearTest do
  use GearLibraryApi.DataCase

  alias GearLibraryApi.Gear

  describe "libraries" do
    alias GearLibraryApi.Gear.Library

    import GearLibraryApi.GearFixtures

    @invalid_attrs %{name: nil}

    test "list_libraries/0 returns all libraries" do
      library = library_fixture()
      assert Gear.list_libraries() == [library]
    end

    test "get_library!/1 returns the library with given id" do
      library = library_fixture()
      assert Gear.get_library!(library.id) == library
    end

    test "create_library/1 with valid data creates a library" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Library{} = library} = Gear.create_library(valid_attrs)
      assert library.name == "some name"
    end

    test "create_library/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gear.create_library(@invalid_attrs)
    end

    test "update_library/2 with valid data updates the library" do
      library = library_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Library{} = library} = Gear.update_library(library, update_attrs)
      assert library.name == "some updated name"
    end

    test "update_library/2 with invalid data returns error changeset" do
      library = library_fixture()
      assert {:error, %Ecto.Changeset{}} = Gear.update_library(library, @invalid_attrs)
      assert library == Gear.get_library!(library.id)
    end

    test "delete_library/1 deletes the library" do
      library = library_fixture()
      assert {:ok, %Library{}} = Gear.delete_library(library)
      assert_raise Ecto.NoResultsError, fn -> Gear.get_library!(library.id) end
    end

    test "change_library/1 returns a library changeset" do
      library = library_fixture()
      assert %Ecto.Changeset{} = Gear.change_library(library)
    end
  end

  describe "items" do
    alias GearLibraryApi.Gear.Item

    import GearLibraryApi.GearFixtures

    @invalid_attrs %{name: nil, description: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Gear.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Gear.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{name: "some name", description: "some description"}

      assert {:ok, %Item{} = item} = Gear.create_item(valid_attrs)
      assert item.name == "some name"
      assert item.description == "some description"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gear.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description"}

      assert {:ok, %Item{} = item} = Gear.update_item(item, update_attrs)
      assert item.name == "some updated name"
      assert item.description == "some updated description"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Gear.update_item(item, @invalid_attrs)
      assert item == Gear.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Gear.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Gear.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Gear.change_item(item)
    end
  end
end
