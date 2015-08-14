defmodule SimpleMath do

  defp retrieve_amount(prompt) do
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
    first = retrieve_amount("What is the first number? ")
    second = retrieve_amount("What is the second number? ")

    IO.puts(
    """

    #{first} + #{second} = #{first+second}
    #{first} - #{second} = #{first-second}
    #{first} * #{second} = #{first*second}
    #{first} / #{second} = #{first/second}
    """
    )
  end

end

SimpleMath.go
