defmodule Revyoomee.Review do
  use Revyoomee.Web, :model

  schema "reviews" do
    field :date_due, Ecto.DateTime
    field :google_admin_review_link, :string
    field :google_personal_reflection_link, :string
    field :status, :string
    belongs_to :user, Revyoomee.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:date_due, :google_admin_review_link, :google_personal_reflection_link, :status])
    |> validate_required([:date_due, :google_admin_review_link, :google_personal_reflection_link, :status])
  end
end
