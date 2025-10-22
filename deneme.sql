-- =====================================================
-- CLEAN AND CORRECTED PODCAST DATABASE SCHEMA
-- =====================================================

DROP DATABASE IF EXISTS supodcast_db;
CREATE DATABASE supodcast_db;
USE supodcast_db;

-- =====================================================
-- MAIN ENTITIES
-- =====================================================

CREATE TABLE PODCASTS (
    pod_id INT AUTO_INCREMENT PRIMARY KEY,
    pod_name VARCHAR(100) NOT NULL UNIQUE,
    pod_description VARCHAR(255),
    pod_episodeNum INT DEFAULT 0
);

CREATE TABLE CATEGORIES (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    category_description VARCHAR(200)
);

CREATE TABLE HOSTS (
    host_id INT AUTO_INCREMENT PRIMARY KEY,
    host_name VARCHAR(100) NOT NULL UNIQUE,
    host_country VARCHAR(50)
);

CREATE TABLE USERPLAYLISTS (
    user_playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_playlistName VARCHAR(100) NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT u_user_playlist UNIQUE (user_id, user_playlistName)
);

CREATE TABLE EPISODES (
    ep_id INT AUTO_INCREMENT PRIMARY KEY,
    ep_name VARCHAR(100) NOT NULL,
    ep_duration INT,
    pod_id INT NOT NULL,
    FOREIGN KEY (pod_id) REFERENCES PODCASTS(pod_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE REVIEWS (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    ep_id INT NOT NULL,
    review_star INT CHECK (review_star BETWEEN 1 AND 5),
    review_comment VARCHAR(200),
    FOREIGN KEY (ep_id) REFERENCES EPISODES(ep_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =====================================================
-- RELATION TABLES (MANY-TO-MANY)
-- =====================================================

-- A podcast can belong to many categories; a category can contain many podcasts
CREATE TABLE Pod_Belongs_to_Cat (
    pod_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (pod_id, category_id),
    FOREIGN KEY (pod_id) REFERENCES PODCASTS(pod_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES CATEGORIES(category_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- An episode can have multiple hosts; a host can host multiple episodes
CREATE TABLE Ep_Hosted_by_Host (
    ep_id INT NOT NULL,
    host_id INT NOT NULL,
    PRIMARY KEY (ep_id, host_id),
    FOREIGN KEY (ep_id) REFERENCES EPISODES(ep_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (host_id) REFERENCES HOSTS(host_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- A user playlist can contain many episodes; an episode can appear in many playlists
CREATE TABLE Ep_Added_to_UserPlaylist (
    ep_id INT NOT NULL,
    user_playlist_id INT NOT NULL,
    PRIMARY KEY (user_playlist_id, ep_id),
    FOREIGN KEY (ep_id) REFERENCES EPISODES(ep_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (user_playlist_id) REFERENCES USERPLAYLISTS(user_playlist_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =====================================================
-- OPTIONAL TRIGGER: AUTO-INCREMENT PODCAST EPISODE COUNT
-- =====================================================

DELIMITER $$
CREATE TRIGGER update_podcast_episode_count
AFTER INSERT ON EPISODES
FOR EACH ROW
BEGIN
    UPDATE PODCASTS
    SET pod_episodeNum = pod_episodeNum + 1
    WHERE pod_id = NEW.pod_id;
END$$
DELIMITER ;

-- =====================================================
-- TEST DATA (OPTIONAL)
-- =====================================================

INSERT INTO PODCASTS (pod_name, pod_description)
VALUES ('Tech Talks', 'Weekly tech discussions'),
       ('Health Hub', 'Health and fitness insights');

INSERT INTO CATEGORIES (category_name, category_description)
VALUES ('Technology', 'All about new tech'),
       ('Health', 'Wellbeing and lifestyle');

INSERT INTO HOSTS (host_name, host_country)
VALUES ('Alice', 'USA'),
       ('Bob', 'UK');

INSERT INTO USERPLAYLISTS (user_playlistName, user_id)
VALUES ('My Favorites', 1),
       ('Morning Drive', 2);

INSERT INTO EPISODES (ep_name, ep_duration, pod_id)
VALUES ('AI Revolution', 45, 1),
       ('Fitness Myths', 30, 2);

INSERT INTO REVIEWS (ep_id, review_star, review_comment)
VALUES (1, 5, 'Great insights!'),
       (2, 4, 'Helpful and motivating');

INSERT INTO Pod_Belongs_to_Cat (pod_id, category_id)
VALUES (1, 1),
       (2, 2);

INSERT INTO Ep_Hosted_by_Host (ep_id, host_id)
VALUES (1, 1),
       (2, 2);

INSERT INTO Ep_Added_to_UserPlaylist (ep_id, user_playlist_id)
VALUES (1, 1),
       (2, 2);
