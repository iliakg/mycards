defmodule MycardsApiWeb.ErrorsView do
  use MycardsApiWeb, :view

  def render("bad_request.json", _assigns) do
    %{errors: %{msg: "Bad Reques"}}
  end
end
