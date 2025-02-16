defmodule SportsEventQuizAppWeb.SummaryLive do
  use SportsEventQuizAppWeb, :live_view

  alias SportsEventQuizApp.{UserAnswer, Event, Question, Repo}

  def render(assigns) do
    ~H"""
    <div>
      <h2>Quiz Summary</h2>
      <%= for {question, event, answer} <- @answers do %>
        <div class="answer-summary">
          <h3><%= question.text %></h3>
          <p>Answer: <%= answer %></p>
          <p>Event: <%= event.name %></p>
        </div>
      <% end %>

      <a href="/">Back to Home</a>
    </div>
    """
  end

  def mount(%{"user_id" => user_id}, _session, socket) do
    # Log the user_id to the console
    IO.inspect(user_id, label: "User ID")

    # Fetch user answers
    user_answers = UserAnswer.list_user_answers(user_id)

    # Log the user answers
    IO.inspect(user_answers, label: "User Answers")

    # Fetch questions and the associated event for each answer
    answers =
      user_answers
      |> Enum.map(fn ua ->
        # Log the individual user answer
        IO.inspect(ua, label: "User Answer")

        # Find the question
        question = Repo.get(Question, ua.question_id)
        IO.inspect(question, label: "Question")

        # Fetch the event associated with the question
        event = Repo.get(Event, question.event_id)
        IO.inspect(event, label: "Event")

        # Return the tuple with question, event, and answer
        {question, event, ua.answer}
      end)

    # Assign answers to the socket
    {:ok, assign(socket, answers: answers)}
  end
end
