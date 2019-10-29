defmodule MycardsApiWeb.Plugs.AuthenticateUser do
  import Plug.Conn
  import Phoenix.Controller

  alias MycardsApi.Auth
  alias MycardsBackend.Accounts.User
  alias MycardsBackend.Accounts

  def init(_params) do
  end

  def call(conn, _params) do
    with ["Bearer " <> auth_token] <- get_req_header(conn, "authorization"),
         {:ok, %{"user_id" => user_id}} <- Auth.decode(auth_token),
         %User{} = current_user <- Accounts.find_by_id(user_id) do

      conn
      |> assign(:current_user, current_user)
      |> assign(:user_signed_in?, true)
    else
      _ ->
        conn
        |> put_status(:unauthorized)
        |> put_view(MycardsApiWeb.ErrorsView)
        |> render("401.json")
        |> halt()
    end
  end
end
