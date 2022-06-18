defmodule KitchenCalculator do

  @ml_per_unit %{
    milliliter: 1,
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15
  }

  def get_volume({_unit, volume}), do: volume

  def to_milliliter({unit, volume}), do: {:milliliter, volume * @ml_per_unit[unit]}

  def from_milliliter({:milliliter, volume}, unit), do: {unit, volume / @ml_per_unit[unit]}

  def convert(volume_pair, unit), do: volume_pair |> to_milliliter |> from_milliliter(unit)

end
