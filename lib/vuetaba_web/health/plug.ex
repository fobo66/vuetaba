# Copyright (c) 2022 Andrey Mukamolov
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

defmodule VuetabaWeb.Health.Plug do
    import Plug.Conn
  
    @behaviour Plug
  
    @path_startup   "/health/startup"
    @path_liveness  "/health/liveness"
    @path_readiness "/health/readiness"
  
  
    # Plug Callbacks
  
    @impl true
    def init(opts), do: opts
  
    @impl true
    def call(%Plug.Conn{} = conn, _opts) do
      case conn.request_path do
        @path_startup   -> health_response(conn, Health.has_started?())
        @path_liveness  -> health_response(conn, Health.is_alive?())
        @path_readiness -> health_response(conn, Health.is_ready?())
        _other          -> conn
      end
    end
  
  
    # Respond according to health checks
  
    defp health_response(conn, true) do
      conn
      |> send_resp(200, "OK")
      |> halt()
    end
  
    defp health_response(conn, false) do
      conn
      |> send_resp(503, "SERVICE UNAVAILABLE")
      |> halt()
    end
  end
  