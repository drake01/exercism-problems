defmodule Gigasecond do

  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}
  def from({{year, month, day}, {hours, minutes, seconds}}) do
  with dt <- NaiveDateTime.new!(Date.new!(year, month, day), Time.new!(hours, minutes, seconds)) |> NaiveDateTime.add(1_000_000_000, :second),
  do: {{dt.year, dt.month, dt.day}, {dt.hour, dt.minute, dt.second}}
  end
end
