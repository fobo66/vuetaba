defmodule Vuetaba.Thread do
  use Ecto.Schema
  import Ecto.Changeset

  schema "threads" do
    field(:name, :string, size: 512)
    field(:message, :string, size: 1000)
    belongs_to(:board, Vuetaba.Board)
    has_many(:comments, Vuetaba.Comment)

    timestamps()
  end

  @doc false
  def changeset(thread, attrs) do
    thread
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
