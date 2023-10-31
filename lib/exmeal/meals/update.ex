defmodule Exmeal.Meals.Update do
  alias Ecto.UUID
  alias Exmeal.{Repo, Meal}

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, %Exmeal.Error{result: "Meal not found", status: :not_found}}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, %Exmeal.Error{result: "Meal not found", status: :not_found}}
      meal -> do_update(meal, params)
    end
  end

  defp do_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
