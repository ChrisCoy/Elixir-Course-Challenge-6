defmodule Exmeal.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table(:meals) do
      add(:calories, :integer)
      add(:date, :date)
      add(:description, :string)
      add(:user_id, references(:users))

      timestamps()
    end
  end
end
