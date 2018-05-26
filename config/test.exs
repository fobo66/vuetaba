use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :vuetaba2, Vuetaba2Web.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :vuetaba2, Vuetaba2.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "vuetaba2_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
