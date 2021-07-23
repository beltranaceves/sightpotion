defmodule Sightpotion.Repo do
  use Ecto.Repo,
    otp_app: :sightpotion,
    adapter: Ecto.Adapters.Postgres
end
