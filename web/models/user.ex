defmodule Revyoomee.User do
  use Revyoomee.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    belongs_to :reviewer, Revyoomee.User
    has_many :reviewees, Revyoomee.User, foreign_key: :reviewer_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :reviewer_id])
    |> validate_required([:name, :email])
  end

  def has_upcoming_review?(user) do
    false
  end
end
