defmodule VuetabaWeb.Schema do
  use Absinthe.Schema
  import_types(VuetabaWeb.Schema.Types)

  @moduledoc """
    GraphQL schema used in project
  """

  alias VuetabaWeb.Resolvers

  query do
    @desc "Load all attachments"
    field :attachments, list_of(:attachment) do
      resolve(&Resolvers.Attachments.load_all_attachments/3)
    end

    @desc "Load all boards"
    field :boards, list_of(:board) do
      resolve(&Resolvers.Boards.load_all_boards/3)
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
  end
end
