defmodule NumbersToNames.B do

  import InputRetriever

  defp months("en") do
    ~w(January February March April May June July August September October November December)
  end

  defp months("da") do
    ~w(Januar Februar Marts April Maj Juni Juli August September Oktober November December)
  end

  defp months("es") do
    ~w(enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre)
  end

  def go do
    language = retrieve_string("Which language (en | da | es)? ", ~w(en da es))
    number = retrieve_integer("Please enter the number of the month: ", 1..12)
    IO.puts "The name of the month is #{months(language) |> Enum.at(number - 1)}."
  end

end
