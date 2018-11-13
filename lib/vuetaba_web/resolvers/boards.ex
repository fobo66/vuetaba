defmodule VuetabaWeb.Resolvers.Boards do
    alias Vuetaba.Repo

    @moduledoc """
    GraphQL resolvers for Boards model
    """	

    def load_all_boards(_parent, _args, _resolution) do 
        {:ok, Vuetaba.Board |> Repo.all}
    end

    def create_board(_parent, args, _resolution) do
        Repo.insert(%Vuetaba.Board{name: args.name, tag: args.tag})
    end
end