defmodule Vuetaba.Core.Server do
    use GRPC.Server, service: Vuetaba.BoardService.Service
    
    @doc """
    Post comment
    """
    @spec post_comment(Vuetaba.Comment.t(), GRPC.Server.Stream.t())
        :: Vuetaba.Comment.t()
    def post_comment(request, stream) do
        
    end
end