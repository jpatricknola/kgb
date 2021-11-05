def generate_scores(reviews):
    import nltk

    nltk.downloader.download('vader_lexicon')
    nltk.downloader.download('punkt')

    from nltk.sentiment.vader import SentimentIntensityAnalyzer

    sid = SentimentIntensityAnalyzer()
    data = []

    for review in reviews:
        review = review.decode('utf-8')
        polarity_score = sid.polarity_scores(review)
        data.append({'review': review, 'positive_score': polarity_score.get('pos', 0)})
    
    return data




