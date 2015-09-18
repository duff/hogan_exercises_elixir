defmodule AnagramChecker.B do

  import InputRetriever

  defp to_upper_case_list(string) do
    string |> String.upcase |> String.codepoints
  end

  defp is_anagram?(first, second) when length(first) != length(second), do: false
  defp is_anagram?(first, second) do
    list_1 = to_upper_case_list(first)
    list_2 = to_upper_case_list(second)

    remaining = Enum.reduce(list_1, list_2, fn(each, acc) ->
      acc |> List.delete(each)
    end)

    Enum.count(remaining) == 0
  end

  def go do
    first = retrieve_string("Enter first string: ")
    second = retrieve_string("Enter second string: ")

    conclusion = if is_anagram?(first, second), do: "are", else: "are not"
    IO.puts "'#{first}' and '#{second}' #{conclusion} anagrams"
  end

end
