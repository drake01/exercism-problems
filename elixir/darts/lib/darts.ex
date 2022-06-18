defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    case final(x, y) do
      :outside -> 0
      :outer   -> 1
      :middle  -> 5
      :inner   -> 10
    end
  end

  def final(x, y) do
    distance = :math.sqrt(x*x + y*y)
    cond do
      distance <=1  -> :inner
      distance <=5  -> :middle
      distance <=10 -> :outer
      true          -> :outside
    end
  end

end
