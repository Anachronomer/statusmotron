defmodule StatuslightControl.MixProject do
  use Mix.Project

  def project do
    [
      app: :statuslight_control,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {StatuslightControl.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:blinkchain, "~> 1.0", runtime: Mix.env == :prod}
    ]
  end
end
