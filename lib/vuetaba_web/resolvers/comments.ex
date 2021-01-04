defmodule VuetabaWeb.Resolvers.Comments do
  alias Vuetaba.Repo
  require Ecto.Query

  @moduledoc """
  GraphQL resolvers for Comment model
  """

  def load_comments(pagination_args, %{source: thread}) do
    Vuetaba.Comment
    |> Ecto.Query.where(thread_id: ^thread.id)
    |> Absinthe.Relay.Connection.from_query(&Repo.all/1, pagination_args)
  end
end
