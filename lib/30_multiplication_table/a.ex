defmodule MultiplicationTable.A do

  def go do
    for x <- (0..12), y <- (0..12), do: IO.puts "#{x} * #{y} = #{x * y}"
  end

end
