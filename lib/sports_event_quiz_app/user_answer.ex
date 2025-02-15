defmodule SportsEventQuizApp.UserAnswer do
  use Ecto.Schema

  alias SportsEventQuizApp.Repo
  alias SportsEventQuizApp.UserAnswer

  schema "user_answers" do
    field :user_id, :string
    field :answer, :string
    field :question_id, :id

    timestamps(type: :utc_datetime)
  end

  def save_user_answer(user_id, question_id, answer) do
    Repo.insert!(%UserAnswer{user_id: user_id, question_id: question_id, answer: answer})
  end
end
