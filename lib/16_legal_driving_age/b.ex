defmodule LegalDrivingAge.B do
  @country_ages [
    [ "New Zealand", 16 ],
    [ "South Africa", 18 ],
    [ "India", 18 ],
    [ "Ethiopia", 14 ],
    [ "Venezuela", 18 ],
    [ "Russia", 18 ],
    [ "Canada", 16 ],
    [ "Uruguay", 18 ],
    [ "Mauritius", 18 ],
    [ "Tanzania", 18 ],
    [ "China", 18 ],
    [ "Japan", 18 ],
    [ "Brazil", 18 ],
    [ "Malaysia", 17 ],
    [ "Albania", 18 ],
    [ "Pakistan", 18 ],
    [ "Taiwan", 18 ],
    [ "Oman", 18 ],
    [ "Indonesia", 17 ]
  ]

  import NumberRetriever

  defp legal_countries(your_age) do
    @country_ages
    |> Enum.filter_map(fn([_, age]) -> your_age >= age end,
                       fn([country, age]) -> "#{country} (#{age})" end)
  end

  def go do
    your_age = retrieve_integer("What is your age? ")

    IO.puts "You can legally drive in the following countries:"
    IO.puts legal_countries(your_age) |> Enum.join("\n")
  end

end
