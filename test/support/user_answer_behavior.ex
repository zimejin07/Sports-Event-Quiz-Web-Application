defmodule SportsEventQuizApp.UserAnswerBehavior do
  @callback list_user_answers(user_id :: String.t()) :: list(SportsEventQuizApp.UserAnswer.t())
  @callback save_user_answer(user_id :: String.t(), question_id :: integer(), answer :: String.t()) :: :ok
end