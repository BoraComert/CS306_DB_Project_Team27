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

pod_name VARCHAR(100),
category_name VARCHAR(100),
PRIMARY KEY (pod_name,category_name),
FOREIGN KEY (pod_name) REFERENCES PODCASTS(pod_name),
FOREIGN KEY (category_name) REFERENCES CATEGORIES(category_name)


);

CREATE TABLE Ep_Hosted_by_Host (
ep_id int,
host_name VARCHAR(50),
PRIMARY KEY (ep_id,host_name),
FOREIGN KEY (ep_id) REFERENCES EPISODES(ep_id),
FOREIGN KEY (host_name) REFERENCES HOSTS(host_name)

);

CREATE TABLE Ep_Added_to_UserPlaylist (
ep_id int,
user_playlistName VARCHAR(100),
user_id int,
PRIMARY KEY (ep_id,user_id),
FOREIGN KEY (ep_id) REFERENCES EPISODES(ep_id)
ON DELETE CASCADE 
ON UPDATE CASCADE,
FOREIGN KEY (user_id) REFERENCES USERPLAYLISTS(user_id)
ON DELETE NO ACTION
ON UPDATE CASCADE
);

CREATE TABLE Ep_Has_Review (
ep_id int,
review_id int,
PRIMARY KEY (ep_id,review_id),
FOREIGN KEY (ep_id) REFERENCES EPISODES(ep_id)
ON DELETE CASCADE 
ON UPDATE CASCADE,
FOREIGN KEY (review_id) REFERENCES REVIEWS(review_id)
ON DELETE NO ACTION
ON UPDATE CASCADE
);


