
defmodule PasswordValidation.B.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &PasswordValidation.A.go/0

  test "I never knew ye" do
    assert_login_failed("unknown person", "unknown password")
    assert_login_failed("Joe", "BogusJowPwd")
  end

  test "successful login" do
    assert_login_successful("Fred", "ValidFredPassword")
    assert_login_successful("Joe", "LegitJoePwd")
  end

  defp assert_login_successful(login, password) do
    assert_io [login, password], "You may pass"
  end

  defp assert_login_failed(login, password) do
    assert_io [login, password], "I never knew ye"
  end

end
