defmodule Exmeal.Meals.Get do
  alias Ecto.UUID
  alias Exmeal.{Repo, Meal}

  def by_id(id) do
    with {:ok, uuid} <- UUID.cast(id),
         %Meal{} = meal <- Repo.get(Meal, uuid) do
      {:ok, meal}
    else
      :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      nil -> {:error, %Exmeal.Error{result: "Meal not found", status: :not_found}}
    end
  end
end
