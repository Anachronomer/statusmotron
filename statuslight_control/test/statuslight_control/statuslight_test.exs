defmodule StatuslightControl.StatuslightGenserverTest do
  use ExUnit.Case
  alias StatuslightControl.Statuslight

  test "current_color" do
    :sys.replace_state(Statuslight, fn _ -> %{color: "green"} end)
    assert Statuslight.current_color() == "green"
  end

  test "set_color" do
    Statuslight.set_color("#FFFFFF")
    assert :sys.get_state(Statuslight) == %{color: "#FFFFFF"}
  end
end
