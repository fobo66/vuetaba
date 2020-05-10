defmodule VuetabaWeb.Resolvers.Threads do
  alias Vuetaba.Repo
  require Ecto.Query

  @moduledoc """
  GraphQL resolvers for Threads model
  """

  def create_thread(_parent, args, _resolution) do
    Repo.insert(%Vuetaba.Thread{name: args.name, message: args.message, board_id: args.board_id})
  end

  def load_thread(id) do
    {:ok, Vuetaba.Thread |> Repo.get(id)}
  end

  def load_threads(pagination_args, %{source: board}) do
    Vuetaba.Thread
    |> Ecto.Query.where(board_id: ^board.id)
    |> Absinthe.Relay.Connection.from_query(&Repo.all/1, pagination_args)
  end

  def update_thread(_parent, args, resolution) do
    permissions = resolution.context[:permissions]

    Vuetaba.AdminToken.with_permission(permissions || [], "update:thread", fn ->
      %Vuetaba.Thread{
        id: args.id,
        name: args.name,
        message: args.message,
        board_id: args.board_id
      }
      |> Ecto.Changeset.change()
      |> Repo.update()
    end)
  end

  def delete_thread(_parent, args, resolution) do
    permissions = resolution.context[:permissions]

    Vuetaba.AdminToken.with_permission(permissions || [], "delete:thread", fn ->
      %Vuetaba.Thread{id: args.id}
      |> Ecto.Changeset.change()
      |> Repo.delete()

      {:ok, args.id}
    end)
  end
end
