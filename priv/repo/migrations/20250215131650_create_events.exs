defmodule SportsEventQuizApp.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :start_time, :naive_datetime
      add :info, :string

      timestamps(type: :utc_datetime)
    end
  end
end
