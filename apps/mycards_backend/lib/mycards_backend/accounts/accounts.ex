defmodule MycardsBackend.Accounts do
  @moduledoc """
  """

  alias MycardsBackend.Repo
  alias MycardsBackend.Accounts.User

  def find_by_id(id), do: Repo.get!(User, id)
  def find_by_email(email), do: Repo.get_by(User, email: email)

  def update_user(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end
end
