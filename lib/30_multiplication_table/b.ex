defmodule MultiplicationTable.B do

  defp rows do
   Enum.map(0..42, fn(x) ->
      Enum.map(0..20, fn(y) ->
        (x * y) |> Integer.to_string |> String.ljust(6)
      end)
    end)
  end

  def go do
    Enum.each(rows, &IO.puts(&1))
  end

end
