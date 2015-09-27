defmodule GuessNumber.B do

  import InputRetriever

  defp random_number(max) do
    :random.seed(:erlang.now)
    :random.uniform(max)
  end

  defp determine_target(difficulty) do
    :math.pow(10, difficulty) |> Kernel.trunc |> random_number
  end

  defp parse(guess) do
    case Integer.parse(guess) do
      { amount, "" } -> { :ok, amount }
      _              -> { :error, "You must enter an integer"}
    end
  end

  defp wrong_message(target, guess, previous_guesses) do
    cond do
      guess in previous_guesses -> "Already guessed that!"
      guess < target -> "Too low"
      guess > target -> "Too high"
    end
  end

  def evaluate_guess(target, guess, previous_guesses) do
    case parse(guess) do
      { :ok, ^target } -> { :right }
      { :ok, value } -> { :wrong, wrong_message(target, value, previous_guesses) }
      { :error, message } -> { :wrong, message }
    end
  end

  defp evaluate_guesses(target, previous_guesses \\ [], guess_count \\ 1) do
    guess = retrieve_string("What's your guess? ")
    case evaluate_guess(target, guess, previous_guesses) do
      { :right } -> guess_count
      { :wrong, message } ->
        IO.puts message
        evaluate_guesses(target, [guess | previous_guesses ], guess_count + 1)
    end
  end

  defp compliment(1), do: "You're a mind reader!"
  defp compliment(val) when val in (2..4), do: "Most impressive."
  defp compliment(val) when val in (3..6), do: "You can do better than that."
  defp compliment(val) when val > 6, do: "Better luck next time."

  defp play do
    IO.puts """

    Difficulty Levels:
        1 -> (1..10)
        2 -> (1..100)
        3 -> (1..1000)
    """

    difficulty = retrieve_integer("Choose a difficulty level: ", in: [1, 2, 3])
    target = determine_target(difficulty)
    IO.puts "I have my number."

    count = evaluate_guesses(target)
    IO.puts "You got it in #{count} guesses!"
    IO.puts(count |> compliment)
  end

  def go do
    play
    case retrieve_string("Play again? ", in: ~w(y n)) do
      "y" -> go
      _ -> IO.puts "Goodbye!"
    end
  end

end
