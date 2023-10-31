defmodule Exmeal.Error do
  @keys [:status, :result]
  @enforce_keys @keys
  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  # defde build_meal_not_found_error, do: build()
  defdelegate build_meal_not_found_error(status, result), to: __MODULE__, as: :build
  defdelegate build_user_not_found_error(status, result), to: __MODULE__, as: :build
  # def build_user_not_found_error, do: build()
end
