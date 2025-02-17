ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(SportsEventQuizApp.Repo, :manual)

# Ensure the file path is correct and handle potential errors
case Code.require_file("test/support/mocks.ex", __DIR__) do
  {:error, reason} ->
    IO.puts("Failed to require mocks.ex: #{reason}")
  _ ->
    :ok
end
