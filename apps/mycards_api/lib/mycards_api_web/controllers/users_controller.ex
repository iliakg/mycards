defmodule MycardsApiWeb.UsersController do
  use MycardsApiWeb, :controller

  plug MycardsApiWeb.Plugs.AuthenticateUser when action in [:profile]

  def profile(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("profile.json", %{current_user: conn.assigns.current_user})
  end

  def cards(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("cards.json", %{})
  end
end
