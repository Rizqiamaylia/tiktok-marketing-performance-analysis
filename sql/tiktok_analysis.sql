-- TikTok Marketing Performance Analysis
-- Database: tiktok_marketing.db
-- Table: tiktok_videos

-- 1. Check table contents
SELECT *
FROM tiktok_videos
LIMIT 5;

-- 2. Count total records
SELECT COUNT(*) AS total_data
FROM tiktok_videos;

-- 3. Overall performance metrics
SELECT
    COUNT(*) AS total_videos,
    SUM(play_count) AS total_views,
    SUM(digg_count) AS total_likes,
    SUM(comment_count) AS total_comments,
    SUM(share_count) AS total_shares,
    SUM(collect_count) AS total_saves
FROM tiktok_videos;

-- 4. Creator performance analysis
SELECT
    author_unique_id,
    COUNT(*) AS total_videos,
    SUM(play_count) AS total_views,
    ROUND(AVG(play_count), 2) AS average_views,
    ROUND(AVG(engagement_rate), 2) AS average_engagement_rate
FROM tiktok_videos
GROUP BY author_unique_id
ORDER BY average_engagement_rate DESC;

-- 5. Performance by upload day
SELECT
    upload_day,
    COUNT(*) AS total_videos,
    ROUND(AVG(play_count), 2) AS average_views,
    ROUND(AVG(engagement_rate), 2) AS average_engagement_rate
FROM tiktok_videos
GROUP BY upload_day
ORDER BY average_views DESC;