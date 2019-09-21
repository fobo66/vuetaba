defmodule VuetabaWeb.Schema.Types do
  use Absinthe.Schema.Notation

    import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  @moduledoc """
    GraphQL types used in project
  """

  object :board do
    field(:id, non_null(:integer))
    field(:name, non_null(:string))
    field(:tag, non_null(:string))
    field(:threads, list_of(:thread), resolve: dataloader(Vuetaba.Board))
  end

  object :thread do
    field(:name, :string)
    field(:message, :string)
    field(:comments, list_of(:comment), resolve: dataloader(Vuetaba.Thread))
  end

  object :comment do
    field(:name, :string)
    field(:comment, :string)
    field(:sage, :boolean)
    field(:attachments, list_of(:attachment), resolve: dataloader(Vuetaba.Comment))
  end

  object :attachment do
    field(:url, :string)
  end
end
