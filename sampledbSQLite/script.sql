SELECT Customer.FirstName, Customer.LastName, Track.Name AS "Track", Album.Title AS "Album", 
Artist.Name AS "Artist", Genre.Name AS "Genre", MediaType.Name AS "Format", 
InvoiceLine.UnitPrice, InvoiceLine.Quantity
FROM (((((((Invoice
INNER JOIN InvoiceLine 
ON Invoice.InvoiceId = InvoiceLine.InvoiceId)
INNER JOIN Customer
ON Invoice.CustomerId = Customer.CustomerId)
INNER JOIN Track
ON InvoiceLine.TrackId = Track.TrackId)
INNER JOIN Album
ON Album.AlbumId = Track.AlbumId)
INNER JOIN Artist
ON Album.ArtistId = Artist.ArtistId)
INNER JOIN MediaType
ON Track.MediaTypeId = MediaType.MediaTypeId)
INNER JOIN Genre
ON Track.GenreId = Genre.GenreId)
-- WHERE BillingCountry = "USA" AND MediaType.Name = "AAC audio file"
-- WHERE Quantity > 1
ORDER BY LastName
-- SELECT il.TrackId  FROM InvoiceLine il WHERE InvoiceId < 10
-- SELECT * FROM Customer



SELECT DISTINCT Name FROM MediaType

SELECT Name FROM Playlist

SELECT (Milliseconds/60000) AS "Minutes", (Milliseconds/1000)%60 AS "Seconds" FROM Track

SELECT 
CASE
	WHEN (Milliseconds/1000)%60 < 10 THEN CONCAT((Milliseconds/60000), ":0", (Milliseconds/1000)%60)
	ELSE CONCAT((Milliseconds/60000), ":", (Milliseconds/1000)%60)
END AS "Time" FROM Track

-- CONCAT((Milliseconds/60000), ":", (Milliseconds/1000)%60) AS "Time" FROM Track

SELECT Track.Name AS "Track", Artist.Name AS "Artist", 
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
