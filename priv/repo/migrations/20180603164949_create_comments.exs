defmodule Vuetaba.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :name, :string
      add :comment, :text, size: 1000
      add :sage, :boolean, default: false, null: false
      add :thread_id, references(:threads, on_delete: :nothing)

      timestamps()
    end

    create index(:comments, [:thread_id])
  end
end
