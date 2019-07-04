defmodule VuetabaWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Vuetaba.Repo

  @moduledoc """
    GraphQL types used in project
  """

  object :board do
    field(:id, non_null(:integer))
    field(:name, non_null(:string))
    field(:tag, non_null(:string))
    field(:threads, list_of(:thread), resolve: assoc(:threads))
  end

  object :thread do
    field(:name, :string)
    field(:message, :string)
    field(:comments, list_of(:comment), resolve: assoc(:comments))
  end

  object :comment do
    field(:name, :string)
    field(:comment, :string)
    field(:sage, :boolean)
    field(:attachments, list_of(:attachment), resolve: assoc(:attachments))
  end

  object :attachment do
    field(:url, :string)
  end
end
