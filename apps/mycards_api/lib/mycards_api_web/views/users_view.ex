defmodule MycardsApiWeb.UsersView do
  use MycardsApiWeb, :view

  def render("profile.json", %{current_user: current_user}) do
    %{
      id: current_user.id,
      email: current_user.email,
      username: current_user.username
    }
  end

  def render("cards.json", _params) do
    %{status: :ok, action: "users cards"}
  end
end
