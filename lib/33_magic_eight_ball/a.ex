defmodule MagicEightBall.A do

  import InputRetriever

  @answers ["Yes", "No", "Maybe", "Ask again later"]

  defp random_index do
    :random.seed(:erlang.now)
    :random.uniform(@answers |> Enum.count)
  end

  defp random_answer do
    @answers |> Enum.at(random_index - 1)
  end

  def go do
    question = retrieve_string("What's your question? ")
    IO.puts random_answer
  end

end
