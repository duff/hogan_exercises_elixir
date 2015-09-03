defmodule AreaRoom.B do

  @conversion_factor 0.09290304

  defp retrieve_amount(prompt) do
    input = IO.gets(prompt) |> String.strip
    case Float.parse(input) do
      { amount, _ } when amount < 0 ->
        IO.puts("No negatives allowed!.  Try again.")
        retrieve_amount(prompt)
      { amount, units } when units in ["f", "m"] -> { amount, units }
      { _, _ } ->
        IO.puts("You must use the proper form.  Try again.  Example input: 23.8f or 48.13m")
        retrieve_amount(prompt)
      :error ->
        IO.puts("You didn't enter a valid amount.  Try again.")
        retrieve_amount(prompt)
    end
  end

  defp display(length, "f"), do: "#{length} feet"
  defp display(length, "m"), do: "#{length} meters"

  defp feet(amount, "f"), do: amount
  defp feet(amount, "m"), do: amount * 3.28083989501

  def go do
    { length, length_units } = retrieve_amount("What is the length of the room? ")
    { width, width_units } = retrieve_amount("What is the width of the room? ")

    length_in_feet = feet(length, length_units)
    width_in_feet = feet(width, width_units)

    square_feet = length_in_feet * width_in_feet
    square_meters = square_feet * @conversion_factor

    IO.puts """

    You entered dimensions of #{display(length, length_units)} by #{display(width, width_units)}.
    That's #{length_in_feet} feet by #{width_in_feet} feet.

    The area is
    #{Float.to_string(square_feet, decimals: 3, compact: true)} square feet
    #{Float.to_string(square_meters, decimals: 3, compact: true)} square meters
    """
  end

end
