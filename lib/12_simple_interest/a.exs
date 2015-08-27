defmodule Retriever do

  defp error_tuple(type) do
    type_str = type |> to_string |> String.replace(~r/Elixir\./, "") |> String.downcase
    { :error, "You must enter a valid #{type_str}. Try again." }
  end

  defp process_number(parsed, type) do
    case parsed do
      { amount, _ } when amount < 0 -> { :error, "No negatives allowed!.  Try again." }
      { amount, "" } -> { :ok, amount }
      { _, _ }       -> error_tuple(type)
      :error         -> error_tuple(type)
    end
  end

  defp retrieve(prompt, type) do
    parsed = IO.gets(prompt) |> String.strip |> type.parse
    case process_number(parsed, type) do
      { :ok, amount } -> amount
      { :error, message } ->
        IO.puts(message)
        retrieve(prompt, type)
    end
  end

  def retrieve_float(prompt) do
    retrieve(prompt, Float)
  end

  def retrieve_integer(prompt) do
    retrieve(prompt, Integer)
  end
end

defmodule SimpleInterest do

  import Retriever

  defp display(total) do
    total |> Float.ceil(2) |> Float.to_string(decimals: 2)
  end

  def go do
    principal = retrieve_float("Enter the principal: ")
    interest_rate = retrieve_float("Enter the rate of interest: ")
    years = retrieve_integer("Enter the number of years: ")
    total = principal * (1 + (years * (interest_rate / 100)))

    IO.puts "After #{years} years at #{interest_rate}%, the investment will be worth $#{display(total)}."
  end

end

SimpleInterest.go
