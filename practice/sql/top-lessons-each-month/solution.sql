WITH monthly AS (
  SELECT DATE_FORMAT(viewed_at, '%Y-%m') AS month, page_url, COUNT(DISTINCT view_id) AS completion_count
  FROM page_views
  GROUP BY DATE_FORMAT(viewed_at, '%Y-%m'), page_url
),
ranked AS (
  SELECT month, page_url, completion_count,
    RANK() OVER (PARTITION BY month ORDER BY completion_count DESC) AS `rank`
  FROM monthly
)
SELECT month, page_url, completion_count, `rank`
FROM ranked
WHERE `rank` <= 3
ORDER BY month, completion_count DESC, page_url;
