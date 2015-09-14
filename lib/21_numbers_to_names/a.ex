defmodule NumbersToNames.A do

  import InputRetriever

  @months ~w(January February March April May June July August September October November December)

  def go do
    number = retrieve_integer("Please enter the number of the month: ", 1..12)
    IO.puts "The name of the month is #{@months |> Enum.at(number - 1)}."
  end

end
