defmodule Vuetaba.Attachment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "attachments" do
    field(:url, :string, size: 512)

    belongs_to(:comment, Vuetaba.Comment)

    timestamps()
  end

  @doc false
  def changeset(attachment, attrs) do
    attachment
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end

  def data() do
    Dataloader.Ecto.new(Vuetaba.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end
end
