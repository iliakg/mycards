defmodule MycardsApiWeb.AuthController do
  use MycardsApiWeb, :controller

  alias MycardsBackend.Accounts.Auth
  alias MycardsApi.Auth, as: JwtAuth

  def login(conn, %{"email" => email, "password" => password}) do
    case Auth.login(email, password) do
      {:ok, user} ->
        conn
        |> put_status(:ok)
        |> render("login.json", %{user: user, token: JwtAuth.issue(user.id)})
      {:error, _msg} ->
        conn
        |> put_status(:bad_request)
        |> render(MycardsApiWeb.ErrorsView, "400.json")
    end
  end

  def registration(conn, %{"email" => email, "username" => username, "password" => password}) do
    case Auth.registration(email, username, password) do
      {:ok, user} ->
        conn
        |> put_status(:ok)
        |> render("login.json", %{user: user, token: JwtAuth.issue(user.id)})
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(MycardsApiWeb.ErrorsView, "unprocessable_entity.json", errors: changeset.errors)
    end
  end
end

