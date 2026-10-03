SELECT COUNT(*) FROM swiggy;

-- Check for nulls in key columns
SELECT
  SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS null_names,
  SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS null_ratings,
  SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS null_cities
FROM swiggy;

-- Remove rows where rating is 'NEW' or '--' (not yet rated)
DELETE FROM swiggy
WHERE rating = 'NEW' OR rating = '--';

-- Standardise rating to numeric
UPDATE swiggy
SET rating = CAST(rating AS DECIMAL(2,1))
WHERE rating NOT IN ('NEW', '--');