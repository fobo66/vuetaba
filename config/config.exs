# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

db = URI.parse(System.get_env("DATABASE_URL"))
dbCredentials = String.split(db.userinfo, ":")

config :vuetaba, CommentsRepo,
  adapter: Ecto.Adapters.Postgres,
  database: String.replace_prefix(db.path, "/", ""),
  username: hd(dbCredentials),
  password: tl(dbCredentials),
  hostname: db.host

config :vuetaba, ecto_repos: [CommentsRepo]

config :grpc, start_server: true
