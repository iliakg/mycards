defmodule MycardsApiWeb.GamesController do
  use MycardsApiWeb, :controller

  def create(conn, %{"cards_set_id" => cards_set_id}) do
    IO.inspect cards_set_id

    conn
    |> put_status(:ok)
    |> render("create.json", %{status: "ok"})
  end
end
