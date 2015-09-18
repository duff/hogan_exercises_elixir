defmodule AnagramChecker.A.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &AnagramChecker.A.go/0

  test "things that are anagrams" do
    assert_io ~w(note tone), "'note' and 'tone' are anagrams"
    assert_io ["listen", "silent"], "'listen' and 'silent' are anagrams"
    assert_io ["Elvis", "lives"], "'Elvis' and 'lives' are anagrams"
  end

  test "things that ain't anagrams" do
    assert_io ~w(huh what), "'huh' and 'what' are not anagrams"
    assert_io ~w(hello bello), "'hello' and 'bello' are not anagrams"
  end

end
