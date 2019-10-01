defmodule VuetabaWeb.Schema.QueryTest do
  use Vuetaba.DataCase
  require AbsintheErrorPayload.TestHelper

  @moduledoc """
  Tests for queries
  """

  test "Load all attachments" do
    query = "{ attachments
                {
                    url
                }
            }
            "

    {:ok, %{data: data}} = Absinthe.run(query, VuetabaWeb.Schema, context: %{permissions: []})
    attachment_fields = %{url: :string}
    expected = []
    %{"attachments" => result} = data
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
end
