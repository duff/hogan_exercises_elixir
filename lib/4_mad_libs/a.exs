
noun = IO.gets("Enter a noun: ") |> String.strip
verb = IO.gets("Enter a verb: ") |> String.strip
adjective = IO.gets("Enter an adjective: ") |> String.strip
adverb = IO.gets("Enter a adverb: ") |> String.strip

IO.puts("Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!")
