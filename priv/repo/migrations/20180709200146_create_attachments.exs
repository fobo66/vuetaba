defmodule Vuetaba.Repo.Migrations.CreateAttachments do
  use Ecto.Migration

  def change do
    create table(:attachments) do
      add :url, :string, size: 512
      add :comment_id, references(:comments, on_delete: :nothing)

      timestamps()
    end

    create index(:attachments, [:comment_id])
  end
end
