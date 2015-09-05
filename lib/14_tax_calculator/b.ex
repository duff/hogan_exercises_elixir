defmodule TaxCalculator.B do

  import InputRetriever
  import Money

  def go do
    total = retrieve_float("What is the order amount? ")
    state = retrieve_string("What is the state? ")
    if state == "WI" do
      tax = total * 0.055
      IO.puts "The subtotal is #{total |> as_money}."
      IO.puts "The tax is #{tax |> as_money}."
      total = total + tax
    end

    IO.puts "The total is #{total |> as_money}."
  end

end
