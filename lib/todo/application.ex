defmodule Todo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      TodoWeb.Telemetry,
      Todo.Repo,
      {DNSCluster, query: Application.get_env(:todo_app, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Todo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Todo.Finch},
      # Start a worker by calling: SampleApp.Worker.start_link(arg)
      # {SampleApp.Worker, arg},
      # Start to serve requests, typically the last entry
      TodoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Todo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TodoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
