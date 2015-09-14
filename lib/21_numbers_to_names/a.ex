defmodule NumbersToNames.A do

  import InputRetriever

  @months %{
    1  => "January",
    2  => "February",
    3  => "March",
    4  => "April",
    5  => "May",
    6  => "June",
    7  => "July",
    8  => "August",
    9  => "September",
    10 => "October",
    11 => "November",
    12 => "December"
  }

  def go do
    number = retrieve_integer("Please enter the number of the month: ", 1..12)
    IO.puts "The name of the month is #{@months[number]}."
  end

end
