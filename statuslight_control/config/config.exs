use Mix.Config

config :statuslight_control,
  renderer: IORenderer

config :blinkchain,
  canvas: {12,1}

import_config "#{Mix.env}.exs"
