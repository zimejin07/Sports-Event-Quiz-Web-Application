defmodule SportsEventQuizAppWeb.EventListLive do
  use SportsEventQuizAppWeb, :live_view

  alias SportsEventQuizApp.Event

  def mount(_params, _session, socket) do
    events = Event.list_events()
    IO.inspect(events, label: "events list")
    {:ok, assign(socket, events: events)}
  end

  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-gray-950 text-white p-8">
      <div class="container mx-auto">

        <% # Page Title %>
        <h1 class="text-4xl font-extrabold text-center bg-clip-text text-transparent bg-gradient-to-r from-green-400 to-blue-500 drop-shadow-lg mb-12">
          ⚽ Upcoming Sports Events 🚀
        </h1>

        <% # Events Grid %>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-10">
          <%= for event <- @events do %>
            <div class="relative bg-gray-800 bg-opacity-90 backdrop-blur-lg rounded-xl shadow-lg overflow-hidden transform hover:scale-105 transition-all duration-300 hover:shadow-2xl border border-gray-700">

              <% # Image Section with Overlay %>
              <div class="relative">
                    <img src={event.image_url} alt={event.name <> " image"} class="w-full h-48 object-cover opacity-85"/>

                <div class="absolute top-2 left-2 bg-gradient-to-r from-black to-transparent text-green-300 text-xs px-3 py-1 rounded">
                  🏆 Premier League
                </div>
              </div>

              <% # Event Details with Glassmorphism Effect %>
              <div class="p-6 relative">
                <h2 class="text-2xl font-bold text-white mb-1 tracking-wide"><%= event.name %></h2>
                <p class="text-sm text-gray-400 mb-3"><%= event.info || "🔥 Get ready for an exciting showdown!" %></p>
                <p class="text-sm font-semibold text-gray-300">
                  <span class="text-green-400">📅 Starts at:</span> <%= event.start_time || "TBD" %>
                </p>

                <% # Animated Start Quiz Button %>
                <button phx-click="start_quiz" phx-value-id={event.id}
                        class="mt-6 w-full px-6 py-3 text-lg font-semibold rounded-lg text-gray-900 bg-gradient-to-r from-green-400 to-blue-500 hover:from-green-500 hover:to-blue-600 transition-all duration-300 shadow-md hover:shadow-lg transform hover:-translate-y-1">
                  🚀 Start Quiz
                </button>
              </div>

              <% # Floating Bottom Tag %>
              <div class="absolute bottom-2 right-2 bg-black bg-opacity-40 px-3 py-1 text-xs rounded-lg text-gray-300">
                🕹 Live Quiz Available
              </div>

            </div>
          <% end %>
        </div>

      </div>
    </div>
    """
  end

  def handle_event("start_quiz", %{"id" => event_id}, socket) do
    {:noreply, push_navigate(socket, to: "/quiz/#{event_id}")}
  end
end
