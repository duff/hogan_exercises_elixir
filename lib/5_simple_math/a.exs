defmodule SimpleMath do

  def retrieve_amount(prompt) do
    { amount, _ } = IO.gets(prompt) |> String.strip |> Float.parse
    amount
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
