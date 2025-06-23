LOAD DATA LOCAL INFILE 'C:/Users/Nithin Varughese/OneDrive/Desktop/youtube_ca_clean.csv'
INTO TABLE trending_vidoes
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

SET GLOBAL local_infile = 1;

CREATE DATABASE youtube_ca;

USE youtube_ca;

SELECT * FROM trending_vidoes;

-- TOP 10 most viewed vidoes 

SELECT title, channel_title, views
FROM trending_vidoes
ORDER BY views DESC
LIMIT 10;


-- Top Channels with most video count
SELECT channel_title, COUNT(*) AS video_count
FROM trending_vidoes
GROUP BY channel_title
ORDER BY video_count DESC
LIMIT 10;

-- Video Count by the day of week
SELECT DAYNAME(publish_time) AS upload_day, COUNT(*) AS videos
FROM trending_videos
GROUP BY upload_day;

-- Most Liked Categories
SELECT category_id, SUM(likes) AS total_likes
FROM trending_videos
GROUP BY category_id
ORDER BY total_likes DESC;


