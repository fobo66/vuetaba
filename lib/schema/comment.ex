defmodule Vuetaba.Schema.Comment do
  @moduledoc """
  Comment database schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema :comments do
    field(:parent, references(:threads))
    field(:lasthit, :integer)
    field(:ip, :string, null: false)
    field(:name, :string, default: "Anonymous", size: 50)
    field(:comment, :text, size: 1000)
    field(:sage, :boolean, default: false)

    timestamps
  end

  @required_fields ~w(comment)
  @optional_fields ~w()

  def changeset(comment, params \\ :empty) do
    comment
    |> cast(params, @required_fields, @optional_fields)
  end
end
