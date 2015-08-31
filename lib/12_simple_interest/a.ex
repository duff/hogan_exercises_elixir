defmodule SimpleInterest.A do

  import NumberRetriever

  defp display(total) do
    total |> Float.ceil(2) |> Float.to_string(decimals: 2)
  end

  def go do
    principal = retrieve_float("Enter the principal: ")
    interest_rate = retrieve_float("Enter the rate of interest: ")
    years = retrieve_integer("Enter the number of years: ")
    total = principal * (1 + (years * (interest_rate / 100)))

    IO.puts "After #{years} years at #{interest_rate}%, the investment will be worth $#{display(total)}."
  end

end
