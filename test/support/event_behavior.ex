defmodule SportsEventQuizApp.EventBehavior do
  @callback list_events() :: list(SportsEventQuizApp.Event.t())
  @callback list_questions(event_id :: integer()) :: list(SportsEventQuizApp.Question.t())
end