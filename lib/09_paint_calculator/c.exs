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
    shape = IO.gets("Shape of room? (r/c) ") |> String.strip
    case shape do
      "r" -> :rectangle
      "c" -> :circle
      _ ->
        IO.puts "You must enter an 'r' for rectangle or a 'c' for circle."
        retrieve_shape
    end
  end

end

defmodule PaintCalculator do

  import Retriever

  def go do
    case retrieve_shape do
      :rectangle ->
        length = retrieve_float("Length of room? ")
        width = retrieve_float("Width of room? ")
        area = (length * width) |> Float.round(2)
      :circle ->
        diameter = retrieve_float("Diameter of room? ")
        radius = diameter / 2
        area = (3.14 * :math.pow(radius, 2)) |> Float.round(2)
    end

    gallons_needed = (area/350) |> Float.ceil |> Kernel.trunc

    IO.puts """

    You will need to purchase #{gallons_needed} gallons of
    paint to cover #{area} square feet.
    """
  end

end

PaintCalculator.go
