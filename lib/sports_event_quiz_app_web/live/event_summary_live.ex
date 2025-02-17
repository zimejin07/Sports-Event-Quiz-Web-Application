defmodule SportsEventQuizAppWeb.SummaryLive do
  use SportsEventQuizAppWeb, :live_view

  alias SportsEventQuizApp.{UserAnswer, Event, Question, Repo}

  def render(assigns) do
    ~H"""
    <div class="min-h-screen flex flex-col items-center justify-center bg-gray-900 text-white p-6">
      <div class="w-full max-w-3xl bg-gray-800 p-8 rounded-lg shadow-xl animate-fade-in">

        <% # Quiz Summary Title %>
        <div class="text-center mb-6">
          <h2 class="text-3xl font-bold text-green-400 drop-shadow-md">Quiz Summary</h2>
          <p class="text-gray-400 mt-2">Here's how you did! 🎉</p>
        </div>

        <% # Dynamic Score Section %>
        <div class="bg-gray-700 p-4 rounded-lg flex justify-between items-center shadow-lg">
          <p class="text-lg">Total Score:</p>
          <span class="text-2xl font-bold text-green-400">5/5</span>
        </div>

        <% # Summary of Answers %>
        <div class="mt-6 space-y-4">
          <%= for {question, event, answer} <- @answers do %>
            <div class="p-4 rounded-lg shadow-lg transition-all animate-slide-in bg-green-600">
              <h3 class="text-lg font-semibold"><%= question.text %></h3>
              <p class="text-sm"><strong>Your Answer:</strong> <%= answer %></p>
              <p class="text-sm"><strong>Event:</strong> <%= event.name %></p>
            </div>
          <% end %>
        </div>

        <% # Back to Home Button %>
        <div class="mt-6 text-center">
          <a href="/" class="px-6 py-3 bg-blue-500 hover:bg-blue-600 text-white font-semibold rounded-lg transition-all shadow-lg">
            Back to Home
          </a>
        </div>
      </div>
    </div>
    """
  end

  def mount(%{"user_id" => user_id}, _session, socket) do
    user_answers = UserAnswer.list_user_answers(user_id)

    answers =
      user_answers
      |> Enum.map(fn ua ->
        question = Repo.get(Question, ua.question_id)
        event = Repo.get(Event, question.event_id)
        {question, event, ua.answer}
      end)
    {:ok, assign(socket, answers: answers)}
  end
end
