defmodule StatuslightControlTest do
  use ExUnit.Case
  doctest StatuslightControl

  test "greets the world" do
    assert StatuslightControl.hello() == :world
  end
end
