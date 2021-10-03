defmodule VuetabaWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  import_types(VuetabaWeb.Schema.Types)

  @moduledoc """
    GraphQL schema used in project
  """

  alias VuetabaWeb.Resolvers

  query do
    @desc "Support for Relay node loading"
    node field do
      resolve(fn
        %{type: :board, id: id}, _ ->
          Resolvers.Boards.load_board(id)

        %{type: :thread, id: id}, _ ->
          Resolvers.Threads.load_thread(id)

        %{type: :attachment, id: id}, _ ->
          Resolvers.Attachments.load_attachment(id)
      end)
    end

    @desc "Load all attachments"
    connection field(:attachments, node_type: :attachment) do
      resolve(&Resolvers.Attachments.load_all_attachments/2)
    end

    @desc "Load all boards"
    field :boards, list_of(:board) do
      resolve(&Resolvers.Boards.load_all_boards/3)
    end

    @desc "Load board by its tag"
    field :board, type: :board do
      arg(:tag, non_null(:string))
      resolve(&Resolvers.Boards.load_board/3)
    end
  end

  mutation do
    @desc "Add new board"
    field :create_board, type: :board do
      arg(:name, non_null(:string))
      arg(:tag, non_null(:string))

      resolve(&Resolvers.Boards.create_board/3)
    end

    @desc "Update board"
    field :update_board, type: :board do
      arg(:id, non_null(:integer))
      arg(:name, non_null(:string))
      arg(:tag, non_null(:string))

      resolve(&Resolvers.Boards.update_board/3)
    end

    @desc "Delete board"
    field :delete_board, type: :integer do
      arg(:id, non_null(:integer))

      resolve(&Resolvers.Boards.delete_board/3)
    end

    @desc "Create new thread"
    field :create_thread, type: :thread do
      arg(:name, non_null(:string))
      arg(:message, non_null(:string))
      arg(:board_id, non_null(:integer))

      resolve(&Resolvers.Threads.create_thread/3)
    end

    @desc "Update thread"
    field :update_thread, type: :thread do
      arg(:id, non_null(:integer))
      arg(:name, non_null(:string))
      arg(:message, non_null(:string))
      arg(:board_id, non_null(:integer))

      resolve(&Resolvers.Threads.update_thread/3)
    end

    @desc "Delete thread"
    field :delete_thread, type: :integer do
      arg(:id, non_null(:integer))

      resolve(&Resolvers.Threads.delete_thread/3)
    end
  end
end
