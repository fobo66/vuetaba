defmodule VuetabaWeb.Resolvers.Boards do
  alias Vuetaba.Repo

  @moduledoc """
  GraphQL resolvers for Boards model
  """

  def load_all_boards(_parent, _args, _resolution) do
    {:ok, Vuetaba.Board |> Repo.all()}
  end

  def create_board(_parent, args, _resolution) do
    Repo.insert(%Vuetaba.Board{name: args.name, tag: args.tag})
  end

  def update_board(_parent, args, _resolution) do
    %Vuetaba.Board{id: args.id, name: args.name, tag: args.tag}
    |> Ecto.Changeset.change()
    |> Repo.update()
  end
end
