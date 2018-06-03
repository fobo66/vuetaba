defmodule Vuetaba.Repo.Migrations.CreateThreads do
  use Ecto.Migration

  def change do
    create table(:threads) do
      add :name, :string
      add :message, :string
      add :board_id, references(:boards, on_delete: :nothing)

      timestamps()
    end

    create index(:threads, [:board_id])
  end
end
