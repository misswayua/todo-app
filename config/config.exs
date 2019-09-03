# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :todo,
  ecto_repos: [Todo.Repo]

# Configures the endpoint
config :todo, TodoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5sktcA3/sp1Ty7osW5vD6DywnpFKPRDLh/MVw07QTapOJ4HgCw9SbckL8jbBz4Bu",
  render_errors: [view: TodoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Todo.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "mrn1cjrk9pqvRkwy1Jj6m3OHXEHZiUXu"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
