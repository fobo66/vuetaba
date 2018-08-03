defmodule VuetabaWeb.Schema do
  use Absinthe.Schema
  import_types(VuetabaWeb.Schema.Types)

  alias VuetabaWeb.Resolvers

  query do
    @desc "Get all attachments"
    field :attachments, list_of(:attachment) do
      resolve &Resolvers.Attachments.load_all_attachments/3
    end
  end
end
