defmodule MycardsApiWeb.CardsSetsController do
  use MycardsApiWeb, :controller

  plug MycardsApiWeb.Plugs.AuthenticateUser

  def create(conn, params) do
    IO.inspect params

    conn
    |> put_status(:ok)
    |> render("create.json", %{status: "ok"})
  end
end

