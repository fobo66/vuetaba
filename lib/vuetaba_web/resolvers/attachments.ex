defmodule VuetabaWeb.Resolvers.Attachments do
    alias Vuetaba.Repo
    
    def load_all_attachments(_parent, _args, _resolution) do 
        {:ok, Vuetaba.Attachment |> Repo.all}
    end
end