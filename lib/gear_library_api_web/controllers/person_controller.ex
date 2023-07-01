defmodule GearLibraryApiWeb.PersonController do
  use GearLibraryApiWeb, :controller

  alias GearLibraryApi.Accounts
  alias GearLibraryApi.Accounts.Person

  action_fallback GearLibraryApiWeb.FallbackController

  def index(conn, _params) do
    people = Accounts.list_people()
    render(conn, :index, people: people)
  end

  def create(conn, %{"person" => person_params}) do
    with {:ok, %Person{} = person} <- Accounts.create_person(person_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/people/#{person}")
      |> render(:show, person: person)
    end
  end

  def show(conn, %{"id" => id}) do
    person = Accounts.get_person!(id)
    render(conn, :show, person: person)
  end

  def update(conn, %{"id" => id, "person" => person_params}) do
    person = Accounts.get_person!(id)

    with {:ok, %Person{} = person} <- Accounts.update_person(person, person_params) do
      render(conn, :show, person: person)
    end
  end

  def delete(conn, %{"id" => id}) do
    person = Accounts.get_person!(id)

    with {:ok, %Person{}} <- Accounts.delete_person(person) do
      send_resp(conn, :no_content, "")
    end
  end
end
