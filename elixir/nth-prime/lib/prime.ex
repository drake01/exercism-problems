defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise "nope"

  def nth(count) do
    primes(Enum.to_list(2..(count*count)), [])
    |> Enum.at(count - 1)
  end

  defp primes([], acc) do
    Enum.reverse(acc)
  end

  defp primes([prime | tail], acc) do
   primes(Enum.filter(tail, &(rem(&1, prime) !== 0)), [prime | acc])
  end
end
