defmodule Exmeal.Users.Update do
  alias Ecto.UUID
  alias Exmeal.{Repo, User, Error}

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, %Error{result: "User not found", status: :not_found}}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, %Error{result: "User not found", status: :not_found}}
      user -> do_update(user, params)
    end
  end

  defp do_update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
