defmodule SportsEventQuizApp.Repo.Migrations.CreateUserAnswers do
  use Ecto.Migration

  def change do
    create table(:user_answers) do
      add :user_id, :string
      add :answer, :string
      add :question_id, references(:questions, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:user_answers, [:question_id])
  end
end
