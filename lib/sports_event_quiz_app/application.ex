defmodule SportsEventQuizApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SportsEventQuizAppWeb.Telemetry,
      SportsEventQuizApp.Repo,
      {DNSCluster, query: Application.get_env(:sports_event_quiz_app, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SportsEventQuizApp.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: SportsEventQuizApp.Finch},
      # Start a worker by calling: SportsEventQuizApp.Worker.start_link(arg)
      # {SportsEventQuizApp.Worker, arg},
      # Start to serve requests, typically the last entry
      SportsEventQuizAppWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SportsEventQuizApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SportsEventQuizAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
