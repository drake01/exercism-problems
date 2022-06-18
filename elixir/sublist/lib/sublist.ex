defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(l, l), do: :equal

  def compare(x,y) when is_list(x) and is_list(y) do
    cond do
      is_subset_of?(y, x) -> :superlist
      is_subset_of?(x, y) -> :sublist
      true -> :unequal
    end
  end

  def is_subset_of?([], _), do: true

  def is_subset_of?(a, b) do
    Stream.chunk_every(b, length(a), 1, :discard) |> Enum.any?(&(&1 === a))
  end

end
