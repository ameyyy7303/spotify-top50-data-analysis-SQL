
```sql 
    CREATE TABLE SpotifyTop50 (
    id SERIAL PRIMARY KEY,
    artist_name VARCHAR(255),
    track_name VARCHAR(255),
    track_id VARCHAR(50),
    popularity INT,
    danceability FLOAT,
    energy FLOAT,
    key INT,
    loudness FLOAT,
    mode INT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_ms INT,
    time_signature INT
);
``` 

```sql 
COPY SpotifyTop50(id,artist_name,track_name,track_id,popularity,danceability,energy,key,loudness,mode,speechiness,acousticness,instrumentalness,liveness,valence,tempo,duration_ms,time_signature)
FROM 'C:\path\to\csv.csv'
CSV HEADER;
```

```sql
SELECT * FROM spotifytop50
```

--What is the average danceability by artist? 

```sql
SELECT artist_name, avg(danceability) as average_danceability
FROM spotifytop50
GROUP BY artist_name
ORDER BY average_danceability DESC; 
```

--Who are the top 10 artists based on popularity, and what are their tracks' average danceability and energy?
	
```sql
SELECT artist_name, AVG(popularity) AS avg_popularity, AVG(danceability) AS avg_danceability, AVG(energy) AS avg_energy
FROM spotifytop50
GROUP BY artist_name
ORDER BY AVG(popularity) DESC
LIMIT 10
```

--What artist released the longest song?

```sql
SELECT artist_name, duration_ms FROM spotifytop50
ORDER BY duration_ms DESC
LIMIT 1
```

--What is the average danceability of the top 12 most popular songs?

```sql
SELECT AVG(danceability) 
FROM spotifytop50
WHERE track_id IN (
	SELECT track_id FROM spotifytop50
	ORDER BY popularity DESC 
	LIMIT 12
	)
```

--In what key is each track from the dataset?

--Using pitch-class integer notation: https://smbutterfield.github.io/ibmt17-18/22-intro-to-non-diatonic-materials/b2-tx-pcintnotation.html

```sql
SELECT track_name,
		CASE
           WHEN key = 0 AND mode = 1 THEN 'C Major'
           WHEN key = 1 AND mode = 1 THEN 'C# Major'
           WHEN key = 2 AND mode = 1 THEN 'D Major'
           WHEN key = 3 AND mode = 1 THEN 'D# Major'
           WHEN key = 4 AND mode = 1 THEN 'E Major'
           WHEN key = 5 AND mode = 1 THEN 'F Major'
           WHEN key = 6 AND mode = 1 THEN 'F# Major'
           WHEN key = 7 AND mode = 1 THEN 'G Major'
           WHEN key = 8 AND mode = 1 THEN 'G# Major'
           WHEN key = 9 AND mode = 1 THEN 'A Major'
           WHEN key = 10 AND mode = 1 THEN 'A# Major'
           WHEN key = 11 AND mode = 1 THEN 'B Major'
           WHEN key = 0 AND mode = 0 THEN 'C Minor'
           WHEN key = 1 AND mode = 0 THEN 'C# Minor'
           WHEN key = 2 AND mode = 0 THEN 'D Minor'
           WHEN key = 3 AND mode = 0 THEN 'D# Minor'
           WHEN key = 4 AND mode = 0 THEN 'E Minor'
           WHEN key = 5 AND mode = 0 THEN 'F Minor'
           WHEN key = 6 AND mode = 0 THEN 'F# Minor'
           WHEN key = 7 AND mode = 0 THEN 'G Minor'
           WHEN key = 8 AND mode = 0 THEN 'G# Minor'
           WHEN key = 9 AND mode = 0 THEN 'A Minor'
           WHEN key = 10 AND mode = 0 THEN 'A# Minor'
           WHEN key = 11 AND mode = 0 THEN 'B Minor'
           ELSE 'Unknown'
       END AS musical_key
FROM spotifytop50;
```

--Further questions exist on the 'musical_key' column itselft so adding the entire column to the table 

