defmodule SportsEventQuizAppWeb.SummaryLiveTest do
  use SportsEventQuizAppWeb.ConnCase, async: true
  import Phoenix.LiveViewTest
  alias SportsEventQuizApp.{UserAnswerMock, EventMock, QuestionMock}

  test "renders summary", %{conn: conn} do
    question = %{id: 1, text: "Who won?", event_id: 1}
    event = %{id: 1, name: "Super Bowl"}
    answer = %{question_id: 1, answer: "Chiefs"}

    UserAnswerMock.list_user_answers = fn _ -> [answer] end
    QuestionMock.get_question = fn _ -> question end
    EventMock.get_event = fn _ -> event end

    {:ok, view, _html} = live(conn, "/summary?user_id=123")

    assert has_element?(view, "h3", "Who won?")
    assert has_element?(view, "p", "Chiefs")
  end
end
