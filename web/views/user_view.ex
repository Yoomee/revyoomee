defmodule Revyoomee.UserView do
  use Revyoomee.Web, :view

  def users_select(users) do
    [{"Select reviewer", ""} | Enum.map(users, &({&1.name, &1.id}))]
  end

  def has_upcoming_review?(user) do
    if Revyoomee.User.has_upcoming_review?(user) do
      "😀"
    else
      "🙁"
    end
  end
end
