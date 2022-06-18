defmodule DNA do

  @nucleotide_map %{
    ?\s => 0b0000,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000
  }

  @nucleotide_decode_map Enum.map(@nucleotide_map, fn {k, v} -> {v, k} end) |> Map.new()

  def encode_nucleotide(code_point) do
    Map.fetch!(@nucleotide_map, code_point)
  end

  def decode_nucleotide(encoded_code) do
    Map.fetch!(@nucleotide_decode_map, encoded_code)
  end

  def encode(dna)
  def encode([]), do: <<>>
  def encode([head | tail]) do
    << encode_nucleotide(head)::4, encode(tail)::bitstring >>
  end

  def decode(dna)
  def decode(<<>>), do: []
  def decode(<< head::4, tail::bitstring >>) do
    [decode_nucleotide(head) | decode(tail)]
  end

end
