defmodule Vuetaba.AdminTokenTest do
  use Vuetaba.DataCase

  test "User has certain permission" do
    permissions = ["test1", "test2"]
    assert Vuetaba.AdminToken.has_permission(permissions, "test1")
  end

  test "User does not have certain permission" do
    permissions = ["test1", "test2"]
    assert !Vuetaba.AdminToken.has_permission(permissions, "test3")
  end

  test "User has no permissions" do
    permissions = []
    assert !Vuetaba.AdminToken.has_permission(permissions, "test1")
  end
end
