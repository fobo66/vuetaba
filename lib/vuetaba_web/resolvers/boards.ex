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

  def delete_board(_parent, args, resolution) do
    permissions = resolution.context[:permissions]

    Vuetaba.AdminToken.with_permission(permissions || [], "delete:board", fn ->
      %Vuetaba.Board{id: args.id}
      |> Ecto.Changeset.change()
      |> Repo.delete()

      {:ok, args.id}
    end)
  end
end
