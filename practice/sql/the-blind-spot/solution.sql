WITH members AS 
(SELECT
 DISTINCT channel,
 sender_id 
FROM chat_msgs
WHERE sender_id IS NOT NULL),


connections AS
(SELECT 
DISTINCT a.sender_id AS user_id, 
b.sender_id AS conn_id 
FROM members a 
JOIN members b
ON a.channel = b.channel AND a.sender_id <> b.sender_id),


candidates AS 
(SELECT
c.user_id, 
pv.page_url AS content_id 
FROM connections c 
JOIN page_views pv 
ON pv.user_id = c.conn_id 
WHERE pv.page_url IS NOT NULL 
GROUP BY c.user_id, pv.page_url 
HAVING COUNT(DISTINCT c.conn_id) >= 2)

SELECT 
  cd.user_id, 
  cd.content_id 
FROM candidates cd 
WHERE NOT EXISTS (SELECT 1 FROM page_views v WHERE v.user_id = cd.user_id AND v.page_url = cd.content_id)
