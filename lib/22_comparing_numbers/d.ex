defmodule ComparingNumbers.D do

  import InputRetriever

  defp retrieve_unique_number(prompt, existing) do
    value = retrieve_integer(prompt)
    if value in existing do
      IO.puts "That already exists.  Try again."
      retrieve_unique_number(prompt, existing)
    else
      value
    end
  end

  defp retrieve_numbers do
    Enum.reduce(1..10, [], fn(each, acc) ->
      [ retrieve_unique_number("Enter number #{each}: ", acc) | acc ]
    end)
  end

  def go do
    IO.puts "The largest number is #{retrieve_numbers |> Enum.max}"
  end

end
