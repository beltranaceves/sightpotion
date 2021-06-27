use Mix.Config

# Configure your database
config :sightpotion, Sightpotion.Repo,
  username: "postgres",
  password: "CQJg(.K)6--)M:n3",
  database: "sightpotion",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to recompile .js and .css sources.
config :sightpotion, Sighpotion.Endpoint,
  url: [host: "beltran.tk", port: 443],
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  force_ssl: [hsts: true],
  http: [port: 4000, transport_options: [socket_opts: [:inet6]]],
  https: [
    port: 4040,
    cipher_suite: :strong,
    transport_options: [socket_opts: [:inet6]]
  ]

# Set path to cert folder
config :sightpotion, :cert_path, "/home/beltranaceves/site_encrypt_db"

# Set the cert mode so site_encrypt knows to hit live LetsEncrypt
config :sightpotion, :cert_mode, "production"

# Do not print debug messages in production
config :logger, level: :debug
# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# Mix task:
#
#     mix phx.gen.cert
#
# Note that this task requires Erlang/OTP 20 or later.
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Watch static and templates for browser reloading.
config :sightpotion, SightpotionWeb.Endpoint,
  live_reload: [
    iframe_attrs: [class: "hidden"],
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/sightpotion_web/(live|views)/.*(ex)$",
      ~r"lib/sightpotion_web/templates/.*(eex)$"
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

config :sightpotion, Sightpotion.Mailer,
  adapter: Bamboo.LocalAdapter

