defmodule AddingNumbers.A do

  import InputRetriever

  defp retrieve_numbers(acc \\ []) do
    case retrieve_float("Enter number: ") do
      :eof -> acc
      value -> retrieve_numbers([ value | acc ])
    end
  end

  def go do
    numbers = retrieve_numbers
    IO.puts ""
    IO.puts "The total is #{Enum.sum(numbers)}"
  end

end
