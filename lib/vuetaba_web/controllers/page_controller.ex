defmodule VuetabaWeb.PageController do
  use VuetabaWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
