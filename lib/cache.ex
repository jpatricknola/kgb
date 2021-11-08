defmodule Kgb.Cache do
  use GenServer

  # Callbacks

  @impl true
  def init(_) do
    {:ok, %{reviews: [], pages: 0}}
  end

  @impl true
  def handle_cast({:add_reviews, reviews}, state) do
    reviews = Map.get(state, :reviews, []) ++ reviews
    pages = Map.get(state, :pages, 0) + 1

    new_state = %{
      reviews: reviews,
      pages: pages
    }

    if pages == 5 do
      Kgb.SentimentAnalysis.print_scores(reviews)
    end

    {:noreply, new_state}
  end

  def add_reviews(reviews) do
    GenServer.cast(:cache, {:add_reviews, reviews})
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: :cache)
  end
end
