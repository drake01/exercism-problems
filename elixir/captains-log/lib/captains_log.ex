defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]
  @start 41000
  @finish 42000

  def random_planet_class() do
    Enum.random(@planetary_classes)
  end

  def random_ship_registry_number() do
    "NCC-#{Enum.random((1000..9999))}"
  end

  def random_stardate() do
    x = :rand.uniform()*(@finish-@start)+@start
    # IO.puts(x)
    x
  end

  def format_stardate(stardate) do
    "~.1f" |> :io_lib.format([stardate]) |> to_string()
  end

end
