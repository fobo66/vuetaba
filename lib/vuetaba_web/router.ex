defmodule VuetabaWeb.Router do
  use VuetabaWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", VuetabaWeb do
    pipe_through(:api)

    forward("/", Absinthe.Plug, schema: VuetabaWeb.Schema)

    forward("/graphiql", Absinthe.Plug.GraphiQL,
      schema: VuetabaWeb.Schema,
      socket: VuetabaWeb.UserSocket
    )
  end
end
