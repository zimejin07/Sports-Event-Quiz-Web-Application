defmodule SportsEventQuizAppWeb.QuizLive do
  use SportsEventQuizAppWeb, :live_view

  alias SportsEventQuizApp.{Event, UserAnswer}
  import Ecto.UUID, only: [generate: 0]

  def render(assigns) do
    ~H"""
    <div>
      <%= if @current_question < length(@questions) do %>
        <div>
          <h3><%= Enum.at(@questions, @current_question).text %></h3>
          <.form for={%{}} phx-submit="submit_answer">
            <%= for {option, _} <- Enum.to_list(Enum.at(@questions, @current_question).options) do %>
              <div>
                <input type="radio" name="answer" value={option} />
                <.label><%= option %></.label>
              </div>
            <% end %>
            <button type="submit">Next</button>
          </.form>
        </div>
      <% else %>
        <div>
          <h2>Quiz Completed!</h2>
          <p>Thank you for participating.</p>
        </div>
      <% end %>
    </div>
    """
  end

  def mount(%{"event_id" => event_id}, _session, socket) do
    questions = Event.list_questions(event_id)
    user_id = generate()

    {:ok,
      assign(socket,
        questions: questions,
        event_id: event_id,
        current_question: 0,
        user_id: user_id
      )}
  end

  def handle_params(params, _uri, socket) do
    current_question =
      case Map.get(params, "question") do
        nil -> 0  # Default to first question if no "question" param is present
        question_index -> String.to_integer(question_index)
      end

    {:noreply, assign(socket, current_question: current_question)}
  end

  def handle_event("submit_answer", %{"answer" => answer}, socket) do
    question = Enum.at(socket.assigns.questions, socket.assigns.current_question)

    UserAnswer.save_user_answer(socket.assigns.user_id, question.id, answer)

    if socket.assigns.current_question + 1 < length(socket.assigns.questions) do
      {:noreply, push_patch(socket, to: "/quiz/#{socket.assigns.event_id}?question=#{socket.assigns.current_question + 1}")}
    else
      {:noreply, push_navigate(socket, to: "/summary?user_id=#{socket.assigns.user_id}")}
    end
  end
end