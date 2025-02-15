defmodule SportsEventQuizApp.UserAnswer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_answers" do
    field :user_id, :string
    field :answer, :string
    field :question_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_answer, attrs) do
    user_answer
    |> cast(attrs, [:user_id, :answer])
    |> validate_required([:user_id, :answer])
  end
end
