defmodule Vuetaba2Web.PageController do
  use Vuetaba2Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
