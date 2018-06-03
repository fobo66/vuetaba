defmodule Vuetaba.Thread do
  use Ecto.Schema
  import Ecto.Changeset


  schema "threads" do
    field :name, :string
    field :message, :string
    belongs_to :board, Vuetaba.Board

    timestamps()
  end

  @doc false
  def changeset(thread, attrs) do
    thread
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
