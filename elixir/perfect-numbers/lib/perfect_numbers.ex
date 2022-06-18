defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number <=0 do
    {:error, "Classification is only possible for natural numbers."}
  end

  def classify(number) when number in [1,2], do: {:ok, :deficient}

  def classify(number) do
    1..div(number, 2)
    |> Stream.filter(&(rem(number, &1) === 0))
    |> Enum.to_list()
    |> Enum.reduce(&(&1 + &2))
    |> perfectnum(number)
  end

  defp perfectnum(sum, number) when sum === number, do: {:ok, :perfect}

  defp perfectnum(sum, number) when sum > number, do: {:ok, :abundant}

  defp perfectnum(sum, number) when sum < number, do: {:ok, :deficient}

end
