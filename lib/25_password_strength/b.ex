defmodule PasswordStrength.B do

  import InputRetriever

  @only_digits ~S(^\d+$)
  @only_chars  ~S(^[a-zA-Z]+$)

  defp assess(password, codepoints) when length(codepoints) < 8 do
    cond do
      String.match?(password, ~r/#{@only_digits}/) -> "wicked weak"
      String.match?(password, ~r/#{@only_chars}/) -> "very weak"
      true -> "weak"
    end
  end

  defp assess(password, _) do
    cond do
      String.match?(password, ~r/#{@only_digits}|#{@only_chars}/) -> "mediocre"
      String.match?(password, ~r/^[a-zA-Z\d]+$/) -> "strong"
      true -> "very strong"
    end
  end

  def go do
    password = retrieve_string("Enter password: ")
    assessment = assess(password, String.codepoints(password))

    IO.puts "The password '#{password}' is a #{assessment} password."
  end

end
