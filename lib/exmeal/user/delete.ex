defmodule Exmeal.Users.Delete do
  alias Ecto.UUID
  alias Exmeal.{Repo, User, Error}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, %Error{result: "Invalid id format!", status: :not_found}}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(id) do
    case Repo.get(User, id) do
      nil -> {:error, %Error{result: "User not found", status: :not_found}}
      user -> Repo.delete(user)
    end
  end
end
