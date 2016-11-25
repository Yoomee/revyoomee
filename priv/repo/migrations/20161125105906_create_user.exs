defmodule Revyoomee.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :reviewer_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:users, [:reviewer_id])

  end
end
