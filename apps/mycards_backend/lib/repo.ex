defmodule MycardsBackend.Repo do
  use Ecto.Repo,
    otp_app: :mycards_backend,
    adapter: Ecto.Adapters.Postgres
end
