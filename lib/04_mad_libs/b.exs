defmodule MadLibs do

  defp retrieve(part_of_speech) do
    IO.gets("Enter #{part_of_speech}: ") |> String.strip
  end

  def go do
    noun = retrieve(:noun)
    verb = retrieve(:verb)
    adjective = retrieve(:adjective)
    adverb = retrieve(:adverb)

    IO.puts("Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!")
  end

end


MadLibs.go
