
USE  supodcast_db;

CREATE TABLE Pod_has_Ep (
pod_name VARCHAR(100),
ep_id int,
PRIMARY KEY (pod_name,ep_id),
FOREIGN KEY (pod_name) REFERENCES PODCASTS(pod_name),
FOREIGN KEY (ep_id) REFERENCES EPISODES(ep_id)

);