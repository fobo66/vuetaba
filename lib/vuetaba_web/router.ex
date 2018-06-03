defmodule VuetabaWeb.Router do
  use VuetabaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug Absinthe.Plug, schema: VuetabaWeb.Schema
  end

  pipeline :graphiql do
    plug Absinthe.Plug.GraphiQL, schema: VuetabaWeb.Schema
  end

  scope "/", VuetabaWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", VuetabaWeb do
    pipe_through :api
  end

  scope "/graphiql", VuetabaWeb do
    pipe_through :graphiql
  end
end