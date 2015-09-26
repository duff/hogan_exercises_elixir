defmodule KarvonenHeartRate.A.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &KarvonenHeartRate.A.go/0

  test "go" do
    assert_io [ 65, 22 ], ~r/55%       \|   138 bpm.*90%       \|   185 bpm/s
    assert_io [ 72, 44 ], ~r/60%       \|   134 bpm.*85%       \|   160 bpm/s
  end

end
