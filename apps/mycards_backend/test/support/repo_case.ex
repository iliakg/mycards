defmodule MycardsBackend.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias MycardsBackend.Repo

      import Ecto
      import Ecto.Query
      import MycardsBackend.RepoCase
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(MycardsBackend.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(MycardsBackend.Repo, {:shared, self()})
    end

    :ok
  end
end
