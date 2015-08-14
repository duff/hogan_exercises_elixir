{ bill, _ } = IO.gets("What is the bill? ") |> String.strip |> Float.parse
{ tip_percentage, _ } = IO.gets("What is the tip percentage? ") |> String.strip |> Float.parse

tip = bill * (tip_percentage / 100)
total = bill + tip

IO.puts "The tip is $#{tip}"
IO.puts "The total is $#{total}"
