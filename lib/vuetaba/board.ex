defmodule Vuetaba.Board do
  use Ecto.Schema
  import Ecto.Changeset


  schema "boards" do
    field :name, :string
    field :tag, :string
    has_many :threads, Vuetaba.Thread

    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:name, :tag])
    |> validate_required([:name, :tag])
  end
end
