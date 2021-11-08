## Setup
- have elixir/erlang and python installed
- install natural language toolkit by running ```pip install nltk ```
- run ```mix deps.get```

## Usage
start a mix shell by running ```iex -S mix``` and enter the command ```Kgb.top_three```

- The scraper fetches reviews for the dealership
- Reviews are stored in state in the genserver
- Once the first 5 pages have been scraped and parsed, NLTK is used to perform sentimenet analysis on the reviews
- Reviews are sorted by positive score
- The 3 reviews with the highest postive score are printed to the console along with their associated score

output will looks something like this: 

              "TOP 3 POSTIVE REVIEWS" 
[
  %{
    'positive_score' => 0.678,
    'review' => 'OMG the best thank you I love you so much!!!  Please marry my cousin we can be in the same family?'
  },
  %{
    'positive_score' => 0.467,
    'review' => 'Pretty good, my expectations were met'
  },
  %{
    'positive_score' => 0.267,
    'review' => 'I'm not mad at yall'
  }
]

## Tests
run the testing suite with the command ```mix test```







