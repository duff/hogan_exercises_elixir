defmodule KarvonenHeartRate.A do

  import InputRetriever

  defp target_heart_rate(intensity, age, resting_heart_rate) do
    intensity_percentage = intensity / 100
    result = (((220 - age) - resting_heart_rate) * intensity_percentage) + resting_heart_rate
    result |> Float.round |> Kernel.trunc
  end

  defp target_line(intensity, age, resting_heart_rate) do
    target = target_heart_rate(intensity, age, resting_heart_rate)
    "#{intensity}%       |   #{target} bpm"
  end

  def go do
    resting_heart_rate = retrieve_integer("Resting Heart Rate: ")
    age = retrieve_integer("Age: ")

    IO.puts "Intensity |   Rate"
    for n <- (55..95), rem(n, 5) == 0 do
      IO.puts target_line(n, age, resting_heart_rate)
    end
  end

end
