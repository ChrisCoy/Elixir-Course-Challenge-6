defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:description, :date, :calories, :user_id]
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "meals" do
    field(:calories, :integer)
    field(:date, :date)
    field(:description, :string)
    belongs_to(:user_id, Exmeal.User)
    # field(:user_id, :binary_id)

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:calories, greater_than_or_equal_to: 0)
  end
end
