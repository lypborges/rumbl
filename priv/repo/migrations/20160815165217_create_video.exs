defmodule Rumbl.Repo.Migrations.CreateVideo do
  use Ecto.Migration

  def change do
    create table(:videos,primary_key: false) do
      add :id, :uuid, primary_key: true
      add :url, :string
      add :title, :string
      add :description, :text
      add :user_id, references(:users, on_delete: :nothing, type: :uuid,null: false)

      timestamps()
    end

    create index(:videos, [:user_id])

  end
end
