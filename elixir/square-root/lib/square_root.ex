defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand), do: helper(radicand, radicand)
  defp helper(x, comm)
  defp helper(x, comm) when round(comm * comm) == x, do: round(comm)
  defp helper(x, comm), do: helper(x, (comm + x/comm)/2)

end
