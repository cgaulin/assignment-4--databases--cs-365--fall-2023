CREATE TABLE IF NOT EXISTS artist (
  artist_id   INT          NOT NULL,
  artist_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (artist_id),
  INDEX  artist_index (artist_id)
);


CREATE TABLE IF NOT EXISTS compiles ( 
  artist_name  VARCHAR(128)          REFERENCES artist(artist_name),
  album_name   VARCHAR(128)          REFERENCES album(album_name)
);


CREATE TABLE IF NOT EXISTS album (
  artist_id  INT          REFERENCES artist(artist_id),
  album_id   INT          NOT NULL,
  album_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (album_id, album_name),
  FOREIGN KEY (artist_id)   REFERENCES artist (artist_id),
  INDEX album_index (artist_id, album_id)
);


CREATE TABLE IF NOT EXISTS contains (
  album_name  VARCHAR(128)          REFERENCES album(album_name),
  track_name  VARCHAR(128)          REFERENCES track(track_name)
);


CREATE TABLE IF NOT EXISTS track (
  artist_id  INT          REFERENCES artist(artist_id),
  album_id   INT          REFERENCES album(album_id),
  track_id   INT          NOT NULL,
  track_name VARCHAR(128) NOT NULL,
  time       DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (artist_id, album_id, track_id),
  FOREIGN KEY (artist_id, album_id) REFERENCES album (artist_id, album_id),
  INDEX track_index (artist_id, album_id, track_id)

);


CREATE TABLE IF NOT EXISTS played (
  track_name VARCHAR(128)  REFERENCES contains(track_name),
  played     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (played)
);
