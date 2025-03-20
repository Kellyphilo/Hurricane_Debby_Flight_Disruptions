WITH daily_data AS (
    SELECT * 
    FROM {{ref('staging_weather_daily')}}
),
add_features AS (
    SELECT *
		, date_part('day', date) AS date_day 		-- number of the day of month
		, date_part('month', date) AS date_month 	-- number of the month of year
		, date_part('year', date) AS date_year 		-- number of year
		, date_part('week', date) AS cw 			-- number of the week of year
		, to_char(date, 'Month') AS month_name 	-- name of the month use 'FMmonth' to avoid white space
		, to_char(date, 'Day') AS weekday 		-- name of the weekday
    FROM daily_data 
)
SELECT *
FROM add_features
ORDER BY date