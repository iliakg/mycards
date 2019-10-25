defmodule MycardsApiWeb.ErrorsView do
  use MycardsApiWeb, :view

  def render("bad_request.json", _assigns) do
    %{errors: [%{code: 400, status: "bad_request", msg: "Bad Request"}]}
  end
end
