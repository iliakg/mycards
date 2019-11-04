defmodule MycardsApiWeb.UsersView do
  use MycardsApiWeb, :view

  def render("sets.json", _params) do
    %{status: :ok, action: "users sets"}
  end
end
