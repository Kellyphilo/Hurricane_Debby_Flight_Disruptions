WITH daily_data AS (
    SELECT * 
    FROM {{ref('debby_staging_weather_daily')}}
),
add_features AS (
    SELECT *
		, date_part('day', date) AS date_day 		-- number of the day of month
    FROM daily_data 
)
SELECT *
FROM add_features
ORDER BY date