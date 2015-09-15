defmodule Retriever do

  defp process_float(parsed) do
    case parsed do
      { amount, _ } when amount < 0 -> { :error, "No negatives allowed!.  Try again." }
      { amount, "" } -> { :ok, amount }
      { _, _ } -> { :error, "You must enter a float. Try again." }
      :error -> { :error, "You didn't enter a valid amount.  Try again." }
    end
  end

  def retrieve_float(prompt) do
    parsed = IO.gets(prompt) |> String.strip |> Float.parse
    case process_float(parsed) do
      { :ok, amount } -> amount
      { :error, message } ->
        IO.puts(message)
        retrieve_float(prompt)
    end
  end

  def retrieve_shape do
    shape = IO.gets("Shape of room? (r/c/l) ") |> String.strip
    case shape do
      "r" -> :rectangle
      "c" -> :circle
      "l" -> :l_shaped
      _ ->
        IO.puts "You must enter an 'r' for rectangle or a 'c' for circle."
        retrieve_shape
    end
  end

end

defmodule PaintCalculator do

  import Retriever

  defp area_for(:rectangle) do
    length = retrieve_float("Length of room? ")
    width = retrieve_float("Width of room? ")
    length * width
  end

  defp area_for(:circle) do
    diameter = retrieve_float("Diameter of room? ")
    radius = diameter / 2
    3.14 * :math.pow(radius, 2)
  end

  defp area_for(:l_shaped) do
    length_1 = retrieve_float("Length 1 of room? ")
    width_1 = retrieve_float("Width 1 of room? ")
    length_2 = retrieve_float("Length 2 of room? ")
    width_2 = retrieve_float("Width 2 of room? ")
    (length_1 * width_1) + (length_2 * width_2)
  end

  def go do
    area = retrieve_shape |> area_for
    gallons_needed = (area/350) |> Float.ceil |> Kernel.trunc

    IO.puts """

    You will need to purchase #{gallons_needed} gallons of
    paint to cover #{area |> Float.round(2) |> Float.to_string(decimals: 2)} square feet.
    """
  end

end

PaintCalculator.go
