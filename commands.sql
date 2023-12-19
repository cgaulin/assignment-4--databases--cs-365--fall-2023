-- CONCAT Command
SELECT CONCAT(artist_name, " recorded ", album_name) AS Recording FROM compiles;

-- Nested query command showing table with artist name and album name
SELECT artist_name, album_name FROM artist JOIN album ON artist.artist_id = 
album.artist_id WHERE artist.artist_id IN (SELECT album.artist_id FROM album);

-- Shows all albums created by artists
SELECT * FROM compiles;

--Shows all tracks belonging to every album
SELECT * FROM contains;

--Shows all played tracks
SELECT * FROM played;