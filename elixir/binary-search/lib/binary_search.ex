defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found

  def search(numbers, key), do: binary_search(numbers, key, 0, tuple_size(numbers)-1)

  @spec binary_search(tuple, integer,integer,integer) :: {:ok, integer} | :not_found
  def binary_search(_numbers, _key, from, to) when from > to , do: :not_found

  def binary_search(numbers, key, from, to) do
    index = from + div(to-from, 2)
    case elem(numbers, index) do
      ^key -> {:ok, index}
      result when result > key -> binary_search(numbers, key, from, index-1)
      result when result < key -> binary_search(numbers, key, index+1, to)
    end
  end

end
