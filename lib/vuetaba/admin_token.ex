defmodule Vuetaba.AdminToken do
  use Joken.Config

  @moduledoc """
    Rules for validating admin token
  """

  # 1 hour
  def token_config, do: default_claims(default_exp: 60 * 60)
end
