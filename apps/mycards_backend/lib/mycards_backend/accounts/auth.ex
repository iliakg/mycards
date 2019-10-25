defmodule MycardsBackend.Accounts.Auth do
  @moduledoc """
  """

  import Ecto.{Changeset}, warn: false

  alias MycardsBackend.Repo
  alias MycardsBackend.Accounts
  alias MycardsBackend.Accounts.User

  # MycardsBackend.Accounts.Auth.register("1", "2", "3")
  def register(email, username, password) do
    # require IEx; IEx.pry
    %User{}
    |> User.changeset(%{email: email, username: username})
    |> hash_password(password)
    |> Repo.insert()
  end

  @spec login(String.t(), String.t()) ::
          {:error, :failed} | {:ok, User.t()}
  def login(email, password) do
    with %User{} = user <- Accounts.find_by_email(email),
         true <- valid_password?(user, password) do
      {:ok, user}
    else
      _ ->
        {:error, :failed}
    end
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

  defp valid_password?(user, password) do
    user.encrypted_password === Bcrypt.Base.hash_password(password, user.password_salt)
  end
end
