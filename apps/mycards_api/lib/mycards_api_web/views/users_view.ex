defmodule MycardsApiWeb.UsersView do
  use MycardsApiWeb, :view

  def render("profile.json", _params) do
    %{status: :ok, action: "profile"}
  end

  def render("cards.json", _params) do
    %{status: :ok, action: "users cards"}
  end
end
