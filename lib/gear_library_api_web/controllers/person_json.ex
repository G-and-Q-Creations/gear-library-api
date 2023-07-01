defmodule GearLibraryApiWeb.PersonJSON do
  alias GearLibraryApi.Accounts.Person

  @doc """
  Renders a list of people.
  """
  def index(%{people: people}) do
    %{data: for(person <- people, do: data(person))}
  end

  @doc """
  Renders a single person.
  """
  def show(%{person: person}) do
    %{data: data(person)}
  end

  defp data(%Person{} = person) do
    %{
      id: person.id,
      name: person.name,
      email: person.email,
      role: person.role
    }
  end
end
