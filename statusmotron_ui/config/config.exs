# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :statusmotron_ui, StatusmotronUIWeb.Endpoint,
  url: [host: "statusmotron"],
  secret_key_base: "QU19cDvKHYNE/Ofj9Pvwiez9FYkzmp+GP/FVXeHuT0NbLxt8IMTL4oQxu0iEWbjG",
  render_errors: [view: StatusmotronUIWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: StatusmotronUI.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :statuslight_control, renderer: IORenderer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
