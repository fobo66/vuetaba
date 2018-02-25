defmodule CommentsRepo.Migrations.Initial do
  use Ecto.Migration

  @moduledoc """
  Initial migration for creating database
  """

  def change do
    create table(:comments) do
      add(:parent, references(:threads))
      add(:lasthit, :integer)
      add(:ip, :string, null: false)
      add(:name, :string, default: "Anonymous", size: 50)
      add(:comment, :text, size: 1000, null: false)
      add(:sage, :boolean, default: false)

      timestamps()
    end

    create table(:boards) do
      add(:name, :string, size: 100)
      add(:tag, :string, size: 10)
    end

    create table(:threads) do
      add(:title, :string, size: 100)
    end

    create table(:attachments) do
      add(:comment_id, references(:comments))
      add(:url, :string, null: false)
      add(:previewUrl, :string)
    end

    create(index(:boards, [:name, :tag], unique: true))
  end
end
