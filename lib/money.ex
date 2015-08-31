defmodule Money do

  def as_money(total) do
    amount = total |> Float.ceil(2) |> Float.to_string(decimals: 2)
    "$#{amount}"
  end

end
