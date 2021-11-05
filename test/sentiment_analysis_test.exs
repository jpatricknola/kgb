defmodule Kgb.SentimentAnalysisTest do
  use ExUnit.Case

  test "get_top_3_scores" do
    reviews = [
      "hated it",
      "loved it",
      "neutal about it",
      "You suck!  I rue the day that we met and curse your name henceforth forever more",
      "total waste of time",
      "it was kind of good",
      "super awesome!"
    ]

    top_reviews = Kgb.SentimentAnalysis.get_top_3_scores(reviews)

    assert top_reviews ==
             [
               %{'positive_score' => 1.0, 'review' => 'super awesome!'},
               %{'positive_score' => 0.796, 'review' => 'loved it'},
               %{'positive_score' => 0.395, 'review' => 'it was kind of good'}
             ]
  end
end
