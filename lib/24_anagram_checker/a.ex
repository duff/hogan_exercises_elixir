defmodule AnagramChecker.A do

  import InputRetriever

  defp to_sorted_list(string) do
    string |> String.upcase |> String.codepoints |> Enum.sort
  end

  defp is_anagram?(first, second) do
    to_sorted_list(first) == to_sorted_list(second)
  end

  def go do
    first = retrieve_string("Enter first string: ")
    second = retrieve_string("Enter second string: ")

    conclusion = if is_anagram?(first, second), do: "are", else: "are not"
    IO.puts "'#{first}' and '#{second}' #{conclusion} anagrams"
  end

end
