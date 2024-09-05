# spotify-top50-data-analysis-SQL
SQL analysis of the Spotify Top 50 dataset, including metrics on danceability, popularity, song keys, and artist rankings.<br>

--Dataset: Spotify top 50 songs in 2021 <br>
--Source: [Kaggle] https://www.kaggle.com/datasets/equinxx/spotify-top-50-songs-in-2021 <br>
--Queried using: PostgreSQL<br>


## Project Overview
This project involves analyzing the Spotify Top 50 dataset from 2021 to gain insights into various musical attributes. The dataset includes attributes such as artist name, track name, popularity, danceability, energy, and musical key. The analysis focuses on deriving meaningful insights through SQL queries, including: <br>

-Determining the average danceability of tracks by artist to understand which artists produce more danceable music.<br>
-Identifying the top 10 artists based on their overall popularity and evaluating the average danceability and energy of their tracks.<br>
-Finding the artist who released the longest song to explore extremes in song length.<br>
-Calculating the average danceability of the top 12 most popular songs to see how danceability correlates with popularity.v
-Analyzing the distribution of musical keys across the dataset to identify common keys and their popularity.<br>
-Ranking musical keys by their popularity to determine which keys are most favored in the top 50 tracks.<br>
-Comparing the popularity of musical keys with their frequency of representation in the dataset to understand which keys are both popular and commonly used.<br>
## Dataset
The dataset used in this project is the Spotify Top 50 from 2021. It includes the following columns:<br>

-id: Unique identifier for the track<br>
-artist_name: Name of the artist<br>
-track_name: Name of the trackv
-track_id: Unique identifier for the track<br>
-popularity: Popularity score of the track<br>
-danceability: Danceability score of the track<br>
-energy: Energy score of the track<br>
-key: Musical key (using pitch-class integer notation)<br>
-loudness: Loudness score of the track<br>
-mode: Mode of the track (Major/Minor)<br>
-speechiness: Speechiness score of the track<br>
-acousticness: Acousticness score of the track<br>
-instrumentalness: Instrumentalness score of the track<br>
-liveness: Liveness score of the track<br>
-valence: Valence score of the track<br>
-tempo: Tempo of the track<br>
-duration_ms: Duration of the track in milliseconds<br>
-time_signature: Time signature of the track<br>
This analysis provides valuable insights into the characteristics of popular music tracks and the trends within the Spotify Top 50 charts for 2021.
