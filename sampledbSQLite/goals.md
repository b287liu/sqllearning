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

