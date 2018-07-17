defmodule HydrusTest do
  use ExUnit.Case
  doctest Hydrus

  test "greets the world" do
    assert Hydrus.hello() == :world
  end
end
