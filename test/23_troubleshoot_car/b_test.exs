defmodule TroubleshootCar.B.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &TroubleshootCar.B.go/0

  test "only accepts y or n" do
    assert_io ~w(abc y y), ~r/Invalid entry of abc.*Clean terminals/s
  end

  test "go" do
    assert_io ~w(y y), "Clean terminals and try starting again."
    assert_io ~w(y n), "Replace cables and try again."
    assert_io ~w(n y), "Replace the battery."

    assert_io ~w(n n y), "Check spark plug connections."

    assert_io ~w(n n n n), "I have no clue.  Perhaps give the car away now."

    assert_io ~w(n n n y y), "Get it in for service."
    assert_io ~w(n n n y n), "Check to ensure the choke is opening and closing."
  end

end
