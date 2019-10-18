use Mix.Config

config :mycards_backend,
  ecto_repos: [MycardsBackend.Repo]

import_config "#{Mix.env()}.exs"
