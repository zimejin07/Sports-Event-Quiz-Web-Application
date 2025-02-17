defmodule SportsEventQuizAppWeb.SummaryLiveTest do
  use SportsEventQuizAppWeb.ConnCase, async: true

  import Mox
  import Phoenix.LiveViewTest

  alias SportsEventQuizApp.UserAnswerMock
  alias SportsEventQuizApp.EventMock
  alias SportsEventQuizApp.QuestionMock

  setup do
    Mox.verify_on_exit!()

    :ok
  end

  test "renders summary", %{conn: conn} do
    question = %{id: 1, text: "Who won?", event_id: 1}
    event = %{id: 1, name: "Super Bowl"}
    answer = %{question_id: 1, answer: "Chiefs"}

    expect(UserAnswerMock, :list_user_answers, fn _ -> [answer] end)
    expect(QuestionMock, :list_questions, fn _ -> [question] end)
    expect(EventMock, :list_events, fn _ -> [event] end)

    {:ok, view, _html} = live(conn, "/summary?user_id=123")

    assert has_element?(view, "h3", "Who won?")
    assert has_element?(view, "p", "Chiefs")
  end
end
