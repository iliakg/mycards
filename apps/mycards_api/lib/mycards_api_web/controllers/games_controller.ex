defmodule MycardsApiWeb.GamesController do
  use MycardsApiWeb, :controller

  def create(conn, %{"cards_set_id" => cards_set_id}) do
    conn
    |> put_status(:ok)
    |> render("create.json", %{status: "ok"})
  end
end
