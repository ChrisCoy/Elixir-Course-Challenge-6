defmodule Exmeal.Users.Get do
  alias Ecto.UUID
  alias Exmeal.{Repo, User, Error}

  def by_id(id) do
    with {:ok, uuid} <- UUID.cast(id),
         %User{} = user <- Repo.get(User, uuid) do
      {:ok, user}
    else
      :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      nil -> {:error, %Error{result: "User not found", status: :not_found}}
    end
  end
end
