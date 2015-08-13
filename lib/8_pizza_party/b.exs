defmodule IntegerRetriever do

  defp process(parsed) do
    case parsed do
      { amount, _ } when amount < 0 -> { :error, "No negatives allowed!.  Try again." }
      { amount, "" } -> { :ok, amount }
      { _, _ } -> { :error, "You must enter an integer. Try again." }
      :error -> { :error, "You didn't enter a valid amount.  Try again." }
    end
  end

  def retrieve(prompt) do
    parsed = IO.gets(prompt) |> String.strip |> Integer.parse
    case process(parsed) do
      { :ok, amount } -> amount
      { :error, message } ->
        IO.puts(message)
        retrieve(prompt)
    end
  end

end

defmodule PizzaParty do

  import IntegerRetriever

  defp pieces_message(1), do: "1 piece"
  defp pieces_message(amount), do: "#{amount} pieces"
  defp leftover_message(1), do: "is 1 leftover piece"
  defp leftover_message(amount), do: "are #{amount} leftover pieces"

  def go do
    people = retrieve("How many people? ")
    pizzas = retrieve("How many pizzas do you have? ")
    total_slices = pizzas * 8
    slices_per_person = div(total_slices, people)
    leftovers = rem(total_slices, people)

    IO.puts """

    #{people} people with #{pizzas} pizzas (#{total_slices} total slices)
    Each person gets #{pieces_message(slices_per_person)} of pizza.
    There #{leftover_message(leftovers)}.
    """
  end

end

PizzaParty.go





