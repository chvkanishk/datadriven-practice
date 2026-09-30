SELECT svc_name, MIN(uptime) AS min_uptime
FROM svc_health
GROUP BY svc_name
ORDER BY min_uptime
LIMIT 10;
