defmodule Vuetaba.Repo do
  use GenServer

  use Ecto.Repo,
    otp_app: :vuetaba,
    adapter: Ecto.Adapters.Postgres

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end
end
