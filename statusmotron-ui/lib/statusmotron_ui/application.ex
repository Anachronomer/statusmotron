defmodule StatusmotronUI.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Create an ETS table for reasons...
    :ets.new(:dumping_ground, [:named_table, :public])
    :ets.insert(:dumping_ground, { :color, "green" })

    # Define workers and child supervisors to be supervised
    children = [
      {Phoenix.PubSub, name: StatusmotronUI.PubSub},
      # Start the endpoint when the application starts
      supervisor(StatusmotronUIWeb.Endpoint, []),
      # Start your own worker by calling: StatusmotronUI.Worker.start_link(arg1, arg2, arg3)
      # worker(StatusmotronUI.Worker, [arg1, arg2, arg3]),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StatusmotronUI.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    StatusmotronUIWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
