Ecto.Adapters.SQL.Sandbox.mode(SportsEventQuizApp.Repo, :manual)

# Start Mox application if not already started
Application.ensure_all_started(:mox)

# Require mocks file and handle potential errors
mocks_file = Path.join([__DIR__, "support", "mocks.ex"])

case Code.require_file(mocks_file) do
  {:error, reason} ->
    IO.warn("Failed to require mocks.ex: #{reason}")
  _ ->
    :ok
end

ExUnit.start()