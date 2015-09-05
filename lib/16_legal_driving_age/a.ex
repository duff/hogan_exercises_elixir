defmodule LegalDrivingAge.A do

  import NumberRetriever

  defp message_for_age(age) when age < 16 do
    "You are not old enough to legally drive."
  end

  defp message_for_age(age) do
    "You are old enough to legally drive."
  end

  def go do
    age = retrieve_integer("What is your age? ")
    IO.puts message_for_age(age)
  end

end
