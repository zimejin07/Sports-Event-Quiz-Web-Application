defmodule SportsEventQuizApp.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :options, :map
    field :text, :string
    field :event_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:text, :options])
    |> validate_required([:text])
  end
end
