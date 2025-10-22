USE supodcast_db;

-- PODCASTS
INSERT INTO PODCASTS (pod_id, pod_name, pod_description) VALUES
(1, 'Tech Talks', 'Technology insights'),
(2, 'Mind Matters', 'Psychology discussions'),
(3, 'Health Vibes', 'Wellness and nutrition'),
(4, 'History Echoes', 'Historical deep dives'),
(5, 'CineChat', 'Movie reviews and news'),
(6, 'Music Waves', 'Musicians and trends'),
(7, 'Science Sphere', 'Scientific breakthroughs'),
(8, 'EcoTalk', 'Sustainability and environment'),
(9, 'Startup Stories', 'Entrepreneurship tales'),
(10, 'Book Club', 'Book summaries and analysis');

-- CATEGORIES
INSERT INTO CATEGORIES (category_name, category_description) VALUES
('Technology', 'All about tech'),
('Psychology', 'Human mind & behavior'),
('Health', 'Health and lifestyle'),
('History', 'Historical events'),
('Movies', 'Film discussions'),
('Music', 'All things music'),
('Science', 'Scientific discoveries'),
('Environment', 'Climate and ecology'),
('Business', 'Entrepreneurship and startups'),
('Literature', 'Books and writing');

-- HOSTS
INSERT INTO HOSTS (host_id, host_name, host_country, host_organization) VALUES
(1, 'Alice Smith', 'USA', 'Tech Weekly'),
(2, 'John Doe', 'UK', 'Mind Matters Org'),
(3, 'Emma Brown', 'Canada', 'Health First'),
(4, 'Mark Wilson', 'Germany', 'History Podcasting Co'),
(5, 'Sophia Garcia', 'Spain', 'CineTalk Media'),
(6, 'Liam Johnson', 'Australia', 'SoundWave'),
(7, 'Olivia Davis', 'Sweden', 'Science Daily'),
(8, 'Ethan Lee', 'Korea', 'EcoPlanet'),
(9, 'Noah Kim', 'Japan', 'Startup Nation'),
(10, 'Mia Lopez', 'Brazil', 'BookVerse');

-- USERS
INSERT INTO USERS (user_id, user_name) VALUES
(1, 'Bora'),
(2, 'Ayse'),
(3, 'Ali'),
(4, 'Zeynep'),
(5, 'Omar'),
(6, 'Lina'),
(7, 'Yusuf'),
(8, 'Derya'),
(9, 'Can'),
(10, 'Melis');

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
