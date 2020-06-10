defmodule StatuslightControl.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: StatuslightControl.Worker.start_link(arg)
      {StatuslightControl.Statuslight, Application.get_env(:statuslight_control, :renderer)}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StatuslightControl.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
