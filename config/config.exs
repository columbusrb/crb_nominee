# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :crb_nominee,
  ecto_repos: [CrbNominee.Repo]

# Configures the endpoint
config :crb_nominee, CrbNominee.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pDH4NY+8jtY+dKtsAFFadUoIMHooDY2lepUDGCpABXgzKNciNEijt9b2TaWH1N3A",
  render_errors: [view: CrbNominee.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CrbNominee.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :arc,
  storage: Arc.Storage.S3,
  bucket: "crb-candidates"

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

config :ex_admin,
  repo: CrbNominee.Repo,
  module: CrbNominee,
  theme_selector: [
    {"AdminLte",  ExAdmin.Theme.AdminLte2},
    {"ActiveAdmin", ExAdmin.Theme.ActiveAdmin}
  ],
  modules: [
    CrbNominee.ExAdmin.Dashboard,
    CrbNominee.ExAdmin.Candidate
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}
