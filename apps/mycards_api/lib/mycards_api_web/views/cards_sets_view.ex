defmodule MycardsApiWeb.CardsSetsView do
  use MycardsApiWeb, :view

  def render("create.json", %{status: status}) do
    %{
      test: status
    }
  end
end
