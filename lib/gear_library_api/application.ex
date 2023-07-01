defmodule GearLibraryApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GearLibraryApiWeb.Telemetry,
      # Start the Ecto repository
      GearLibraryApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: GearLibraryApi.PubSub},
      # Start Finch
      {Finch, name: GearLibraryApi.Finch},
      # Start the Endpoint (http/https)
      GearLibraryApiWeb.Endpoint
      # Start a worker by calling: GearLibraryApi.Worker.start_link(arg)
      # {GearLibraryApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GearLibraryApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GearLibraryApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
