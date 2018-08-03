defmodule VuetabaWeb.Router do
  use VuetabaWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:api)

    forward("/graphiql", Absinthe.Plug.GraphiQL,
      schema: VuetabaWeb.Schema,
      socket: VuetabaWeb.UserSocket
    )

    forward("/", Absinthe.Plug, schema: VuetabaWeb.Schema)
  end
end
