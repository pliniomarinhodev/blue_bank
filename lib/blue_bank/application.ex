defmodule BlueBank.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BlueBankWeb.Telemetry,
      BlueBank.Repo,
      {DNSCluster, query: Application.get_env(:blue_bank, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BlueBank.PubSub},
      # Start a worker by calling: BlueBank.Worker.start_link(arg)
      # {BlueBank.Worker, arg},
      # Start to serve requests, typically the last entry
      BlueBankWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BlueBank.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BlueBankWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
