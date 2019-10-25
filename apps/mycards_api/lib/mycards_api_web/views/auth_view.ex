defmodule MycardsApiWeb.AuthView do
  use MycardsApiWeb, :view

  def render("login.json", %{user: user, token: token}) do
    %{
      email: user.email,
      username: user.username,
      token: token
    }
  end
end
