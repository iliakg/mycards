defmodule MycardsApiWeb.ProfileController do
  use MycardsApiWeb, :controller

  alias MycardsBackend.Cards

  plug MycardsApiWeb.Plugs.AuthenticateUser

  def profile(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("profile.json", %{current_user: conn.assigns.current_user})
  end

  def sets(conn, _params) do
    # Cards.find_sets_by_user_id(conn.assigns.current_user.id)
    # |> IO.inspect

    conn
    |> put_status(:ok)
    |> render("sets.json", %{current_user: conn.assigns.current_user})
  end
end
