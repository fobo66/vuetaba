defmodule VuetabaWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  @moduledoc """
    GraphQL types used in project
  """

  node interface do
    resolve_type(fn
      %Vuetaba.Board{}, _ ->
        :board

      %Vuetaba.Thread{}, _ ->
        :thread

      %Vuetaba.Comment{}, _ ->
        :comment

      %Vuetaba.Attachment{}, _ ->
        :attachment

      _, _ ->
        nil
    end)
  end

  object(:board) do
    field(:id, non_null(:integer))
    field(:name, non_null(:string))
    field(:tag, non_null(:string))

    connection field(:threads, node_type: :thread) do
      resolve(&VuetabaWeb.Resolvers.Threads.load_threads/2)
    end
  end

  object :thread do
    field(:id, non_null(:integer))
    field(:name, :string)
    field(:message, :string)

    connection field(:comments, node_type: :comment) do
      resolve(&VuetabaWeb.Resolvers.Comments.load_comments/2)
    end
  end

  object(:comment) do
    field(:name, :string)
    field(:comment, :string)
    field(:sage, :boolean)
    
    connection field(:attachments, node_type: :attachment) do
      resolve(&VuetabaWeb.Resolvers.Attachments.load_attachments/2)
    end
  end

  node object(:attachment) do
    field(:url, :string)
  end

  connection(node_type: :attachment)

  connection(node_type: :board)

  connection(node_type: :thread)

  connection(node_type: :comment)
end
