defmodule TroubleshootCar.A do

  import InputRetriever

  defp yes_no(prompt) do
    retrieve_string(prompt, ~w(y n)) == "y"
  end

  defp silent(true) do
    if yes_no("Are the battery terminals corroded? ") do
      IO.puts "Clean terminals and try starting again."
    else
      IO.puts "Replace cables and try again."
    end
  end

  defp silent(false) do
    yes_no("Does the car make a clicking noise? ")
    |> clicking
  end

  defp clicking(true) do
    IO.puts "Replace the battery."
  end

  defp clicking(false) do
    yes_no("Does the car crank up but fail to start? ")
    |> fail_to_start
  end

  defp fail_to_start(true) do
    IO.puts "Check spark plug connections."
  end

  defp fail_to_start(false) do
    yes_no("Does the engine start and then die? ")
    |> start_then_die
  end

  defp start_then_die(true) do
    if yes_no("Does your car have fuel injection? ") do
      IO.puts "Get it in for service."
    else
      IO.puts "Check to ensure the choke is opening and closing."
    end
  end

  defp start_then_die(false) do
    IO.puts "I have no clue.  Perhaps give the car away now."
  end

  def go do
    yes_no("Is the car silent when you turn the key? ")
    |> silent
  end

end
