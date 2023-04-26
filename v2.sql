CREATE TABLE songs (
    song_id INT PRIMARY KEY,
    title VARCHAR(255),
    artist_id INT,
    duration INT,
    is_explicit BOOLEAN,
    cloud_link VARCHAR(255),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE artists (
    artist_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    date_of_birth DATE
);

CREATE TABLE genres (
    genre_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE song_genres (
    song_id INT,
    genre_id INT,
    FOREIGN KEY (song_id) REFERENCES songs(song_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
    PRIMARY KEY (song_id, genre_id)
);

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    password VARCHAR(255),
    account_type VARCHAR(255)
);

CREATE TABLE user_favorites (
    user_id INT,
    song_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id),
    PRIMARY KEY (user_id, song_id)
);

CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE playlist_songs (
    playlist_id INT,
    song_id INT,
    song_order INT,
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id),
    PRIMARY KEY (playlist_id, song_id)
);

CREATE TABLE user_playlists (
    user_id INT,
    playlist_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    PRIMARY KEY (user_id, playlist_id)
);
