defmodule VuetabaWeb.Resolvers.Boards do
  alias Vuetaba.Repo
  require Ecto.Query

  @moduledoc """
  GraphQL resolvers for Boards model
  """

  def load_all_boards(_parent, _args, _resolution) do
    {:ok, Vuetaba.Board |> Repo.all()}
  end

  def load_board(_parent, args, _resolution) do
    {:ok, Repo.one(Ecto.Query.from b in Vuetaba.Board, where: b.tag == ^args.tag)}
  end

  def create_board(_parent, args, resolution) do
    permissions = resolution.context[:permissions]

    Vuetaba.AdminToken.with_permission(permissions || [], "create:board", fn ->
      Repo.insert(%Vuetaba.Board{name: args.name, tag: args.tag})
    end)
  end

  def update_board(_parent, args, resolution) do
    permissions = resolution.context[:permissions]

    Vuetaba.AdminToken.with_permission(permissions || [], "update:board", fn ->
      %Vuetaba.Board{id: args.id, name: args.name, tag: args.tag}
      |> Ecto.Changeset.change()
      |> Repo.update()
    end)
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
