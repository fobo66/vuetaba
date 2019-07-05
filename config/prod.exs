use Mix.Config

# For production, we often load configuration from external
# sources, such as your system environment. For this reason,
# you won't find the :http configuration below, but set inside
# VuetabaWeb.Endpoint.init/2 when load_from_system_env is
# true. Any dynamic configuration should be done there.
#
# Don't forget to configure the url host to something meaningful,
# Phoenix uses this information when generating URLs.
config :vuetaba, VuetabaWeb.Endpoint,
  http: [port: {:system, "HTTP_PORT"}, compress: true],
  # This is critical for ensuring web-sockets properly authorize.
  url: [host: "localhost", port: {:system, "HTTP_PORT"}],
  secret_key_base: {:system, "PHOENIX_ENDPOINT_SECRET"},
  server: true,
  root: ".",
  version: Application.spec(:vuetaba, :vsn),
  code_reloader: false

# Do not print debug messages in production
config :logger, level: :info

# Configure your database
config :vuetaba, Vuetaba.Repo, adapter: Ecto.Adapters.Postgres

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :vuetaba, VuetabaWeb.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [:inet6,
#               port: 443,
#               keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#               certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables return an absolute path to
# the key and cert in disk or a relative path inside priv,
# for example "priv/ssl/server.key".
#
# We also recommend setting `force_ssl`, ensuring no data is
# ever sent via http, always redirecting to https:
#
#     config :vuetaba, VuetabaWeb.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
#     config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :vuetaba, VuetabaWeb.Endpoint, server: true
#
