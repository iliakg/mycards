use Mix.Config

config :mycards_backend, MycardsBackend.Repo,
  database: "mycards_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 5
