defmodule GearLibraryApi.Librarians do
  @moduledoc """
  The Librarians context.
  """

  import Ecto.Query, warn: false
  alias GearLibraryApi.Repo

  alias GearLibraryApi.Librarians.Librarian

  @doc """
  Returns the list of librarians.

  ## Examples

      iex> list_librarians()
      [%Librarian{}, ...]

  """
  def list_librarians do
    Repo.all(Librarian)
  end

  @doc """
  Gets a single librarian.

  Raises `Ecto.NoResultsError` if the Librarian does not exist.

  ## Examples

      iex> get_librarian!(123)
      %Librarian{}

      iex> get_librarian!(456)
      ** (Ecto.NoResultsError)

  """
  def get_librarian!(id), do: Repo.get!(Librarian, id)

  @doc """
  Creates a librarian.

  ## Examples

      iex> create_librarian(%{field: value})
      {:ok, %Librarian{}}

      iex> create_librarian(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_librarian(attrs \\ %{}) do
    %Librarian{}
    |> Librarian.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a librarian.

  ## Examples

      iex> update_librarian(librarian, %{field: new_value})
      {:ok, %Librarian{}}

      iex> update_librarian(librarian, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_librarian(%Librarian{} = librarian, attrs) do
    librarian
    |> Librarian.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a librarian.

  ## Examples

      iex> delete_librarian(librarian)
      {:ok, %Librarian{}}

      iex> delete_librarian(librarian)
      {:error, %Ecto.Changeset{}}

  """
  def delete_librarian(%Librarian{} = librarian) do
    Repo.delete(librarian)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking librarian changes.

  ## Examples

      iex> change_librarian(librarian)
      %Ecto.Changeset{data: %Librarian{}}

  """
  def change_librarian(%Librarian{} = librarian, attrs \\ %{}) do
    Librarian.changeset(librarian, attrs)
  end
end
