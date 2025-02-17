defmodule SportsEventQuizApp.QuestionBehavior do
  @callback list_questions(event_id :: integer()) :: list(SportsEventQuizApp.Question.t())
end