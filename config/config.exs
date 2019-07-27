# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
import Config

Config.config(:phoenix, :json_library, Jason)

# General application configuration
Config.config(:vuetaba,
  ecto_repos: [Vuetaba.Repo]
)

# Configures the endpoint
Config.config(:vuetaba, VuetabaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "W22rfmrSuCUZ/a8tMVBppPqjqkMoo7ZABc0G9WTHdOx88bOWzIo+V033joeq8jW7",
  render_errors: [view: VuetabaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Vuetaba.PubSub, adapter: Phoenix.PubSub.PG2]
)

# Configures Auth0 JWT auth
Config.config(:vuetaba, Vuetaba.AdminToken,
  # Auth0 gives you JWKS in format like https://YOUR_DOMAIN/.well-known/jwks.json
  jwks_url: {:system, "JWKS_URL"},
  # It's Auth0 domain or your custom domain in form of https://YOUR_DOMAIN/
  jwt_issuer: {:system, "JWT_ISSUER"},
  # field Identifier at your Auth0 API's Settings
  jwt_auditory: {:system, "JWT_AUDITORY"}
)

# Configures Elixir's Logger
Config.config(:logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]
)

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
Config.import_config("#{Mix.env()}.exs")
