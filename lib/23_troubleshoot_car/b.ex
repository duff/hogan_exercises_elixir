defmodule TroubleshootCar.B do

  import InputRetriever

  defp ask(prompt) do
    retrieve_string(prompt, in: ~w(y n)) == "y"
  end

  defp silent(true) do
    ask("Are the battery terminals corroded? ")
    |> corroded
  end

  defp silent(false) do
    ask("Does the car make a clicking noise? ")
    |> clicking
  end

  defp corroded(true), do: IO.puts "Clean terminals and try starting again."
  defp corroded(false), do: IO.puts "Replace cables and try again."

  defp clicking(true), do: IO.puts "Replace the battery."
  defp clicking(false) do
    ask("Does the car crank up but fail to start? ")
    |> fail_to_start
  end

  defp fail_to_start(true), do: IO.puts "Check spark plug connections."
  defp fail_to_start(false) do
    ask("Does the engine start and then die? ")
    |> start_then_die
  end

  defp start_then_die(false), do: IO.puts "I have no clue.  Perhaps give the car away now."
  defp start_then_die(true) do
    ask("Does your car have fuel injection? ")
    |> fuel_injected
  end

  defp fuel_injected(true), do: IO.puts "Get it in for service."
  defp fuel_injected(false), do: IO.puts "Check to ensure the choke is opening and closing."

  def go do
    ask("Is the car silent when you turn the key? ")
    |> silent
  end

end
