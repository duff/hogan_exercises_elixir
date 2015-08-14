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

  defp needed_message(1), do: "1 pizza"
  defp needed_message(amount), do: "#{amount} pizzas"
  defp leftover_message(1), do: "1 leftover piece"
  defp leftover_message(amount), do: "#{amount} leftover pieces"

  def go do
    people = retrieve("How many people? ")
    desired_slices_per_person = retrieve("How many slices does each person want? ")
    total_desired_slices = desired_slices_per_person * people
    needed = (total_desired_slices / 8) |> Float.ceil |> Kernel.trunc

    leftovers =  (needed * 8) - total_desired_slices

    IO.puts """

    #{people} people want #{desired_slices_per_person} slices each.
    We need to buy #{needed_message(needed)} since we need #{total_desired_slices} total slices.
    When we do, there will be #{leftover_message(leftovers)}.
    """
  end

end

PizzaParty.go
