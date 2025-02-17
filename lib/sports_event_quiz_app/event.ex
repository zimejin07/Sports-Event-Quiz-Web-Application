defmodule SportsEventQuizApp.Event do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias SportsEventQuizApp.Repo
  alias SportsEventQuizApp.Event
  alias SportsEventQuizApp.Question

  schema "events" do
    field :info, :string
    field :name, :string
    field :start_time, :naive_datetime
    field :image_url, :string

    timestamps(type: :utc_datetime)
  end

  @callback list_events() :: list()
  @callback list_questions(integer()) :: list()

  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :start_time, :info, :image_url])
    |> validate_required([:name, :start_time, :info, :image_url])
  end


  # Fetch all events
  def list_events do
    Repo.all(Event)
  end

  # Fetch all questions for a specific event
  def list_questions(event_id) do
    query = from q in Question, where: q.event_id == ^event_id
    Repo.all(query)
  end
end
