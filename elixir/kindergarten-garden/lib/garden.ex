defmodule Garden do
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @plants %{
    "R" => :radishes,
    "C" => :clover,
    "G" => :grass,
    "V" => :violets
  }
  @student_names ~w(alice bob charlie david eve
                    fred ginny harriet ileana
                    joseph kincaid larry)a
  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @student_names) do
    gardens = parse(info_string)
    student_names
    |> assign_gardens(gardens)
    |> handle_students_without_plants(student_names)
  end

  defp handle_students_without_plants(garden_info, student_names) do
    Enum.reduce(student_names, garden_info, &Map.put_new(&2, &1, {}))
  end

  defp assign_gardens(student_names, gardens) do
    student_names
    |> Enum.sort()
    |> Enum.zip(gardens)
    |> Enum.into(%{}, & &1)
  end

  defp parse(info_string) do
    info_string
    |> String.split("\n")
    |> decode_plants()
    |> group_plants_into_gardens()
    |> flatten_tuples()
  end

  defp decode_plants(rows) do
    rows
    |> Enum.map(&String.codepoints/1)
    |> Enum.map(&Enum.map(&1, fn x -> @plants[x] end))
  end

  defp group_plants_into_gardens(plants) do
    plants
    |> Enum.map(&Enum.chunk_every(&1, 2))
    |> Enum.zip()
  end

  defp flatten_tuples(gardens) do
    gardens
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&List.flatten/1)
    |> Enum.map(&List.to_tuple/1)
  end

end
