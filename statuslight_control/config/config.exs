use Mix.Config

config :statuslight_control,
  renderer: IORenderer

import_config "#{Mix.env}.exs"
