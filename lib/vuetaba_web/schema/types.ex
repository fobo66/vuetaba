defmodule VuetabaWeb.Schema.Types do
  use Absinthe.Schema.Notation

  object :board do
    field :name, non_null(:string)
    field :tag, non_null(:string)
    field :threads, list_of(:thread)
  end

  object :thread do
    field :name, :string
    field :message, :string
    field :comments, list_of(:comment)
  end

  object :comment do
    field :name, :string
    field :comment, :string
    field :sage, :boolean
    field :attachments, list_of(:attachment)
  end

  object :attachment do
    field :url, :string
  end
end
