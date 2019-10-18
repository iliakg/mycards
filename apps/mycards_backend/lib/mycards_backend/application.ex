defmodule MycardsBackend.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(MycardsBackend.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: MycardsBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
