quotation = IO.gets("What is the quote? ") |> String.strip
who_said_it = IO.gets("Who said it? ") |> String.strip

IO.puts(who_said_it <> ~s( says, ") <> quotation <> ~s("))
