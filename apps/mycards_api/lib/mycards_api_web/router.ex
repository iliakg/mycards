defmodule MycardsApiWeb.Router do
  use MycardsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MycardsApiWeb do
    pipe_through :api
  end
end
