defmodule MycardsApiWeb.Router do
  use MycardsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MycardsApiWeb do
    pipe_through :api

    post("/login", AuthController, :login)
    post("/registration", AuthController, :registration)

    get("/profile", ProfileController, :profile)
    get("/profile/sets", ProfileController, :sets)

    get("/users/:id/sets", UsersController, :sets)

    post("/cards_sets", CardsSetsController, :create)

    post("/games/:cards_set_id", GamesController, :create)
    post("/cards/accept", GamesController, :accept)
  end
end
