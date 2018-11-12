ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(Vuetaba.Repo, :manual)

Absinthe.Test.prime(VuetabaWeb.Schema)