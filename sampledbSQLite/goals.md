# Objective
Starting with the sample database from DBeaver Community Edition, develop useful, legible tables and insights.
## The Sample Database
The sample database is the Chinook database written in SQLite. Details of the Chinook database can be found [here.](https://github.com/lerocha/chinook-database)
## Preliminary Data Querying
We begin with something simple. Produce a table with basic track details.
```
SELECT Track.Name AS "Track", Album.Title AS "Album", Artist.Name AS "Artist"
FROM ((Track
INNER JOIN Album
ON Track.AlbumId = Album.AlbumId)
INNER JOIN Artist
ON Album.ArtistId = Artist.ArtistId)
```

Now, consider adding the duration of each track. Since the time is given by the `Milliseconds` column, to convert it to a more readable time (i.e. `mm:ss`), we might consider the following: 
```
CONCAT(Milliseconds/60000, ":", (Milliseconds/1000)%60)
```
However, if we have a time of say 1000ms, then this command produces 0:1, which is not normally read as a time. To fix this, we add a simple case:
```
CASE
	WHEN (Track.Milliseconds/1000)%60 < 10 THEN CONCAT((Track.Milliseconds/60000), ":0", (Track.Milliseconds/1000)%60)
	ELSE CONCAT((Track.Milliseconds/60000), ":", (Track.Milliseconds/1000)%60)
END
```
This fixes the readability of the time, and we can add it to the query, aliasing it as "Time".


