defmodule VuetabaWeb.Schema.QueryTest do
  use Vuetaba.DataCase
  require AbsintheErrorPayload.TestHelper

  @moduledoc """
  Tests for queries
  """

  test "Load all attachments" do
    query = "{ attachments(first: 10) {
                edges {
                  node {
                    url
                  }
                }
              }
             }
            "

    {:ok, response} = Absinthe.run(query, VuetabaWeb.Schema, context: %{permissions: []})
    attachment_fields = %{edges: :list}
    expected = %{"edges" => []}
    %{data: %{"attachments" => result}} = response
    AbsintheErrorPayload.TestHelper.assert_equivalent_graphql(expected, result, attachment_fields)
  end

  test "Load all boards" do
    query = "{ boards
                {
                    name
                }
            }
            "

    {:ok, %{data: data}} = Absinthe.run(query, VuetabaWeb.Schema, context: %{permissions: []})
    board_fields = %{name: :string}
    expected = []
    %{"boards" => result} = data
    AbsintheErrorPayload.TestHelper.assert_equivalent_graphql(expected, result, board_fields)
  end

  test "Load board by tag" do
    create_query = "mutation {
      createBoard(
        name: \"test\",
        tag: \"t\"
      ) {
        tag
      }
    }
    "

    {:ok, _} =
      Absinthe.run(create_query, VuetabaWeb.Schema, context: %{permissions: ["create:board"]})

    query = "{ board(
                  tag: \"t\"
                )
                {
                    name
                }
            }
            "

    {:ok, %{data: data}} = Absinthe.run(query, VuetabaWeb.Schema, context: %{permissions: []})
    board_fields = %{name: :string}
    expected = %{name: "test"}
    %{"board" => result} = data
    AbsintheErrorPayload.TestHelper.assert_equivalent_graphql(expected, result, board_fields)
  end

  test "Threads connection for board" do
    VuetabaWeb.TestHelper.create_thread()

    query = "{ boards
                {
                  threads(first: 10) {
                    edges {
                      node {
                        name
                      }
                    }
                  }
                }
            }
            "

    {:ok, response} = Absinthe.run(query, VuetabaWeb.Schema, context: %{permissions: []})
    threads_fields = %{edges: :list}
    expected = [%{"threads" => %{"edges" => [%{"node" => %{"name" => "test"}}]}}]
    %{data: %{"boards" => result}} = response
    AbsintheErrorPayload.TestHelper.assert_equivalent_graphql(expected, result, threads_fields)
  end
end
