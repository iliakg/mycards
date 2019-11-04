defmodule MycardsApiWeb.Controllers.CardsSets.CreateTest do
  use MycardsApiWeb.ConnCase
  doctest MycardsApiWeb
  # @moduletag :cards_sets

  alias MycardsBackend.Accounts.Auth
  alias MycardsApi.Auth, as: UserAuth

  setup do
    {:ok, user} = Auth.registration("test@gmail.com", "username", "password")
    {:ok, %{token: UserAuth.issue(user.id)}}
  end

  test "error when usere not logged" do
    conn = post(build_conn(), "/api/cards_sets")

    assert json_response(conn, 401)["errors"] == [
             %{"code" => 401, "msg" => "Unauthorized", "status" => "unauthorized"}
           ]
  end

  @tag :cards_sets
  test "create cards sets", %{token: token} do
    conn
    |> put_req_header("authorization", "Bearer #{token}")
    |> post("/api/cards_sets", [name: "sets name"])
    |> IO.inspect
  end
end
