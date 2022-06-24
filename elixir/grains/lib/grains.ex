defmodule Grains do
  import Bitwise

  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer()) :: {:ok, pos_integer()} | {:error, String.t()}
  def square(number) when number < 65 and number > 0 do
    {:ok, 1 <<< (number - 1)}
  end

  def square(_number) do
    {:error, "The requested square must be between 1 and 64 (inclusive)"}
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: {:ok, pos_integer()}
  def total do
    {:ok,
     1..64
     |> Enum.reduce(0, fn i, acc -> Kernel.elem(square(i), 1) + acc end)}
  end

end
