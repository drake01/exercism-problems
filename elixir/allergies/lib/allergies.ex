defmodule Allergies do
  use Bitwise, only_operators: true
  @allergies_bits %{
    "eggs"         => 1,
    "peanuts"      => 2,
    "shellfish"    => 4,
    "strawberries" => 8,
    "tomatoes"     => 16,
    "chocolate"    => 32,
    "pollen"       => 64,
    "cats"         => 128
  }
  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(0), do: []

  def list(flags) do
    @allergies_bits
    |> Map.keys
    |> Enum.filter(&allergic_to?(flags, &1))
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item) do
    (@allergies_bits[item] &&& flags) > 0
  end
end
