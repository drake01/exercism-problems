defmodule ResistorColorTrio do

  @color_map %{
    black:  0,
    brown:  1,
    red:    2,
    orange: 3,
    yellow: 4,
    green:  5,
    blue:   6,
    violet: 7,
    grey:   8,
    white:  9
  }

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label(colors) do
    tmp = Enum.take(colors, 2)
    |> Enum.map(&colorcode/1)
    |> Enum.join()
    |> String.to_integer()
    zs = List.last(colors)
    |> colorcode()
    |> zeroes()
    answer(tmp * zs)
  end

  defp zeroes(exp), do: :math.pow(10, exp) |> trunc()

  defp colorcode(color) do
    @color_map[color]
  end

  defp answer(nr) do
    if rem(nr, 1000) == 0 do
      {div(nr, 1000), :kiloohms}
    else
      {nr, :ohms}
    end
  end

end
