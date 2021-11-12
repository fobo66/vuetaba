defmodule VuetabaWeb.Context do
  @behaviour Plug

  import Plug.Conn

  @moduledoc """
    Context for Absinthe authenticated requests
  """

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
    with ["Bearer " <> token] <- get_req_header(conn, "Authorization"),
         {:ok, permissions} <- verify(token) do
      {:ok, %{permissions: permissions}}
    end
  end

  defp verify(token) do
    case Vuetaba.AdminToken.verify_and_validate(token) do
      {:ok, claims} -> read_permissions(claims)
      {:error, reason} -> {:error, reason}
    end
  end

  defp read_permissions(claims) do
    Map.get(claims, "scope") || ""
    |> String.slice(" ")
  end
end
