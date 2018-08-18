defmodule VuetabaWeb.Resolvers.Boards do
    alias Vuetaba.Repo
    
    def load_all_boards(_parent, _args, _resolution) do 
        {:ok, Vuetaba.Board |> Repo.all}
    end
end