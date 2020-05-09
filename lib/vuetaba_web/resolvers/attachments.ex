defmodule VuetabaWeb.Resolvers.Attachments do
  alias Vuetaba.Repo

  @moduledoc """
  GraphQL resolvers for Attachments model
  """

  def load_all_attachments(_parent, _args, _resolution) do
    {:ok, Vuetaba.Attachment |> Repo.all()}
  end

  def load_attachment(id) do
    {:ok, Vuetaba.Attachment |> Repo.get(id)}
  end
end
