# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :mycards_api, MycardsApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GMzt1d+IPzm5ND1eUHkgz8Eygfa/f3LwgEcWXpAQzznWtM++unnncLQM2w30TPFI",
  render_errors: [view: MycardsApiWeb.ErrorsView, accepts: ~w(json)],
  pubsub: [name: MycardsApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :joken, default_signer: System.get_env("AUTH_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
