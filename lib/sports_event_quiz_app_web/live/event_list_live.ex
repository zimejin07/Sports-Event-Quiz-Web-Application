defmodule SportsEventQuizAppWeb.EventListLive do
  use SportsEventQuizAppWeb, :live_view

  alias SportsEventQuizApp.Event

  def mount(_params, _session, socket) do
    events = Event.list_events()
    {:ok, assign(socket, events: events)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1 class="text-2xl font-bold">Upcoming Sports Events</h1>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 mt-4">
        <%= for event <- @events do %>
          <div class="border p-4 rounded shadow-lg">
            <h2 class="text-xl font-semibold"><%= event.name %></h2>
            <p><%= event.info %></p>
            <p>Starts at: <%= event.start_time %></p>
            <button phx-click="start_quiz" phx-value-id={event.id} class="bg-blue-500 text-white px-4 py-2 mt-2 rounded">
            Start Quiz
            </button>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  def handle_event("start_quiz", %{"id" => event_id}, socket) do
    {:noreply, push_navigate(socket, to: "/quiz/#{event_id}")}
  end
end