```sql
ALTER TABLE spotifytop50
ADD COLUMN musical_key VARCHAR(50);
UPDATE spotifytop50
SET musical_key = CASE
    WHEN key = 0 AND mode = 1 THEN 'C Major'
    WHEN key = 1 AND mode = 1 THEN 'C# Major'
    WHEN key = 2 AND mode = 1 THEN 'D Major'
    WHEN key = 3 AND mode = 1 THEN 'D# Major'
    WHEN key = 4 AND mode = 1 THEN 'E Major'
    WHEN key = 5 AND mode = 1 THEN 'F Major'
    WHEN key = 6 AND mode = 1 THEN 'F# Major'
    WHEN key = 7 AND mode = 1 THEN 'G Major'
    WHEN key = 8 AND mode = 1 THEN 'G# Major'
    WHEN key = 9 AND mode = 1 THEN 'A Major'
    WHEN key = 10 AND mode = 1 THEN 'A# Major'
    WHEN key = 11 AND mode = 1 THEN 'B Major'
    WHEN key = 0 AND mode = 0 THEN 'C Minor'
    WHEN key = 1 AND mode = 0 THEN 'C# Minor'
    WHEN key = 2 AND mode = 0 THEN 'D Minor'
    WHEN key = 3 AND mode = 0 THEN 'D# Minor'
    WHEN key = 4 AND mode = 0 THEN 'E Minor'
    WHEN key = 5 AND mode = 0 THEN 'F Minor'
    WHEN key = 6 AND mode = 0 THEN 'F# Minor'
    WHEN key = 7 AND mode = 0 THEN 'G Minor'
    WHEN key = 8 AND mode = 0 THEN 'G# Minor'
    WHEN key = 9 AND mode = 0 THEN 'A Minor'
    WHEN key = 10 AND mode = 0 THEN 'A# Minor'
    WHEN key = 11 AND mode = 0 THEN 'B Minor'
    ELSE 'Unknown'
END;
```
--What are the most common song keys for the 12 most popular songs?

```sql
SELECT musical_key, COUNT(musical_key) AS count_music_key
FROM spotifytop50
WHERE track_id in (
					SELECT track_id 
					FROM spotifytop50
					ORDER BY popularity DESC
					LIMIT 12
					)
GROUP BY musical_key
ORDER BY count_music_key DESC 
```

--What are the most common song keys for the entire dataset?

```sql
SELECT musical_key, COUNT(musical_key) AS count_music_key
FROM spotifytop50
GROUP BY musical_key
ORDER BY count_music_key DESC 
```

--Create a table with the popularity rankings for each song key.

```sql
INSERT INTO key_popularity_rankings (musical_key, track_name, popularity, rank)
SELECT musical_key, track_name, popularity,
       RANK() OVER (PARTITION BY musical_key ORDER BY popularity DESC) AS rank
FROM spotifytop50;

SELECT * FROM key_popularity_rankings;
```

--Rank the song keys in the dataset by popularity.

```sql
SELECT musical_key,
       AVG(popularity) AS avg_popularity,
       RANK() OVER (ORDER BY AVG(popularity) DESC) AS key_rank
FROM spotifytop50
GROUP BY musical_key;
```

--Compare the most popular song keys with song keys most represented in the top 50 tracks of 2021.

```sql
WITH key_popularity AS (
    SELECT musical_key,
           AVG(popularity) AS avg_popularity
    FROM spotifytop50
    GROUP BY musical_key
),
key_representation AS (
    SELECT musical_key,
           COUNT(*) AS representation_count
    FROM spotifytop50
    GROUP BY musical_key
)
SELECT k.musical_key,
       k.avg_popularity,
       r.representation_count
FROM key_popularity k
LEFT JOIN key_representation r
ON k.musical_key = r.musical_key
ORDER BY k.avg_popularity DESC, r.representation_count DESC;
```

--- Explanation:
CTE key_popularity:

Calculates the average popularity for each musical key across the entire dataset.
AVG(popularity) gives the average popularity score for each key.
CTE key_representation:

Counts how many times each musical key appears in the dataset.
COUNT(*) provides the number of occurrences for each key.
Main Query:

Joins the two CTEs (key_popularity and key_representation) to combine the average popularity with the representation count for each musical key.
Orders the results by avg_popularity and representation_count in descending order to compare popularity and frequency.
This query gives you a comprehensive view of how each musical key ranks in terms of average popularity and how frequently it appears among the top 50 tracks.

-- --Calculate the average popularity for the artists in the Spotify data table. Then, for every artist with an average popularity of 90 or above, show their name, their average popularity, and label them as a “Top Star."

```sql
WITH artist_popularity AS (
    SELECT artist_name,
           AVG(popularity) AS avg_popularity
    FROM spotifytop50
    GROUP BY artist_name
)
SELECT artist_name,
       avg_popularity,
       CASE
           WHEN avg_popularity >= 90 THEN 'Top Star'
           ELSE 'Regular Artist'
       END AS artist_label
FROM artist_popularity
WHERE avg_popularity >= 90
ORDER BY avg_popularity DESC;
```
