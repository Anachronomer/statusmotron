defmodule StatuslightControl.StatuslightTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  setup do
    #Maybe need to do this through supervision instead
    StatuslightControl.Statuslight.stop
    StatuslightControl.Statuslight.start_link(IORenderer)
    :ok
  end

  test "set_color" do
    assert capture_io(fn -> StatuslightControl.Statuslight.set_color("#FFFFFF") end) == "TODO"
  end
end
