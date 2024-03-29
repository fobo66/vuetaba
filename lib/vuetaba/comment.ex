defmodule Vuetaba.Comment do
  @moduledoc """
  Comment database schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field(:comment, :string)
    field(:name, :string)
    field(:sage, :boolean, default: false)
    belongs_to(:thread, Vuetaba.Thread)
    has_many(:attachment, Vuetaba.Attachment)

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:name, :comment, :sage])
    |> validate_required([:name, :comment, :sage])
  end
end
