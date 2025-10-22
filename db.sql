

CREATE DATABASE supodcast_db;

USE supodcast_db;


CREATE TABLE PODCASTS(
pod_name VARCHAR(100),
pod_id INT,
PRIMARY KEY (pod_id),
pod_description VARCHAR(100)
);

CREATE TABLE CATEGORIES(
category_name VARCHAR(100),
PRIMARY KEY (category_name),
category_description VARCHAR(200)
);

CREATE TABLE EPISODES (
ep_duration int,
ep_name VARCHAR(100),
ep_id int,
PRIMARY KEY (ep_id)

);
CREATE TABLE REVIEWS (
review_comment VARCHAR(200),
PRIMARY KEY (review_id),
review_id int ,
review_star int
);
CREATE TABLE HOSTS (
host_name VARCHAR(50),
PRIMARY KEY (host_name),
host_country VARCHAR(50),
host_organization VARCHAR(100)
);

CREATE TABLE USERS(
user_id VARCHAR(100),
user_name VARCHAR(100),
PRIMARY KEY(user_id)
);

CREATE TABLE USERPLAYLISTS(
user_id varchar(100),

user_playlistName VARCHAR(100) NOT NULL,
user_playlist_id INT,
PRIMARY KEY(user_playlist_id),
FOREIGN KEY(user_id) references users(user_id)
);
