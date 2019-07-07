defmodule VuetabaWeb.Context do
  @behaviour Plug

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    case build_context(conn) do
      {:ok, context} ->
        put_private(conn, :absinthe, %{context: context})

      _ ->
        conn
    end
  end

  defp build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, claims} <- verify(token) do
      {:ok, %{claims: claims, token: token}}
    end
  end

  defp verify(token) do
    {:ok, claims} = Vuetaba.AdminToken.verify_and_validate(token)
  end
end
