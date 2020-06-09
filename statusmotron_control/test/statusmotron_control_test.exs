defmodule StatusmotronControlTest do
  use ExUnit.Case
  doctest StatusmotronControl

  test "greets the world" do
    assert StatusmotronControl.hello() == :world
  end
end
