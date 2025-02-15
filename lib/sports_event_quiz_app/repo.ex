defmodule SportsEventQuizApp.Repo do
  use Ecto.Repo,
    otp_app: :sports_event_quiz_app,
    adapter: Ecto.Adapters.Postgres
end
