defmodule SimpleInterest.A do

  import InputRetriever
  import Money

  def go do
    principal = retrieve_float("Enter the principal: ")
    interest_rate = retrieve_float("Enter the rate of interest: ")
    years = retrieve_integer("Enter the number of years: ")
    total = principal * (1 + (years * (interest_rate / 100)))

    IO.puts "After #{years} years at #{interest_rate}%, the investment will be worth #{as_money(total)}."
  end

end
