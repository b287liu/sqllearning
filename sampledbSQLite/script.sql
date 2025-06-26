SELECT Track.Name AS "Track", Album.Title AS "Album", Artist.Name AS "Artist", 
CASE
	WHEN (Track.Milliseconds/1000)%60 < 10 THEN CONCAT((Track.Milliseconds/60000), ":0", (Track.Milliseconds/1000)%60)
	ELSE CONCAT((Track.Milliseconds/60000), ":", (Track.Milliseconds/1000)%60)
END AS "Time", Genre.Name AS "Genre", Playlist.Name AS "Playlist"
FROM (((((Track
INNER JOIN PlaylistTrack
ON Track.TrackId = PlaylistTrack.TrackId)
INNER JOIN Playlist
ON PlaylistTrack.PlaylistId = Playlist.PlaylistId)
INNER JOIN Genre
ON Track.GenreId = Genre.GenreId)
INNER JOIN Album
ON Album.AlbumId = Track.AlbumId)
INNER JOIN Artist
ON Artist.ArtistId = Album.ArtistId)
