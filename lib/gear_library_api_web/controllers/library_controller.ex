defmodule GearLibraryApiWeb.LibraryController do
  use GearLibraryApiWeb, :controller

  alias GearLibraryApi.Gear
  alias GearLibraryApi.Gear.Library

  action_fallback GearLibraryApiWeb.FallbackController

  def index(conn, _params) do
    libraries = Gear.list_libraries()
    render(conn, :index, libraries: libraries)
  end

  def create(conn, %{"library" => library_params}) do
    with {:ok, %Library{} = library} <- Gear.create_library(library_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/libraries/#{library}")
      |> render(:show, library: library)
    end
  end

  def show(conn, %{"id" => id}) do
    library = Gear.get_library!(id)
    render(conn, :show, library: library)
  end

  def update(conn, %{"id" => id, "library" => library_params}) do
    library = Gear.get_library!(id)

    with {:ok, %Library{} = library} <- Gear.update_library(library, library_params) do
      render(conn, :show, library: library)
    end
  end

  def delete(conn, %{"id" => id}) do
    library = Gear.get_library!(id)

    with {:ok, %Library{}} <- Gear.delete_library(library) do
      send_resp(conn, :no_content, "")
    end
  end
end
