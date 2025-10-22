USE supodcast_db;

-- PODCASTS
INSERT INTO PODCASTS (pod_id, pod_name, pod_description) VALUES
(1, 'Tedx', 'people talks'),
(2, 'biology in science', 'biology talks'),
(3, 'artificial intelligence', 'ai is rising people'),
(4, 'konuşanlar', 'hasan can polat'),
(5, 'demon slayer', 'mükemmel anime'),
(6, 'musicians', 'playing music'),
(7, 'gamers', 'playing games bro'),
(8, 'Economy conference', 'stock exchange info '),
(9, 'inspiring talks', 'people talks about their lives'),
(10, 'fight club', 'first rule!');

-- CATEGORIES
INSERT INTO CATEGORIES (category_name, category_description) VALUES
('tech', 'technological films'),
('pyschology', 'about humans behaviours'),
('mental_health', 'peoples mental health'),
('feminism', 'female rights'),
('horror', 'scary films'),
('scary', 'horror films'),
('Sci-fi', 'scientific flms'),
('violation', 'violational films'),
('drama', 'there are dramas'),
('funny', 'makes people laugh (hahaha)');

-- HOSTS
INSERT INTO HOSTS (host_id, host_name, host_country, host_organization) VALUES
(1, 'bekir can', 'amerika', 'şirket1'),
(2, 'Bora cömret', 'ingiltere', 'şirket2'),
(3, 'Arda karayel', 'kanada', 'şirket4'),
(4, 'hasan ahmet', 'almanya', 'holding1'),
(5, 'miray santos', 'almanya', 'holding2'),
(6, 'muhammed lana', 'türkiye', 'yurtdışışirket2'),
(7, 'el habibi', 'türkiye', 'şirket'),
(8, 'johny bravo', 'türkiye', 'limited.as'),
(9, 'can günahlar', 'türkiye', 'girişimci'),
(10, 'label c5', 'türkiye', 'şirketler');

-- USERS
INSERT INTO USERS (user_id, user_name) VALUES
(1, 'bora'),
(2, 'bekir'),
(3, 'Ali'),
(4, 'muz'),
(5, 'usernamee'),
(6, 'nameuser'),
(7, 'broa'),
(8, 'bekiro'),
(9, 'borsa'),
(10, 'playlistuser');

-- USERPLAYLISTS
INSERT INTO USERPLAYLISTS (user_playlist_id, user_playlistName, user_id) VALUES
(1, 'Morning Motivation', 1),
(2, 'Evening Relax', 2),
(3, 'Focus Time', 3),
(4, 'Study Mix', 4),
(5, 'Travel Talks', 5),
(6, 'Workout Energy', 6),
(7, 'Weekend Chill', 7),
(8, 'Daily News', 8),
(9, 'Bedtime Vibes', 9),
(10, 'Pod Highlights', 10);

-- EPISODES
INSERT INTO EPISODES (ep_id, ep_name, ep_duration, pod_id) VALUES
(1, 'AI in 2025', 45, 1),
(2, 'Quantum Computers', 40, 1),
(3, 'Cognitive Biases', 35, 2),
(4, 'Mental Health Tips', 50, 2),
(5, 'Yoga for Beginners', 30, 3),
(6, 'Nutrition Myths', 55, 3),
(7, 'World War II Insights', 60, 4),
(8, 'Ancient Civilizations', 48, 4),
(9, 'Oscar Predictions', 42, 5),
(10, 'Indie Films Review', 47, 5);

-- Pod_has_Ep
INSERT INTO Pod_has_Ep (pod_id, pod_name, ep_id) VALUES
(1, 'Tech Talks', 1),
(1, 'Tech Talks', 2),
(2, 'Mind Matters', 3),
(2, 'Mind Matters', 4),
(3, 'Health Vibes', 5),
(3, 'Health Vibes', 6),
(4, 'History Echoes', 7),
(4, 'History Echoes', 8),
(5, 'CineChat', 9),
(5, 'CineChat', 10);

-- Pod_Belongs_to_Cat
INSERT INTO Pod_Belongs_to_Cat (pod_id, category_name) VALUES
(1, 'Technology'),
(2, 'Psychology'),
(3, 'Health'),
(4, 'History'),
(5, 'Movies'),
(6, 'Music'),
(7, 'Science'),
(8, 'Environment'),
(9, 'Business'),
(10, 'Literature');

-- Ep_Hosted_by_Host
INSERT INTO Ep_Hosted_by_Host (ep_id, host_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5);

-- Ep_Added_to_UserPlaylist
INSERT INTO Ep_Added_to_UserPlaylist (user_playlist_id, ep_id) VALUES
(1, 1),
(2, 3),
(3, 5),
(4, 7),
(5, 9),
(6, 2),
(7, 4),
(8, 6),
(9, 8),
(10, 10);

INSERT INTO REVIEWS (review_id, review_comment, review_star, ep_id) VALUES
(1, 'Excellent episode!', 5, 1),
(2, 'Loved the insights.', 4, 2),
(3, 'Informative talk.', 5, 3),
(4, 'Could be shorter.', 3, 4),
(5, 'Very relaxing.', 5, 5),
(6, 'Too long.', 3, 6),
(7, 'Great storytelling!', 5, 7),
(8, 'Interesting topic.', 4, 8),
(9, 'Funny and engaging.', 5, 9),
(10, 'A bit repetitive.', 3, 10);

SELECT p.pod_name, e.ep_name
FROM PODCASTS p
JOIN Pod_has_Ep pe ON p.pod_id = pe.pod_id
JOIN EPISODES e ON e.ep_id = pe.ep_id;
