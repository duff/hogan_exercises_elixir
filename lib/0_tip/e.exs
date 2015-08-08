defmodule TipCalculator do

  def retrieve_amount(prompt) do
    input = IO.gets(prompt) |> String.strip
    case Float.parse(input) do
      { amount, _ } when amount < 0 ->
        IO.puts("No negatives allowed!.  Try again.")
        retrieve_amount(prompt)
      { amount, _ } -> amount
      :error ->
        IO.puts("You didn't enter a valid amount.  Try again.")
        retrieve_amount(prompt)
    end
  end

  def go do
    bill = retrieve_amount("What is the bill? ")
    tip_percentage = retrieve_amount("What is the tip percentage? ")

    tip = bill * (tip_percentage / 100)
    total = bill + tip

    IO.puts ""
    IO.puts "The bill was $#{bill}"
    IO.puts "The tip percentage is $#{tip_percentage}"
    IO.puts "The tip is $#{tip}"
    IO.puts "The total is $#{total}"
  end

end

TipCalculator.go
