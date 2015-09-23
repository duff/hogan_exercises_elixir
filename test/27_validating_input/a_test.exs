defmodule ValidatingInput.A.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &ValidatingInput.A.go/0

  test "first name and last name are required" do
    assert_io [" ", "Joe", "Jones", "124", "ab-4423"], ~r/Cannot be blank.*First name: Joe/s
    assert_io ["Joe", " ", "Jones", "124", "ab-4423"], ~r/Cannot be blank.*Last name: Jones/s
  end

  test "first name and last name must be at least 2 characters" do
    assert_io ["R", "Joe", "Jones", "124", "ab-4423"], ~r/Too short.*First name: Joe/s
    assert_io ["Joe", "A", "Jones", "124", "ab-4423"], ~r/Too short.*Last name: Jones/s
  end

  test "zip code must be completely numeric" do
    assert_io ["Joe", "Jones", "AB", "1234", "ab-4423"], ~r/You must enter a valid integer/s
  end

  test "employee ID is in the correct format" do
    assert_io ["Joe", "Jones", "1234", "aaa", "ab-4423"], ~r/Invalid format/s
    assert_io ["Joe", "Jones", "1234", "124", "ab-4423"], ~r/Invalid format/s
    assert_io ["Joe", "Jones", "1234", "abb-abba", "ab-4423"], ~r/Invalid format/s
    assert_io ["Joe", "Jones", "1234", "12-abba", "ab-4423"], ~r/Invalid format/s
    assert_io ["Joe", "Jones", "1234", "ABBBB-1223", "ab-4423"], ~r/Invalid format/s
    assert_io ["Joe", "Jones", "1234", "AB-1223113", "ab-4423"], ~r/Invalid format/s
  end

  test "all good" do
    assert_io ["Joe", "Jones", "123456", "DU-4423"], "First name: Joe\nLast name: Jones\nZip Code: 123456\nEmployee ID: DU-4423"
    assert_io ["Phillip", "Rogers", "8458", "fe-2761"], "First name: Phillip\nLast name: Rogers\nZip Code: 8458\nEmployee ID: fe-2761"
  end

end
