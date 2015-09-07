defmodule TemperatureConverter.A do

  import InputRetriever

  defp from_units(target) when target in ~w(c C), do: "Fahrenheit"
  defp from_units(target) when target in ~w(f F), do: "Celsius"

  defp to_fahrenheit(degrees), do: (degrees * 9 / 5) + 32
  defp to_celsius(degrees), do: (degrees - 32) * 5 / 9

  defp display_result(temp, target) when target in ~w(c C) do
    IO.puts "The temperature in Celsius is #{temp |> to_celsius |> Float.round(2)} degrees."
  end

  defp display_result(temp, target) when target in ~w(f F) do
    IO.puts "The temperature in Fahrenheit is #{temp |> to_fahrenheit |> Float.round(2)} degrees."
  end

  def go do
    IO.puts """
    Press C to convert from Fahrenheit to Celsius.
    Press F to convert from Celsius to Fahrenheit.
    """

    target = retrieve_string("Your choice: ", ~w[C c F f])
    temperature = retrieve_float("Please enter the temperature in #{from_units(target)}: ")
    display_result(temperature, target)
  end

end
