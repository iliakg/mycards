defmodule MycardsBackendTest do
  use ExUnit.Case
  doctest MycardsBackend

  test "greets the world" do
    assert MycardsBackend.hello() == :world
  end
end
