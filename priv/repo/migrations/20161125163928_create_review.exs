defmodule Revyoomee.Repo.Migrations.CreateReview do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :date_due, :datetime
      add :google_admin_review_link, :string
      add :google_personal_reflection_link, :string
      add :status, :string, default: "unconfirmed"
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:reviews, [:user_id])

  end
end
