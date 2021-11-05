defmodule Mckaig do
  use Crawly.Spider

  alias Kgb.Cache

  @pages 1..5

  @impl Crawly.Spider
  def base_url(),
    do:
      "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/"

  @impl Crawly.Spider
  def init() do
    [start_urls: mckaig_urls()]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    {:ok, document} = Floki.parse_document(response.body)

    # finds all the reviews on the page and parses them
    reviews =
      document
      |> Floki.find("p.review-content")
      |> extract_reviews()

    # stores the reviews in the genserver
    Cache.add_reviews(reviews)

    %Crawly.ParsedItem{:items => [%{reviews: reviews}], :requests => []}
  end

  def start_spider() do
    Crawly.Engine.start_spider(__MODULE__)
  end

  defp extract_reviews(list) do
    list
    |> Enum.map(&elem(&1, 2))
    |> List.flatten()
  end

  defp mckaig_urls() do
    Enum.map(@pages, &make_url/1)
  end

  defp make_url(page) do
    "#{base_url()}page#{page}"
  end
end
