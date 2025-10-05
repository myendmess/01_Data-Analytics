SELECT
 seasons.market AS university,
 seasons.name AS team_name,
 mascots.mascot AS team_mascot,
 AVG(seasons.wins) AS avg_wins,
 AVG(seasons.losses) AS avg_losses,
 AVG(seasons.ties) AS avg_ties
FROM `bigquery-public-data.ncaa_basketball.mbb_historical_teams_seasons` AS seasons
LEFT JOIN `bigquery-public-data.ncaa_basketball.mascots` AS mascots
ON seasons.team_id = mascots.id
WHERE seasons.season BETWEEN 1990 AND 1999
 AND seasons.division = 1
 GROUP BY 1,2,3
ORDER BY avg_wins DESC, university