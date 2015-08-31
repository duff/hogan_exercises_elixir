defmodule TaxCalculator.B do

  import NumberRetriever
  import Money

  def go do
    total = retrieve_float("What is the order amount? ")
    state = IO.gets("What is the state? ") |> String.strip
    if state == "WI" do
      tax = total * 0.055
      IO.puts "The subtotal is #{total |> as_money}."
      IO.puts "The tax is #{tax |> as_money}."
      total = total + tax
    end

    IO.puts "The total is #{total |> as_money}."
  end

end
