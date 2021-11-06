SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;
--finding the top five highest score stories

SELECT SUM(score)
FROM hacker_news;
--finding the total score of all the stories

SELECT user, SUM(score)
FROM hacker_news
GROUP BY user
HAVING SUM(score) > 200
ORDER BY 2 DESC;
--finding individual users with the highest scores

SELECT (517+309+304+282) / 6366.0;
--dividind the sum of the highest score users by the total sum to understand if the Hacker News has really dominated by that restricted group of users

SELECT user, COUNT(*)
FROM hacker_news
WHERE url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
GROUP BY 1
ORDER BY 2 DESC;
--finding users that posted a specific link

SELECT CASE
  WHEN url LIKE '%github.com%' THEN 'GitHub'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
  ELSE 'Other'
 END AS 'Source'  , --GROUP 1
 COUNT (*)
FROM hacker_news
GROUP BY 1;
--finding which site feed Hacker News the most

SELECT strftime('%H', timestamp) AS 'HOUR',
  ROUND(AVG(score), 1) AS 'AVERAGE SCORE',
  COUNT(*) AS 'NUMBER OF STORIES'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;
--finding the best time of the day to post a story on Hacker News: 07 in the morning && 18 in the evening
