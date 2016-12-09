defmodule Revyoomee.UserController do
  use Revyoomee.Web, :controller

  alias Revyoomee.User

  def index(conn, _params) do
    users = Repo.all(User) |> Repo.preload([:reviewer, :reviewees])
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    users = Repo.all(User)
    render(conn, "new.html", users: users, changeset: changeset, users: users)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = User |> Repo.get!(id) |> Repo.preload([:reviewer, :reviewees])
    render(conn, "show.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = User |> Repo.get!(id) |> Repo.preload([:reviewer])
    users = Repo.all(User)
    changeset = User.changeset(user)
    render(conn, "edit.html", user: user, changeset: changeset, users: users)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = User |> Repo.get!(id) |> Repo.preload([:reviewer])
    changeset = User.changeset(user, user_params)

    case Repo.update(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, changeset} ->
        users = Repo.all(User)
        render(conn, "edit.html", user: user, changeset: changeset, users: users)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: user_path(conn, :index))
  end
end
