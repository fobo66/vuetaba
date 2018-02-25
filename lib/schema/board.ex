defmodule Vuetaba.Schema.Board do
  @moduledoc """
  Board database schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema :boards do
    field(:name, :string, size: 100)
    field(:tag, :string, size: 10)
  end

  @required_fields ~w(name tag)
  @optional_fields ~w()

  def changeset(board, params \\ :empty) do
    board
    |> cast(params, @required_fields, @optional_fields)
  end
end
