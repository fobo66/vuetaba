defmodule VuetabaWeb.Router do
  use VuetabaWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(VuetabaWeb.Context)
  end

  scope "/" do
    pipe_through(:api)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL,
        schema: VuetabaWeb.Schema,
        socket: VuetabaWeb.UserSocket
      )
    end

    forward("/", Absinthe.Plug, schema: VuetabaWeb.Schema)
  end
end
