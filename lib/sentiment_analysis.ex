defmodule Kgb.SentimentAnalysis do
  alias Kgb.PythonHelper

  @doc """
    accepts a list of strings, scores them using NTLK Sentiment Analysis,
    prints a list of maps containing the top 3 reviews with their associated scores

  ## Example
      iex> SentimentAnalysis.get_top_3_scores(["love it", ...])
      Top 3 overly positive endorsements:
        [
          %{
            'positive_score' => 0.678,
            'review' => 'love it'
          }, ...
        ]

  """
  def get_top_3_scores(reviews) do
    call_python(:sentiment_analysis, :generate_scores, [reviews])
    |> Enum.sort(&(&1['positive_score'] >= &2['positive_score']))
    |> Enum.take(3)
  end

  def print_scores(reviews) do
    scores = get_top_3_scores(reviews)

    IO.inspect("TOP 3 POSTIVE REVIEWS")
    IO.inspect(scores)
  end

  # wrapper function to call python functions using default python instance
  defp call_python(module, function, args) do
    default_instance = PythonHelper.python_instance(to_charlist("./python"))

    PythonHelper.call_python(default_instance, module, function, args)
  end
end
