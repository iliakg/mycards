defmodule MycardsApiWeb.AuthController do
  use MycardsApiWeb, :controller

  alias MycardsBackend.Accounts.Auth

  def login(conn, %{"email" => email, "password" => password}) do
    case Auth.login(email, password) do
      {:ok, user} ->
        conn
        |> put_status(:ok)
        |> render("login.json", %{user: user, token: "token"})
      {:error, _msg} ->
        conn
        |> put_status(:bad_request)
        |> render(MycardsApiWeb.ErrorsView, "bad_request.json")
    end
  end

  def registration(conn, params) do
  end
end

