defmodule TemperatureConverter.B do

  import InputRetriever

  defp from_to_converter(convert_to) when convert_to in ~w(c C) do
    { "Fahrenheit", "Celsius", fn(degrees) -> (degrees - 32) * 5 / 9 end }
  end

  defp from_to_converter(convert_to) when convert_to in ~w(f F) do
    { "Celsius", "Fahrenheit", fn(degrees) -> (degrees * 9 / 5) + 32 end }
  end

  def go do
    IO.puts """
    Press C to convert from Fahrenheit to Celsius.
    Press F to convert from Celsius to Fahrenheit.
    """

    convert_to = retrieve_string("Your choice: ", ~w[C c F f])
    { from, to, converter } = from_to_converter(convert_to)

    temp = retrieve_float("Please enter the temperature in #{from}: ")
    IO.puts "The temperature in #{to} is #{converter.(temp) |> Float.round(2)} degrees."
  end

end
