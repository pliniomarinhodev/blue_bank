# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :blue_bank,
  ecto_repos: [BlueBank.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :blue_bank, BlueBankWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: BlueBankWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: BlueBank.PubSub,
  live_view: [signing_salt: "+FP4L5Xj"]

# Configures Elixir's Logger
config :logger, :default_formatter,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :argon2_elixir,
  t_cost: 4,
  m_cost: 16

config :tesla, disable_deprecated_builder_warning: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
