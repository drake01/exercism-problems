defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(1), do: [[1]]
  def rows(num) do
    Enum.reduce(2..num, rows(1), fn n, [prev_row | _] = acc ->
      [row(n, prev_row) | acc]
    end)
    |> Enum.reverse()
  end

  def row(num, prev_row) do
    Enum.map(0..num-1, fn n ->
      at(prev_row, n-1) + at(prev_row, n)
    end)
  end

  def at(list, index) when index<0 or index >= length(list), do: 0

  def at(list, index), do: Enum.at(list, index)

end
