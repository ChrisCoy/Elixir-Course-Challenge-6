defmodule Exmeal.User do
  use Ecto.Schema

  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:cpf, :id, :email, :name]}
  @foreign_key_type :binary_id

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:cpf, :email, :name]

  schema "users" do
    field(:name, :string)
    field(:email, :string)
    field(:cpf, :string)

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
