defmodule BadInput.A do

  import InputRetriever

  defp retrieve_non_zero_float do
    case retrieve_float("What is the rate of return? ") do
      0.0 ->
        IO.puts "No zeros allowed.  Try again."
        retrieve_non_zero_float
      value -> value
    end
  end

  def go do
    rate = retrieve_non_zero_float
    years = (72 / rate) |> Float.round(1)
    IO.puts "It will take #{years} years to double your initial investment."
  end

end
