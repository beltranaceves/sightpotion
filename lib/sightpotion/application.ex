defmodule Sightpotion.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Sightpotion.Repo,
      # Start the Telemetry supervisor
      SightpotionWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Sightpotion.PubSub},
      # Start the Endpoint (http/https)
      SightpotionWeb.Endpoint,
      # Start a worker by calling: Sightpotion.Worker.start_link(arg)
      # {Sightpotion.Worker, arg}
      {Oban, oban_config()},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sightpotion.Supervisor]
    Sightpotion.Release.migrate()
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SightpotionWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp oban_config do # Add this line
    Application.fetch_env!(:sightpotion, Oban)
  end
end
