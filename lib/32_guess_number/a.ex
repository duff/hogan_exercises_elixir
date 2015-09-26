defmodule GuessNumber.A do

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

  def evaluate_guess(target, guess) do
    case parse(guess) do
      { :ok, ^target } -> { :right }
      { :ok, value } when value < target -> { :wrong, "Too low" }
      { :ok, value } when value > target -> { :wrong, "Too high" }
      { :error, message } -> { :wrong, message }
    end
  end

  defp evaluate_guesses(target, guess_count \\ 1) do
    guess = retrieve_string("What's your guess? ")
    case evaluate_guess(target, guess) do
      { :right } -> guess_count
      { :wrong, message } ->
        IO.puts message
        evaluate_guesses(target, guess_count + 1)
    end
  end

  def go do
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
  end

end
