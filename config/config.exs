# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sightpotion, ecto_repos: [Sightpotion.Repo], generators: [binary_id: true]

# Configures the endpoint
config :sightpotion, SightpotionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gezCztOVJKD3K7/pRxOCsVz2/26KpvIXP6iwcLAtR6kikK55jKMTPDbjxLrheGDc",
  render_errors: [view: SightpotionWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Sightpotion.PubSub,
  live_view: [signing_salt: "ywIHqVZp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :sightpotion, Sightpotion.Mailer,
  adapter: Bamboo.MandrillAdapter,
  api_key: "my_api_key"

config :kaffy,
   otp_app: :sightpotion,
   ecto_repo: Sightpotion.Repo,
   router: SightpotionWeb.Router

config :sightpotion, Oban,
  repo: Sightpotion.Repo,
  queues: [default: 10, mailers: 20, events: 50, low: 5],
  plugins: [
    Oban.Plugins.Pruner,
    {Oban.Plugins.Cron,
     crontab: [
     ]}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
