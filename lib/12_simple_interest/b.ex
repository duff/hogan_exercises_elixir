defmodule SimpleInterest.B do

  import InputRetriever
  import Money

  def go do
    principal = retrieve_float("Enter the principal: ")
    interest_rate = retrieve_float("Enter the rate of interest: ")
    years = retrieve_integer("Enter the number of years: ")
    interest_earned_per_year = principal * (interest_rate / 100)
    total = principal * (1 + (years * (interest_rate / 100)))

    Enum.reduce(1..(years - 1), principal, fn(each, acc) ->
      year_total = acc+interest_earned_per_year
      IO.puts "After #{each} years, your total is #{as_money(year_total)}"
      year_total
    end)

    IO.puts "-----------"
    IO.puts "After #{years} years at #{interest_rate}%, the investment will be worth #{as_money(total)}."
  end

end
