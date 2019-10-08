defmodule VuetabaWeb.Resolvers.Threads do
  alias Vuetaba.Repo

  @moduledoc """
  GraphQL resolvers for Threads model
  """

  def create_thread(_parent, args, _resolution) do
    Repo.insert(%Vuetaba.Thread{name: args.name, message: args.message, board_id: args.board_id})
  end
end
