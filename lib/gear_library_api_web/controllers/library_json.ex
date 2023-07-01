defmodule GearLibraryApiWeb.LibraryJSON do
  alias GearLibraryApi.Gear.Library

  @doc """
  Renders a list of libraries.
  """
  def index(%{libraries: libraries}) do
    %{data: for(library <- libraries, do: data(library))}
  end

  @doc """
  Renders a single library.
  """
  def show(%{library: library}) do
    %{data: data(library)}
  end

  defp data(%Library{} = library) do
    %{
      id: library.id,
      name: library.name
    }
  end
end
