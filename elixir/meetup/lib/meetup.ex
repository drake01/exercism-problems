defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
          :monday
          | :tuesday
          | :wednesday
          | :thursday
          | :friday
          | :saturday
          | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth
  @to_dow %{monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday: 7}

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date()
  def meetup(year, month, weekday, :first), do: find_date(year, month, weekday, 1..7)

  def meetup(year, month, weekday, :second), do: find_date(year, month, weekday, 8..14)

  def meetup(year, month, weekday, :third), do: find_date(year, month, weekday, 15..21)

  def meetup(year, month, weekday, :fourth), do: find_date(year, month, weekday, 22..28)

  def meetup(year, month, weekday, :last), do: find_date(year, month, weekday, 31..22)

  def meetup(year, month, weekday, :teenth), do: find_date(year, month, weekday, 13..19)

  defp find_date(year, month, weekday, day_range) do
    dow = @to_dow[weekday]
    day =
      Enum.find(day_range, fn day ->
        case Date.new(year, month, day) do
          {:ok, date} -> dow == Date.day_of_week(date)
          _invalid_date -> false
        end
      end)
    Date.new!(year, month, day)
  end

end
