defmodule SportsEventQuizApp.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :text, :string
      add :options, :map
      add :event_id, references(:events, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:questions, [:event_id])
  end
end
