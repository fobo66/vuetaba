ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(Vuetaba.Repo, :manual)

Absinthe.Test.prime(VuetabaWeb.Schema)

defmodule VuetabaWeb.TestHelper do
  def create_thread() do
    create_query = "mutation {
        createBoard(
          name: \"test\",
          tag: \"t\"
        ) {
          id
        }
      }
      "

    {:ok, %{data: create_result}} =
      Absinthe.run(create_query, VuetabaWeb.Schema, context: %{permissions: ["create:board"]})

    %{"createBoard" => id} = create_result

    query = "mutation {
        createThread(
          name: \"test\",
          message: \"test\"
          boardId: #{Integer.to_string(id["id"])}
        ) {
            id,
            name
        }
      }
      "

    {:ok, %{data: data}} = Absinthe.run(query, VuetabaWeb.Schema, context: %{permissions: []})

    data
  end
end
