## Setup
- have elixir/erlang and python installed
- install natural language toolkit by running ```pip install nltk ```
- run ```mix deps.get```

## Usage
start a mix shell by running ```iex -S mix``` and enter the command ```Kgb.mckaig_top_three()```, kicking off the following process:

- The scraper goes to get the reviews for Mckaig dealership
- Reviews are stored in state in the genserver
- Once the first 5 pages have been scraped and parsed, NLTK is used to perform sentimenet analysis on the reviews
- Reviews are sorted by positive score
- The 3 reviews with the highest postive score are outputed to the console along with their associated score

output will looks something like this: 

Top 3 overly positive endorsements: [
  %{
    'positive_score' => 0.678,
    'review' => 'OMG the best thank you I love you so much!!!  Would you marry my cousin so we can be in the same family?'
  },
  %{
    'positive_score' => 0.234,
    'review' => 'Pretty good, my expectations were met'
  },
  %{
    'positive_score' => -0.467,
    'review' => 'You suck!  I rue the day that we met and curse your name henceforth forever more'
  }
]

## Usage







