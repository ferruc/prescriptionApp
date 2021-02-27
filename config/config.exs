# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :prescriptionApp,
  ecto_repos: [PrescriptionApp.Repo]

# Configures the endpoint
config :prescriptionApp, PrescriptionAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qB/Kpedz7jr8ZB6oGNWRKqUb2E//1bPnF93PH26ZrkC/XMHgZUu/oZrNui7et6i6",
  render_errors: [view: PrescriptionAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PrescriptionApp.PubSub,
  live_view: [signing_salt: "djkBPTwC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
