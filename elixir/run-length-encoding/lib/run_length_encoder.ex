defmodule RunLengthEncoder do

  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """

  @spec encode(String.t()) :: String.t()
  def encode(""), do: ""
  def encode(string) do
    string |> to_charlist
    |> group_sequences
    |> Enum.map(&encode_sequence/1)
    |> Enum.join
  end

  defp expand_sequence([_, "", char_string]), do: char_string
  defp expand_sequence([_, count, char_string]) do
    String.duplicate(char_string, String.to_integer(count))
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    Enum.map(Regex.scan(~r/([0-9]*)([A-Za-z ])/, string), &expand_sequence/1) 
    |> Enum.join
  end

  defp chunk(each, {last, count}=_acc) do
    if last === each, do: {:cont, {each, count + 1}},
    else: {:cont, {last, count}, {each, 1}}
  end

  defp group_sequences(chars) do
    Enum.chunk_while(chars, {List.first(chars), 0}, &chunk/2, &{:cont, &1, 0})
  end

  defp encode_sequence({codepoint, 1}) do
    to_string([codepoint])
  end

  defp encode_sequence({codepoint, n}) do
    "#{Integer.to_string(n)}#{to_string([codepoint])}"
  end


end
