defmodule BMI.A do

  import InputRetriever

  defp display_message(bmi) when bmi < 18.5, do: "You are underweight."
  defp display_message(bmi) when bmi > 25, do: "You are overweight."
  defp display_message(_), do: "You are within the ideal weight range."

  def go do
    inches = retrieve_float("Height in inches: ")
    pounds = retrieve_float("Weight in pounds: ")
    bmi = (pounds / (inches * inches)) * 703
    IO.puts """
    Your BMI is #{bmi |> Float.round(1)}.
    #{display_message(bmi)}
    """
  end

end
