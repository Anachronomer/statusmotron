defmodule StatuslightFwTest do
  use ExUnit.Case
  doctest StatuslightFw

  test "greets the world" do
    assert StatuslightFw.hello() == :world
  end
end
