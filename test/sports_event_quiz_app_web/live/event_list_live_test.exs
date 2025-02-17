defmodule SportsEventQuizAppWeb.EventListLiveTest do
  use SportsEventQuizAppWeb.ConnCase, async: true

  import Mox
  import Phoenix.LiveViewTest

  alias SportsEventQuizApp.EventMock

  setup do
    Mox.verify_on_exit!()

    :ok
  end

  test "renders event list", %{conn: conn} do
    event = %{id: 1, name: "Super Bowl", info: "Biggest game!", start_time: ~N[2025-02-10 18:00:00]}

    # Set expectation for the mock function
    expect(EventMock, :list_events, fn -> [event] end)

    {:ok, view, _html} = live(conn, "/events")

    assert has_element?(view, "h1", "Upcoming Sports Events 🚀")
    assert has_element?(view, "h2", "Super Bowl")
  end

  test "clicking Start Quiz redirects", %{conn: conn} do
    event = %{id: 1, name: "Super Bowl"}
    expect(EventMock, :list_events, fn -> [event] end)

    {:ok, view, _html} = live(conn, "/events")

    view
    |> element("button[phx-click=start_quiz][phx-value-id=1]")
    |> render_click()

    assert_patch(view, "/quiz/1")
  end
end
