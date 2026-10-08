WITH monthly_activity AS (
    SELECT DISTINCT
        user_id,
        EXTRACT(MONTH FROM CAST(session_start AS DATE)) AS month_num
    FROM user_sessions
    WHERE session_start >= '2026-01-01'
      AND session_start < '2026-07-01'
),
ranked_months AS (
    SELECT
        user_id,
        month_num,
        month_num - ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY month_num) AS grp
    FROM monthly_activity
),
streak_lengths AS (
    SELECT
        user_id,
        COUNT(*) AS streak_length
    FROM ranked_months
    GROUP BY user_id, grp
),
max_streaks AS (
    SELECT
        user_id,
        MAX(streak_length) AS streak_length
    FROM streak_lengths
    GROUP BY user_id
)
SELECT
    user_id,
    streak_length,
    DENSE_RANK() OVER (ORDER BY streak_length DESC) AS standing
FROM max_streaks
ORDER BY standing, user_id
