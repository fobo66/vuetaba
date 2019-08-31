defmodule Vuetaba.AdminToken do
  use Joken.Config, default_signer: nil

  add_hook(JokenJwks, jwks_url: Application.get_env(:vuetaba, Vuetaba)[:jwks_url])

  @moduledoc """
    Rules for validating admin token came from Auth0
  """

  def token_config do
    default_claims(skip: [:aud, :iss, :exp])
    |> add_claim(
      "iss",
      nil,
      &(&1 == Application.get_env(:vuetaba, Vuetaba.AdminToken)[:jwt_issuer])
    )
    |> add_claim(
      "aud",
      nil,
      &(&1 == Application.get_env(:vuetaba, Vuetaba.AdminToken)[:jwt_auditory])
    )
    |> add_claim("exp", nil, &(&1 > Joken.current_time()))
  end

  @doc """
    Check if permission was given to admin, i.e. is present in "scope" field of the JWT
  """
  def has_permission(collection, permission) do
    Enum.find(collection, fn element ->
      permission === element
    end) != nil
  end

  def with_permission(permissions, permission, action) do
    if has_permission(permissions || [], permission) do
      action.()
    else
      {:error, "You are not authorized to perform this operation"}
    end
  end
end
