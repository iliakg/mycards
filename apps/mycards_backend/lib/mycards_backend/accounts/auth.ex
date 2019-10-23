defmodule MycardsBackend.Accounts.Auth do
  @moduledoc """
  """

  import Ecto.{Changeset}, warn: false

  alias MycardsBackend.Repo
  alias MycardsBackend.Accounts.User

  # MycardsBackend.Accounts.Auth.register("1", "2", "3")
  def register(email, username, password) do
    # require IEx; IEx.pry
    %User{}
    |> User.changeset(%{email: email, username: username})
    |> hash_password(password)
    |> Repo.insert()
  end

  defp hash_password(changeset, password) do
    case changeset do
      %Ecto.Changeset{valid?: true} ->
        salt = Bcrypt.gen_salt(12, true)
        put_change(changeset, :password_salt, salt)
        |> put_change(:encrypted_password, Bcrypt.Base.hash_password(password, salt))

      _ ->
        changeset
    end
  end
end
