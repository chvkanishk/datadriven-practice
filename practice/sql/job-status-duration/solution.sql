WITH t AS (
  SELECT
    job_name,
    status,
    started,
    COALESCE(
      LEAD(started, 1) OVER (
        PARTITION BY job_name
        ORDER BY started, job_id
      ),
      started + INTERVAL '2 hours'
    ) AS next_start
  FROM batch_jobs
)

SELECT
  job_name,
  ROUND(
    SUM(EXTRACT(EPOCH FROM next_start - started)) / 3600
  ) AS running_hours
FROM t
WHERE LOWER(TRIM(status)) = 'running'
GROUP BY job_name
ORDER BY job_name
