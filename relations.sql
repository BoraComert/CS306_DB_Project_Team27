USE  supodcast_db;



CREATE TABLE Pod_has_Ep (
pod_name VARCHAR(100),
pod_id INT,
ep_id int,
PRIMARY KEY (pod_id,ep_id),
FOREIGN KEY (pod_id) REFERENCES PODCASTS(pod_id),
FOREIGN KEY (ep_id) REFERENCES EPISODES(ep_id)

);


CREATE TABLE Pod_Belongs_to_Cat (

pod_id INT,
category_name VARCHAR(100),
PRIMARY KEY (pod_id,category_name),
FOREIGN KEY (pod_id) REFERENCES PODCASTS(pod_id),
FOREIGN KEY (category_name) REFERENCES CATEGORIES(category_name)


);


CREATE TABLE Ep_Hosted_by_Host (
ep_id INT,
host_id INT,
PRIMARY KEY (ep_id,host_id),
FOREIGN KEY (ep_id) REFERENCES EPISODES(ep_id),
FOREIGN KEY (host_id) REFERENCES HOSTS(host_id)

);

CREATE TABLE Ep_Added_to_UserPlaylist (
ep_id int,
user_playlist_id INT,
PRIMARY KEY (user_playlist_id, ep_id),
FOREIGN KEY (ep_id) REFERENCES EPISODES(ep_id)
ON DELETE CASCADE 
ON UPDATE CASCADE,
FOREIGN KEY (user_playlist_id) REFERENCES USERPLAYLISTS(user_playlist_id)
ON DELETE NO ACTION
ON UPDATE CASCADE
);



