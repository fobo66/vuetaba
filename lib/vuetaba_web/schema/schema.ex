defmodule VuetabaWeb.Schema do
  use Absinthe.Schema
  import_types(VuetabaWeb.Schema.Types)

  alias VuetabaWeb.Resolvers

  query do
    @desc "Load all attachments"
    field :attachments, list_of(:attachment) do
      resolve &Resolvers.Attachments.load_all_attachments/3
    end

    @desc "Load all boards"
    field :boards, list_of(:board) do
      resolve &Resolvers.Boards.load_all_boards/3
    end

  end
  
end
