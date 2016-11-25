defmodule Revyoomee.User do
  use Revyoomee.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    belongs_to :reviewer, Revyoomee.Reviewer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email])
    |> validate_required([:name, :email])
  end
end
