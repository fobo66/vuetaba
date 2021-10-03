defmodule VuetabaWeb.Resolvers.Attachments do
  alias Vuetaba.Repo
  require Ecto.Query

  @moduledoc """
  GraphQL resolvers for Attachments model
  """

  def load_all_attachments(pagination_args, _context) do
    Vuetaba.Attachment
    |> Ecto.Queryable.to_query()
    |> Absinthe.Relay.Connection.from_query(&Repo.all/1, pagination_args)
  end

  def load_attachments(pagination_args, %{source: comment}) do
    Vuetaba.Attachment
    |> Ecto.Query.where(comment_id: ^comment.id)
    |> Absinthe.Relay.Connection.from_query(&Repo.all/1, pagination_args)
  end

  def load_attachment(id) do
    {:ok, Vuetaba.Attachment |> Repo.get(id)}
  end
end
