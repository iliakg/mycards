defmodule MycardsApiWeb.ErrorsView do
  use MycardsApiWeb, :view

  def render("400.json", _assigns) do
    %{errors: [%{code: 400, status: "bad_request", msg: "Bad Request"}]}
  end

  def render("401.json", _assigns) do
    %{errors: [%{code: 401, status: "unauthorized", msg: "Unauthorized"}]}
  end

  def render("404.json", _assigns) do
    %{errors: [%{code: 404, status: "not_found", msg: "Not Found"}]}
  end

  def render("500.json", _assigns) do
    %{errors: [%{code: 500, status: "internal_server_error", msg: "Internal Server Error"}]}
  end

  def render("unprocessable_entity.json", %{errors: errors}) do
    %{
      errors:
        Enum.map(errors, fn {key, {msg, opts}} ->
          %{
            code: 422,
            status: "unprocessable_entity",
            item: key,
            msg: "#{key} #{translate_error({msg, opts})}"
          }
        end)
    }
  end
end
