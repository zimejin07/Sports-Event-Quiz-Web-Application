defmodule SportsEventQuizAppWeb.QuizLiveTest do
  use SportsEventQuizAppWeb.ConnCase, async: true

  import Mox
  import Phoenix.LiveViewTest

  alias SportsEventQuizApp.QuestionMock

  setup do
    # Ensure mocks are reset for each test
    Mox.verify_on_exit!()

    :ok
  end

  test "renders first question", %{conn: conn} do
    question = %{id: 1, text: "Who won the last Super Bowl?", options: %{"A" => "Chiefs", "B" => "Eagles"}}
    QuestionMock.list_questions = fn _ -> [question] end

    {:ok, view, _html} = live(conn, "/quiz/1")

    assert has_element?(view, "h3", "Who won the last Super Bowl?")
  end

  test "submitting answer moves to next question", %{conn: conn} do
    question = %{id: 1, text: "Who won?", options: %{"A" => "Chiefs", "B" => "Eagles"}}
    QuestionMock.list_questions = fn _ -> [question, %{id: 2, text: "Final score?"}] end
    QuestionMock.save_user_answer = fn _, _, _ -> :ok end  # Mock DB save

    {:ok, view, _html} = live(conn, "/quiz/1")

    view
    |> form("form[phx-submit=submit_answer]", answer: "A")
    |> render_submit()

    assert_patch(view, "/quiz/1?question=1")
  end
end
