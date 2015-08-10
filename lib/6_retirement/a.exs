defmodule Retirement do

  def retrieve_amount(prompt) do
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

  def go do
    current_age = retrieve_amount("What is your current age? ")
    retirement_age = retrieve_amount("At what age would you like to retire? ")
    diff = retirement_age - current_age

    {{ current_year, _, _ }, _ } = :calendar.universal_time()
    IO.puts "You have #{diff} years left until you can retire."
    IO.puts "It's #{current_year}, so you can retire in #{current_year + diff}"
  end

end

Retirement.go
