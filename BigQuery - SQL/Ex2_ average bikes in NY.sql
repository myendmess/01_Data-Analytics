SELECT 
  station_name,
  ridership_2013,
  ridership_2014,
  ridership_2015,
  ridership_2016,
  CAST( (ridership_2013 + ridership_2014 + ridership_2015 + ridership_2016) / 4 AS INT64 ) AS average

FROM
    bigquery-public-data.new_york_subway.subway_ridership_2013_present
GROUP BY 
 station_name,
  ridership_2013,
  ridership_2014,
  ridership_2015,
  ridership_2016
ORDER BY
  average DESC
