use Mix.Config

config :mycards_backend, MycardsBackend.Repo,
  database: "mycards_test",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool: Ecto.Adapters.SQL.Sandbox
