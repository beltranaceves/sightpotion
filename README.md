# Sightpotion
Containerized following [this](https://dev.to/hlappa/development-environment-for-elixir-phoenix-with-docker-and-docker-compose-2g17).
To start your Phoenix server regularly:

  * Install dependencies with `mix deps.docker-compose build`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

To start with docker compose:

  * Build docker image `docker-compose build`
  * Create and migrate your docker-compose database with `docker-compose run web mix ecto.create`
  * Start containers with `docker-compose up`
  * Stop containers with `docker-compose down`


Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
