defmodule TipCalculator do

  defp process({ amount, _ }) when amount < 0 do
    IO.puts("No negatives allowed!.  Try again.")
    :error
  end

  defp process({ amount, _ }) do
    amount
  end

  defp process(:error) do
    IO.puts("You didn't enter a valid amount.  Try again.")
    :error
  end

  defp retrieve_amount(prompt) do
    input = IO.gets(prompt) |> String.strip
    amount = input |> Float.parse |> process
    case amount do
      :error -> retrieve_amount(prompt)
      _ -> amount
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
