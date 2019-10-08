defmodule VuetabaWeb.Schema.MutationsTest do
  use Vuetaba.DataCase
  require AbsintheErrorPayload.TestHelper

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

    assert {:ok, %{data: data}} =
             Absinthe.run(query, VuetabaWeb.Schema, context: %{permissions: ["create:board"]})

    expected = %{name: "test"}
    %{"createBoard" => result} = data
    AbsintheErrorPayload.TestHelper.assert_equivalent_graphql(expected, result, board_fields())
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

    assert {:ok, %{data: data}} =
             Absinthe.run(query, VuetabaWeb.Schema, context: %{permissions: ["update:board"]})

    expected = %{name: "test2"}
    %{"updateBoard" => result} = data
    AbsintheErrorPayload.TestHelper.assert_equivalent_graphql(expected, result, board_fields())
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

    {:ok, %{data: create_result}} =
      Absinthe.run(create_query, VuetabaWeb.Schema, context: %{permissions: ["create:board"]})

    %{"createBoard" => id} = create_result

    query = "mutation {
        deleteBoard(
          id: #{Integer.to_string(id["id"])}
        )
      }
      "

    assert {:ok, %{data: data}} =
             Absinthe.run(query, VuetabaWeb.Schema, context: %{permissions: ["delete:board"]})

    expected = id["id"]
    %{"deleteBoard" => result} = data
    assert expected === result
  end

  test "Delete board unauthorized -> error" do
    query = "mutation {
        deleteBoard(
          id: 1
        )
      }
      "

    assert {:ok, %{errors: errors}} = Absinthe.run(query, VuetabaWeb.Schema, context: %{permissions: []})

    assert !Enum.empty?(errors)
  end

  test "Delete board wrong permission -> error" do
    query = "mutation {
        deleteBoard(
          id: 1
        )
      }
      "

    assert {:ok, %{errors: errors}} =
             Absinthe.run(query, VuetabaWeb.Schema, context: %{permissions: ["create:board"]})

    assert !Enum.empty?(errors)
  end

  test "Insert thread correct mutation" do

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
        name
      }
    }
    "

    assert {:ok, %{data: data}} =
             Absinthe.run(query, VuetabaWeb.Schema, context: %{permissions: []})

    expected = %{name: "test"}
    %{"createThread" => result} = data
    AbsintheErrorPayload.TestHelper.assert_equivalent_graphql(expected, result, board_fields())
  end
end
