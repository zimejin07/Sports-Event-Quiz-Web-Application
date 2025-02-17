defmodule SportsEventQuizAppWeb.QuizLive do
  use SportsEventQuizAppWeb, :live_view

  alias SportsEventQuizApp.{Event, UserAnswer}
  import Ecto.UUID, only: [generate: 0]

  def render(assigns) do
    ~H"""
    <div class="relative min-h-screen flex flex-col items-center justify-center bg-gray-900 text-white p-6"
         style="background: url('https://www.joe.co.uk/uploads/2024/03/24_023_Manchester.png') center/cover no-repeat;">

      <% # Overlay to darken background for better readability %>
      <div class="absolute inset-0 bg-black bg-opacity-50"></div>

      <div class="relative w-full max-w-2xl bg-gray-800 p-6 rounded-lg shadow-xl animate-fade-in z-10 border border-gray-700">

        <% # Progress Indicator %>
        <div class="mb-4 text-center">
          <p class="text-sm text-gray-400">Question <%= @current_question + 1 %> of <%= length(@questions) %></p>
          <div class="w-full bg-gray-700 rounded-full h-2 mt-2">
            <div class="h-2 bg-green-500 rounded-full transition-all ease-in-out duration-500"
                 style={"width: #{(@current_question + 1) * 100 / length(@questions)}%"}></div>
          </div>
        </div>

        <%= if @current_question < length(@questions) do %>
          <div class="text-center">
            <h3 class="text-2xl font-bold mb-6 text-green-300 animate-pulse">
              <%= Enum.at(@questions, @current_question).text %>
            </h3>

            <.form for={%{}} phx-submit="submit_answer">
              <div class="grid grid-cols-2 gap-4 animate-slide-in">
                <%= for {option, _} <- Enum.to_list(Enum.at(@questions, @current_question).options) do %>
                  <label class="block cursor-pointer">
                    <input type="radio" name="answer" value={option} class="hidden peer" />
                    <div class="flex items-center justify-center p-4 border border-gray-600 rounded-lg bg-gray-700
                                peer-checked:bg-green-500 peer-checked:text-white transition-all
                                hover:scale-105 hover:border-green-300 hover:shadow-lg hover:shadow-green-400/30">
                      <%= option %>
                    </div>
                  </label>
                <% end %>
              </div>

              <div class="flex justify-between mt-6">
                <% # Disable "Previous" on the first question %>
                <button type="button" phx-click="prev_question"
                        class={"px-6 py-2 rounded-lg " <> if @current_question == 0, do: "bg-gray-700 text-gray-500 cursor-not-allowed", else: "bg-gray-700 hover:bg-gray-600 text-white"}>
                  Previous
                </button>
                <button type="submit" class="px-6 py-2 bg-green-500 hover:bg-green-600 text-white rounded-lg animate-pulse transition-all duration-300">
                  Next
                </button>
              </div>
            </.form>
          </div>
        <% else %>
          <div class="text-center animate-fade-in">
            <h2 class="text-3xl font-bold mb-4 text-green-400">Quiz Completed! 🎉</h2>
            <p class="text-lg text-gray-300">Thank you for participating. Keep an eye on upcoming events! ⚽🏆</p>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  #  def render(assigns) do
#    ~H"""
#    <div class="min-h-screen flex flex-col items-center justify-center bg-gray-900 text-white p-6">
#      <div class="w-full max-w-2xl bg-gray-800 p-6 rounded-lg shadow-xl animate-fade-in">
#
#        <% # Progress Indicator %>
#        <div class="mb-4 text-center">
#          <p class="text-sm text-gray-400">Question <%= @current_question + 1 %> of <%= length(@questions) %></p>
#          <div class="w-full bg-gray-700 rounded-full h-2 mt-2">
#            <div class="h-2 bg-green-500 rounded-full transition-all"
#                 style={"width: #{(@current_question + 1) * 100 / length(@questions)}%"}></div>
#          </div>
#        </div>
#
#        <%= if @current_question < length(@questions) do %>
#          <div class="text-center">
#            <h3 class="text-2xl font-bold mb-4">
#              <%= Enum.at(@questions, @current_question).text %>
#            </h3>
#
#            <.form for={%{}} phx-submit="submit_answer">
#              <div class="grid grid-cols-2 gap-4 animate-slide-in">
#                <%= for {option, _} <- Enum.to_list(Enum.at(@questions, @current_question).options) do %>
#                  <label class="block cursor-pointer">
#                    <input type="radio" name="answer" value={option} class="hidden peer" />
#                    <div class="flex items-center justify-center p-4 border border-gray-600 rounded-lg bg-gray-700
#                                peer-checked:bg-green-500 peer-checked:text-white transition-all hover:scale-105">
#                      <%= option %>
#                    </div>
#                  </label>
#                <% end %>
#              </div>
#
#              <div class="flex justify-between mt-6">
#                <% # Disable "Previous" on the first question %>
#                <button type="button" phx-click="prev_question"
#                        class={"px-6 py-2 rounded-lg " <> if @current_question == 0, do: "bg-gray-700 text-gray-500 cursor-not-allowed", else: "bg-gray-700 hover:bg-gray-600 text-white"}>
#                  Previous
#                </button>
#                <button type="submit" class="px-6 py-2 bg-green-500 hover:bg-green-600 text-white rounded-lg animate-pulse">
#                  Next
#                </button>
#              </div>
#            </.form>
#          </div>
#        <% else %>
#          <div class="text-center animate-fade-in">
#            <h2 class="text-3xl font-bold mb-4">Quiz Completed! 🎉</h2>
#            <p class="text-lg">Thank you for participating.</p>
#          </div>
#        <% end %>
#      </div>
#    </div>
#    """
#  end

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