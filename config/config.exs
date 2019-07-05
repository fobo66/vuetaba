# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :phoenix, :json_library, Jason

# General application configuration
config :vuetaba,
  ecto_repos: [Vuetaba.Repo]

# Configures the endpoint
config :vuetaba, VuetabaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "W22rfmrSuCUZ/a8tMVBppPqjqkMoo7ZABc0G9WTHdOx88bOWzIo+V033joeq8jW7",
  render_errors: [view: VuetabaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Vuetaba.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
