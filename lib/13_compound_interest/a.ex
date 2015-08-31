defmodule CompoundInterest.A do

  import NumberRetriever
  import Money

  def go do
    principal = retrieve_float("What is the principal amount? ")
    interest_rate = retrieve_float("What is the rate? ")
    years = retrieve_integer("What is the number of years? ")
    times = retrieve_integer("What is the number of times the interest is compounded per year? ")
    total = principal * :math.pow((1 + ((interest_rate / 100)/times)), times * years)

    IO.puts "#{as_money(principal)} invested at #{interest_rate}% for #{years} years compounded #{times} times per year is #{as_money(total)}."
  end

end
