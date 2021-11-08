defmodule Kgb.CacheTest do
  use ExUnit.Case, async: true

  alias Kgb.Cache

  test "adds reviews and increments page count" do
    inital_state = %{pages: 0, reviews: []}
    reviews = ["good job!", "great job!", "adequate job"]
    {:noreply, new_state} = Cache.handle_cast({:add_reviews, reviews}, inital_state)
    assert new_state == %{pages: 1, reviews: reviews}

    more_reviews = ["i liked it", "actually nevermind i didn't like it"]

    {:noreply, new_state} = Cache.handle_cast({:add_reviews, more_reviews}, new_state)

    assert new_state == %{pages: 2, reviews: reviews ++ more_reviews}
  end
end
