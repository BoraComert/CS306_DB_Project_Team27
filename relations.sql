
USE  supodcast_db;

CREATE TABLE Pod_has_Ep (
pod_name VARCHAR(100),
ep_id int,
PRIMARY KEY (pod_name,ep_id),
FOREIGN KEY (pod_name) REFERENCES PODCASTS(pod_name),
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
host_name NOT NULL
);