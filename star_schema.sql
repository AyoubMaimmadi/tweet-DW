-- Create the Time Dimension table
CREATE TABLE TimeDimension (
    tweet_created_key INT PRIMARY KEY,
    tweet_created DATETIME,
);

-- Create the Location Dimension table
CREATE TABLE LocationDimension (
    tweet_location_key INT PRIMARY KEY,
    tweet_location NVARCHAR(255),
);

-- Create the User Dimension table
CREATE TABLE UserDimension (
    user_key INT PRIMARY KEY,
    name NVARCHAR(255),
    user_timezone NVARCHAR(255),
);

-- Create the Airline Dimension table
CREATE TABLE AirlineDimension (
    airline_key INT PRIMARY KEY,
    airline NVARCHAR(255),
);

-- Create the Sentiment Dimension table
CREATE TABLE SentimentDimension (
    sentiment_key INT PRIMARY KEY,
    airline_sentiment NVARCHAR(255),
    negativereason NVARCHAR(255),
);

-- Create the Fact table (SentimentFact)
CREATE TABLE SentimentFact (
    tweet_id BIGINT PRIMARY KEY,
    tweet_created_key INT FOREIGN KEY REFERENCES TimeDimension(tweet_created_key),
    tweet_location_key INT FOREIGN KEY REFERENCES LocationDimension(tweet_location_key),
    user_key INT FOREIGN KEY REFERENCES UserDimension(user_key),
    airline_key INT FOREIGN KEY REFERENCES AirlineDimension(airline_key),
    sentiment_key INT FOREIGN KEY REFERENCES SentimentDimension(sentiment_key),
    airline_sentiment NVARCHAR(255),
    airline_sentiment_confidence FLOAT,
    negativereason NVARCHAR(255),
    negativereason_confidence FLOAT,
    retweet_count INT,
    text NVARCHAR(MAX)
);
