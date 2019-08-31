defmodule Vuetaba.AdminTokenTest do
  use Vuetaba.DataCase

  @moduledoc """
  Tests for verifying permissions
  """
  describe "Check if user has permission" do
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

  describe "Action with permission" do
    test "Perform action with given permission" do
      permissions = ["test1", "test2"]

      Vuetaba.AdminToken.with_permission(permissions, "test1", fn ->
        assert Vuetaba.AdminToken.has_permission(permissions, "test1")
      end)
    end

    test "Do not perform action without permission" do
      permissions = ["test1", "test2"]

      assert {:error, _} =
               Vuetaba.AdminToken.with_permission(permissions, "test3", fn ->
                 assert Vuetaba.AdminToken.has_permission(permissions, "test1")
               end)
    end
  end
end
