defmodule GearLibraryApi.Repo do
  use Ecto.Repo,
    otp_app: :gear_library_api,
    adapter: Ecto.Adapters.Postgres
end
