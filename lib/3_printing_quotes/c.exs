
quotation = IO.gets("What is the quote? ") |> String.strip
who_said_it = IO.gets("Who said it? ") |> String.strip

IO.puts ~s(#{who_said_it} says, "#{quotation}")
