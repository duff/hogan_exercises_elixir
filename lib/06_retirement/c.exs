defmodule Retirement do

  defp retrieve_amount(prompt) do
    input = IO.gets(prompt) |> String.strip
    case Integer.parse(input) do
      { amount, _ } when amount < 0 ->
        IO.puts("No negatives allowed!.  Try again.")
        retrieve_amount(prompt)
      { amount, _ } -> amount
      :error ->
        IO.puts("You didn't enter a valid amount.  Try again.")
        retrieve_amount(prompt)
    end
  end

  defp respond_to(diff) when diff < 0, do: IO.puts "You're already retired"
  defp respond_to(diff) do
    { current_year, _, _ } = :erlang.date
    IO.puts "You have #{diff} years left until you can retire."
    IO.puts "It's #{current_year}, so you can retire in #{current_year + diff}."
  end

  def go do
    current_age = retrieve_amount("What is your current age? ")
    retirement_age = retrieve_amount("At what age would you like to retire? ")
    respond_to(retirement_age - current_age)
  end

end

Retirement.go
