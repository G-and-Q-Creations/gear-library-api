defmodule GearLibraryApi.LibrariansTest do
  use GearLibraryApi.DataCase

  alias GearLibraryApi.Librarians

  describe "librarians" do
    alias GearLibraryApi.Librarians.Librarian

    import GearLibraryApi.LibrariansFixtures

    @invalid_attrs %{}

    test "list_librarians/0 returns all librarians" do
      librarian = librarian_fixture()
      assert Librarians.list_librarians() == [librarian]
    end

    test "get_librarian!/1 returns the librarian with given id" do
      librarian = librarian_fixture()
      assert Librarians.get_librarian!(librarian.id) == librarian
    end

    test "create_librarian/1 with valid data creates a librarian" do
      valid_attrs = %{}

      assert {:ok, %Librarian{} = librarian} = Librarians.create_librarian(valid_attrs)
    end

    test "create_librarian/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Librarians.create_librarian(@invalid_attrs)
    end

    test "update_librarian/2 with valid data updates the librarian" do
      librarian = librarian_fixture()
      update_attrs = %{}

      assert {:ok, %Librarian{} = librarian} =
               Librarians.update_librarian(librarian, update_attrs)
    end

    test "update_librarian/2 with invalid data returns error changeset" do
      librarian = librarian_fixture()
      assert {:error, %Ecto.Changeset{}} = Librarians.update_librarian(librarian, @invalid_attrs)
      assert librarian == Librarians.get_librarian!(librarian.id)
    end

    test "delete_librarian/1 deletes the librarian" do
      librarian = librarian_fixture()
      assert {:ok, %Librarian{}} = Librarians.delete_librarian(librarian)
      assert_raise Ecto.NoResultsError, fn -> Librarians.get_librarian!(librarian.id) end
    end

    test "change_librarian/1 returns a librarian changeset" do
      librarian = librarian_fixture()
      assert %Ecto.Changeset{} = Librarians.change_librarian(librarian)
    end
  end
end
