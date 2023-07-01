defmodule GearLibraryApiWeb.ItemController do
  use GearLibraryApiWeb, :controller

  alias GearLibraryApi.Gear
  alias GearLibraryApi.Gear.Item

  action_fallback GearLibraryApiWeb.FallbackController

  def index(conn, _params) do
    items = Gear.list_items()
    render(conn, :index, items: items)
  end

  def create(conn, %{"item" => item_params}) do
    with {:ok, %Item{} = item} <- Gear.create_item(item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/items/#{item}")
      |> render(:show, item: item)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Gear.get_item!(id)
    render(conn, :show, item: item)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Gear.get_item!(id)

    with {:ok, %Item{} = item} <- Gear.update_item(item, item_params) do
      render(conn, :show, item: item)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Gear.get_item!(id)

    with {:ok, %Item{}} <- Gear.delete_item(item) do
      send_resp(conn, :no_content, "")
    end
  end
end
