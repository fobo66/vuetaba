defmodule VuetabaWeb.GraphQlControllerTest do
  use VuetabaWeb.ConnCase

  test "Root is working", %{conn: conn} do
    conn = get conn, "/"
    assert response(conn, 400) =~ "No query document supplied"
  end
end
