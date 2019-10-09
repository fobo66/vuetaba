defmodule Vuetaba.Thread do
  use Ecto.Schema
  import Ecto.Changeset

  @moduledoc """
    Thread entity. In imageboards, thread represents a single topic to discuss.
    Initially, thread was represented by a top-level comment on the board.
  """

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

  def data() do
    Dataloader.Ecto.new(Vuetaba.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end
end
