defmodule TipCalculator do

  def retrieve_amount(prompt) do
    input = IO.gets(prompt) |> String.strip
    case Float.parse(input) do
      { amount, _ } -> amount
      :error -> exit("You didn't enter a valid amount.  Unable to comply.")
    end
  end

  def go do
    bill = retrieve_amount("What is the bill? ")
    tip_percentage = retrieve_amount("What is the tip percentage? ")

    tip = bill * (tip_percentage / 100)
    total = bill + tip

    IO.puts "The tip is $#{tip}"
    IO.puts "The total is $#{total}"
  end

end

TipCalculator.go
