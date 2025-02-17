defmodule SportsEventQuizApp.Mocks do
  use Mox

  # Define the behaviors for the modules we want to mock
  Mox.defmock(SportsEventQuizApp.EventMock, for: SportsEventQuizApp.EventBehavior)
  Mox.defmock(SportsEventQuizApp.UserAnswerMock, for: SportsEventQuizApp.UserAnswerBehavior)
  Mox.defmock(SportsEventQuizApp.QuestionMock, for: SportsEventQuizApp.QuestionBehavior)

  # Allow async testing with Mox (global shared mocks)
  Application.put_env(:mox, :global, true)
end

