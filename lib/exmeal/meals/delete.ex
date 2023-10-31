defmodule Exmeal.Meals.Delete do
  alias Ecto.UUID
  alias Exmeal.{Repo, Meal}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, %Exmeal.Error{result: "Meal not found", status: :not_found}}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, %Exmeal.Error{result: "Meal not found", status: :not_found}}
      meal -> Repo.delete(meal)
    end
  end
end
