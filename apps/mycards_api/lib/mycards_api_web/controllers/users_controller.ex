defmodule MycardsApiWeb.UsersController do
  use MycardsApiWeb, :controller

  def sets(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("sets.json", %{})
  end
end
