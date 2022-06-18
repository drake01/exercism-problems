defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(1), do: []
  def factors_for(number) do
    case find_divisor(number) do
      nil -> [number]
      d   -> [d | div(number, d) |> factors_for() ]
    end
  end

  defp find_divisor(number) when number < 4, do: nil
  defp find_divisor(number) do
    2..div(number, 2)
    |> Enum.find(fn num -> rem(number, num) == 0 end)
  end
end
