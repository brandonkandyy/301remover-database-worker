defmodule DatabaseWorkerTest do
  use ExUnit.Case
  doctest DatabaseWorker

  test "greets the world" do
    assert DatabaseWorker.hello() == :world
  end
end
