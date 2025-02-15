defmodule SportsEventQuizApp.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :info, :string
    field :name, :string
    field :start_time, :naive_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :start_time, :info])
    |> validate_required([:name, :start_time, :info])
  end
end
