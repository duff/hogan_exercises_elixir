defmodule LegalDrivingAge.A.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &LegalDrivingAge.A.go/0

  test "go" do
    assert_io "15", "You are not old enough to legally drive."
    assert_io "35", "You are old enough to legally drive."
  end

  test "must be a number" do
    assert_io ["abc", "3"], ~r/enter a valid integer.* not old enough/s
  end

  test "negative numbers" do
    assert_io ["-3", "98"], ~r/No negatives allowed.* are old enough/s
  end

end
