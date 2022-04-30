defmodule Vuetaba.Attachment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "attachments" do
    field(:url, :string)

    belongs_to(:comment, Vuetaba.Comment)

    timestamps()
  end

  @doc false
  def changeset(attachment, attrs) do
    attachment
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
