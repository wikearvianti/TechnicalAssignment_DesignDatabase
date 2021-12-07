 create database music_streaming;

 use music_streaming;

 mysql> create table user(
    -> user_id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    -> name varchar(50) not null,
    -> email varchar(255) not null unique,
    -> password varchar(50) not null
    -> );

mysql> create table singer(
    -> singer_id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    -> name varchar(50) NOT NULL
    -> );

mysql> create table album(
    -> album_id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    -> name varchar(50) NOT NULL,
    -> singer_id int NOT NULL,
    -> constraint fk_singer_id foreign key(singer_id) references singer(singer_id)
    -> );

mysql> create table track(
    -> track_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    -> title varchar(50) NOT NULL,
    ->  singer_id int NOT NULL,
    -> album_id int NOT NULL,
    -> constraint fk_album FOREIGN KEY(singer_id) references singer(singer_id),
    -> constraint fk_singer FOREIGN KEY(album_id) REFERENCES album(album_id)
    -> );

mysql> create table playlist(
    -> playlist_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    -> user_id int NOT NULL,
    -> tracks int NOT NULL,
    -> constraint fk_user FOREIGN KEY(user_id) REFERENCES user(user_id)
    -> );

mysql> create table track_playlist(
    -> track_id int NOT NULL,
    -> playlist_id int NOT NULL,
    -> constraint fk_track FOREIGN KEY(track_id) REFERENCES track(track_id),
    -> constraint fk_playlist FOREIGN KEY(playlist_id) REFERENCES playlist(playlist_id)
    -> );