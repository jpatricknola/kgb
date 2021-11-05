defmodule Kgb do
  @moduledoc """
  Documentation for `Kgb`.
  """

  @doc """
    starts the web crawler to get 5 pages of reviews
  """
  def mckaig_top_three do
    Mckaig.start_spider()
    "Intializing scraping, please stand by..."
  end
end
