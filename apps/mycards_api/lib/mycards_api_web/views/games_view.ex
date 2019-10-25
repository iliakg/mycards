defmodule MycardsApiWeb.GamesView do
  use MycardsApiWeb, :view

  def render("create.json", %{status: status}) do
    %{
      test: status
    }
  end
end
