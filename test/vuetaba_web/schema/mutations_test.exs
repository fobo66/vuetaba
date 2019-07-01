defmodule VuetabaWeb.Schema.MutationsTest do
  use Vuetaba.DataCase
  require Kronky.TestHelper

  Kronky.TestHelper.evaluate_schema(VuetabaWeb.Schema)

  @moduledoc """
  Tests for mutations
  """

  def board_fields do
    %{
      name: :string,
      tag: :string
    }
  end

  test "Insert board correct mutation" do
    query = "mutation {
      createBoard(
        name: \"test\",
        tag: \"t\"
      ) {
        name
      }
    }
    "
    assert {:ok, %{data: data}} = evaluate_graphql(query)
    expected = %{name: "test"}
    %{"createBoard" => result} = data
    Kronky.TestHelper.assert_equivalent_graphql(expected, result, board_fields())
  end

  test "Update board correct mutation" do
    query = "mutation {
      updateBoard(
        id: 1,
        name: \"test2\",
        tag: \"t\"
      ) {
        name
      }
    }
    "
    assert {:ok, %{data: data}} = evaluate_graphql(query)
    expected = %{name: "test2"}
    %{"updateBoard" => result} = data
    Kronky.TestHelper.assert_equivalent_graphql(expected, result, board_fields())
  end

  test "Delete board correct mutation" do
    create_query = "mutation {
      createBoard(
        name: \"test\",
        tag: \"t\"
      ) {
        id
      }
    }
    "

      {:ok, %{data: create_result}} = evaluate_graphql(create_query)

      %{"createBoard" => id} = create_result

      query = "mutation {
        deleteBoard(
          id: #{Integer.to_string(id["id"])}
        )
      }
      "

      assert {:ok, %{data: data}} = evaluate_graphql(query)
      expected = id["id"]
      %{"deleteBoard" => result} = data
      assert expected === result
    end
end
