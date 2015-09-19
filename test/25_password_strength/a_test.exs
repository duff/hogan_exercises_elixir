defmodule PasswordStrength.A.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &PasswordStrength.A.go/0

  test "wicked weak - only numbers, less than 8 characters" do
    assert_io "123", "The password '123' is a wicked weak password."
    assert_io "42899", "The password '42899' is a wicked weak password."
  end

  test "very weak - only letters, less than 8 characters" do
    assert_io "ab", "The password 'ab' is a very weak password."
    assert_io "OnlySvn", "The password 'OnlySvn' is a very weak password."
  end

  test "weak - numbers, letters and special characters, but less than 8 of them" do
    assert_io "1Ab&", "The password '1Ab&' is a weak password."
    assert_io "aA4@9$", "The password 'aA4@9$' is a weak password."
  end

  test "mediocre - only letters, 8 or more characters" do
    assert_io "MoreThanEightCharacters", "The password 'MoreThanEightCharacters' is a mediocre password."
    assert_io "ButOnlyLetters", "The password 'ButOnlyLetters' is a mediocre password."
  end

  test "mediocre - only numbers, 8 or more characters" do
    assert_io "12345678", "The password '12345678' is a mediocre password."
    assert_io "4521414314432423", "The password '4521414314432423' is a mediocre password."
  end

  test "strong - letters and at least one number, 8 or more characters" do
    assert_io "MoreThan8Characters", "The password 'MoreThan8Characters' is a strong password."
    assert_io "AndItContainsSomeNumbers81", "The password 'AndItContainsSomeNumbers81' is a strong password."
    assert_io "3211AndSomeText", "The password '3211AndSomeText' is a strong password."
  end

  test "very strong - letters, numbers, and special characters, 8 or more characters" do
    assert_io "Super$8Strong(", "The password 'Super$8Strong(' is a very strong password."
    assert_io "This@is9Amazing!`23Yup", "The password 'This@is9Amazing!`23Yup' is a very strong password."
  end

end
