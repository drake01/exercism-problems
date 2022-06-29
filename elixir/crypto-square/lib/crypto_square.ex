defmodule CryptoSquare do
  @doc """
  Encode string square methods
  ## Examples

    iex> CryptoSquare.encode("abcd")
    "ac bd"
  """
  @spec encode(String.t()) :: String.t()
  def encode(""), do: ""

  def encode(<<_::size(8)>> = str), do: String.downcase(str)

  def encode(str) do
    chars = prepare_string(str)
    row_count = get_row_count(chars)
    chars
    |> Enum.chunk_every(row_count, row_count, Stream.cycle([' ']))
    |> read_columns()
    |> Enum.join(" ")
  end
  defp normalize(str) do
    str
    |> String.downcase()
    |> String.replace(~r/\W/, "")
  end
  defp prepare_string(str) do
    str
    |> normalize()
    |> to_charlist()
  end
  defp get_row_count(chars) do
    chars
    |> length()
    |> :math.sqrt()
    |> ceil()
  end
  defp read_columns(rows) do
    rows
    |> Enum.zip()
    |> Enum.map(fn col ->
      Tuple.to_list(col) |> to_string()
    end)
  end
end
