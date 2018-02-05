defmodule Vuetaba do
  @moduledoc """
  Documentation for Vuetaba.
  """

  @doc """
  Starts an application
  """
  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(GRPC.Server.Supervisor, [{Vuetaba.Core.Server, 50051}]),
      supervisor(CommentsRepo, [])
    ]

    opts = [strategy: :one_for_one, name: Vuetaba]
    Supervisor.start_link(children, opts)
  end
end
