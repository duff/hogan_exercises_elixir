
defmodule PasswordValidation.B.Test do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "I never knew ye" do
    assert_login_failed("unknown person", "unknown password")
    assert_login_failed("Joe", "BogusJowPwd")
  end

  test "successful login" do
    assert_login_successful("Fred", "ValidFredPassword")
    assert_login_successful("Joe", "LegitJoePwd")
  end


  defp assert_login_successful(login, password) do
    assert captured(login, password) == "You may pass"
  end

  defp assert_login_failed(login, password) do
    assert captured(login, password) == "I never knew ye"
  end

  defp captured(username, password) do
    input = [username, password] |> Enum.join("\n")
    capture_io([input: input , capture_prompt: false], &PasswordValidation.B.go/0) |> String.strip
  end

end
