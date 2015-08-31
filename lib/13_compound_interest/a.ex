defmodule CompoundInterest.A do

  import NumberRetriever

  defp display(total) do
    total |> Float.ceil(2) |> Float.to_string(decimals: 2)
  end

  def go do
    principal = retrieve_float("What is the principal amount? ")
    interest_rate = retrieve_float("What is the rate? ")
    years = retrieve_integer("What is the number of years? ")
    times = retrieve_integer("What is the number of times the interest is compounded per year? ")
    total = principal * :math.pow((1 + ((interest_rate / 100)/times)), times * years)

    IO.puts "$#{display(principal)} invested at #{interest_rate}% for #{years} years compounded #{times} times per year is $#{display(total)}."
  end

end
