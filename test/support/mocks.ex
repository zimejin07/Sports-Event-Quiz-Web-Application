 # Define the behaviors for the modules we want to mock
  Mox.defmock(SportsEventQuizApp.EventMock, for: SportsEventQuizApp.EventBehavior)
  Mox.defmock(SportsEventQuizApp.UserAnswerMock, for: SportsEventQuizApp.UserAnswerBehavior)
  Mox.defmock(SportsEventQuizApp.QuestionMock, for: SportsEventQuizApp.QuestionBehavior)


