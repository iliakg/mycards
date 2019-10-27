defmodule MycardsBackend.Accounts.RegistrationTest do
  use ExUnit.Case
  use MycardsBackend.RepoCase
  doctest MycardsBackend
  @moduletag :auth

  alias MycardsBackend.Accounts.Auth

  test "valid user registration" do
    {:ok, user} = Auth.registration("test@gmail.com", "username", "password")

    assert user.email == "test@gmail.com"
    assert user.username == "username"
  end

  test "exist user registration" do
    Auth.registration("test@gmail.com", "username", "password")
    {:error, changeset} = Auth.registration("test@gmail.com", "username", "password")

    # IO.inspect IEx.Info.info(changeset.errors)
    {msg, _} = changeset.errors[:email]
    assert msg == "has already been taken"
  end

  test "invalid registration values" do
    {:error, changeset} = Auth.registration(1, 2, 3)

    IO.inspect changeset
    {email_msg, _} = changeset.errors[:email]
    {username_msg, _} = changeset.errors[:username]
    {password_msg, _} = changeset.errors[:password]
    assert email_msg == "is invalid"
    assert username_msg == "is invalid"
    assert password_msg == "is invalid"
  end

  test "invalid password length" do
    {:error, changeset} = Auth.registration("test@gmail.com", "username", "pass")

    {msg, _} = changeset.errors[:password]
    assert msg == "should be at least %{count} character(s)"
  end
end
