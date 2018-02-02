defmodule Vuetaba.CommentsService.Service do
  use GRPC.Service, name: "vuetaba.CommentsService"

  rpc(:Post, Vuetaba.Comment, Vuetaba.Comment)
  rpc(:GetThread, Vuetaba.ThreadRequest, stream(Vuetaba.Comment))
  rpc(:UpdateThread, Vuetaba.ThreadRequest, stream(Vuetaba.Comment))
  rpc(:ReportSpam, Vuetaba.SpamRequest, Vuetaba.SpamResponse)
end

defmodule Vuetaba.CommentsService.Stub do
  use GRPC.Stub, service: Vuetaba.CommentsService.Service
end

defmodule Vuetaba.BoardService.Service do
  use GRPC.Service, name: "vuetaba.BoardService"

  rpc(:LoadBoard, Vuetaba.BoardRequest, Vuetaba.Board)
  rpc(:LoadRecentCommentsPage, Vuetaba.PageRequest, stream(Vuetaba.Comment))
  rpc(:LoadBoardsList, Google.Protobuf.Empty, stream(Vuetaba.Board))
end

defmodule Vuetaba.BoardService.Stub do
  use GRPC.Stub, service: Vuetaba.BoardService.Service
end
