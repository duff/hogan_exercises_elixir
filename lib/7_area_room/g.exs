defmodule Measurement do
  defstruct amount: nil, units: nil

  def new(amount, units) do
    %Measurement{amount: amount, units: units}
  end

  def feet(%Measurement{amount: amount, units: "f"}), do: new(amount, "f")
  def feet(%Measurement{amount: amount, units: "m"}), do: new(amount * 3.28083989501, "f")

  def square_feet(length, width) do
    (feet(length).amount * feet(width).amount) |> Float.round(3)
  end

  def square_meters(length, width) do
    (square_feet(length, width) * 0.09290304) |> Float.round(3)
  end

end

defimpl String.Chars, for: Measurement do
  def to_string(measurement) do
    "#{measurement.amount |> Float.round(3)} #{display_units(measurement.units)}"
  end

  defp display_units("f"), do: "feet"
  defp display_units("m"), do: "meters"
end


defmodule AreaRoom do

  defp process(parsed) do
    case parsed do
      { amount, _ } when amount < 0 -> { :error, "No negatives allowed!.  Try again." }
      { amount, units } when units in ["f", "m"] -> { :ok, Measurement.new(amount, units) }
      { _, _ } -> { :error, "You must use the proper form.  Try again.  Example input: 23.8f or 48.13m" }
      :error -> { :error, "You didn't enter a valid amount.  Try again." }
    end
  end

  defp retrieve_amount(prompt) do
    parsed = IO.gets(prompt) |> String.strip |> Float.parse
    case process(parsed) do
      { :ok, measurement } -> measurement
      { :error, message } ->
        IO.puts(message)
        retrieve_amount(prompt)
    end
  end

  def go do
    length = retrieve_amount("What is the length of the room? ")
    width = retrieve_amount("What is the width of the room? ")

    IO.puts "You entered dimensions of #{length} by #{width}."
    IO.puts "That's #{Measurement.feet(length)} by #{Measurement.feet(width)}."

    IO.puts """

    The area is
    #{Measurement.square_feet(length, width)} square feet
    #{Measurement.square_meters(length, width)} square meters
    """
  end

end

AreaRoom.go
