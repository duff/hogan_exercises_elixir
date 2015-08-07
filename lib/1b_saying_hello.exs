name = IO.gets("What is your name? ") |> String.strip
output = case name do
  "Joe"  -> "Yo, #{name}, what's up?"
  "Fred" -> "#{name}! How goes it?"
  _      -> "Hello, #{name}, nice to meet you!"
end

IO.puts output
