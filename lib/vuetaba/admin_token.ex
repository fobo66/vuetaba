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
end
