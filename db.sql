

CREATE DATABASE supodcast_db;

USE supodcast_db;



CREATE TABLE PODCASTS(
pod_name VARCHAR(100),
PRIMARY KEY (pod_name),
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
review_id int ,
review_star int
);
CREATE TABLE HOSTS (
host_name VARCHAR(50),
PRIMARY KEY (host_name),
host_country VARCHAR(50),
host_organization VARCHAR(100)
);

CREATE TABLE USERPLAYLISTS(
user_id int,
PRIMARY KEY (user_id),
user_name VARCHAR(50),
user_playlistName VARCHAR(100)
);

