defmodule MadLibs do

  defp r(part_of_speech) do
    IO.gets("Enter #{part_of_speech}: ") |> String.strip
  end

  def go do
    IO.puts("Do you #{r(:verb)} your #{r(:adjective)} #{r(:noun)} #{r(:adverb)}? That's hilarious!")
  end

end

MadLibs.go
