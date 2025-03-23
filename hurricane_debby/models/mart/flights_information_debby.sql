SELECT f.flight_date
	  ,count(*) AS total_flights
	  ,sum(f.cancelled) AS total_cancelled
	  ,round(AVG(f.dep_delay), 2) AS avg_dep_delay
	  ,round(AVG(f.arr_delay), 2) AS avg_arr_delay
FROM {{ref('debby_prep_flights')}} f
GROUP BY f.flight_date
ORDER BY flight_date 