defmodule Revyoomee.ReviewTest do
  use Revyoomee.ModelCase

  alias Revyoomee.Review

  @valid_attrs %{date_due: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, google_admin_review_link: "some content", google_personal_reflection_link: "some content", status: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Review.changeset(%Review{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Review.changeset(%Review{}, @invalid_attrs)
    refute changeset.valid?
  end
end
