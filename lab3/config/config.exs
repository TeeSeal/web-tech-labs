# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :lab,
  ecto_repos: [Lab.Repo]

# Configures the endpoint
config :lab, LabWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0pPwbEcNjdzpMdOwodYBfyZu0TdOdPJR3CKNxHSK8eq+E0sk0OFJGVsc5nzVpxOb",
  render_errors: [view: LabWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Lab.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :lab, Lab.Auth.Guardian,
  issuer: "lab",
  secret_key: "BDLe9MGmYFkwgfIw3QnKz8uRgSfybq8lTaEj1KHcbAS65HqMHFFyblEdBMlFBUyc"
