ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(SportsEventQuizApp.Repo, :manual)

# Start Mox application if not already started
unless Application.started_applications() |> Enum.any?(fn {app, _} -> app == :mox end) do
  Application.ensure_all_started(:mox)
end

# Require mocks file and handle potential errors
mocks_file = Path.join([__DIR__, "support", "mocks.ex"])

case Code.require_file(mocks_file) do
  {:error, reason} ->
    IO.warn("Failed to require mocks.ex: #{reason}")
  _ ->
    :ok
end