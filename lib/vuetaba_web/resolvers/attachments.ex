defmodule VuetabaWeb.Resolvers.Attachments do
  alias Vuetaba.Repo

  @moduledoc """
  GraphQL resolvers for Attachments model
  """

  def load_all_attachments(pagination_args, _context) do
    Vuetaba.Attachment
    |> Ecto.Queryable.to_query()
    |> Absinthe.Relay.Connection.from_query(&Repo.all/1, pagination_args)
  end

  def load_attachment(id) do
    {:ok, Vuetaba.Attachment |> Repo.get(id)}
  end
end
