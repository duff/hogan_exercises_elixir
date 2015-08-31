defmodule AreaRoom do

  @conversion_factor 0.09290304

  defp retrieve_amount(prompt) do
    input = IO.gets(prompt) |> String.strip
    case Float.parse(input) do
      { amount, _ } when amount < 0 ->
        IO.puts("No negatives allowed!.  Try again.")
        retrieve_amount(prompt)
      { amount, _ } -> amount
      :error ->
        IO.puts("You didn't enter a valid amount.  Try again.")
        retrieve_amount(prompt)
    end
  end

  def go do
    length = retrieve_amount("What is the length of the room in feet? ")
    width = retrieve_amount("What is the width of the room in feet? ")
    square_feet = length * width
    square_meters = square_feet * @conversion_factor

    IO.puts """
    You entered dimensions of #{length} feet by #{width} feet
    The area is
    #{Float.to_string(square_feet, decimals: 3, compact: true)} square feet
    #{Float.to_string(square_meters, decimals: 3, compact: true)} square meters
    """
  end

end

AreaRoom.go
