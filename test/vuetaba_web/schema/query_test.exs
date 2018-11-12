defmodule VuetabaWeb.Schema.QueryTest do
  use Vuetaba.DataCase
  import Kronky.TestHelper

  Kronky.TestHelper.evaluate_schema(VuetabaWeb.Schema)

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

    {:ok, %{data: data}} = evaluate_graphql(query)
    attachment_fields = %{url: :string}
    expected = []
    %{"attachments" => result} = data
    Kronky.TestHelper.assert_equivalent_graphql(expected, result, attachment_fields)
  end

  test "Load all boards" do
    query = "{ boards
                {
                    name
                }
            }
            "

    {:ok, %{data: data}} = evaluate_graphql(query)
    board_fields = %{name: :string}
    expected = []
    %{"boards" => result} = data
    Kronky.TestHelper.assert_equivalent_graphql(expected, result, board_fields)
  end
end
