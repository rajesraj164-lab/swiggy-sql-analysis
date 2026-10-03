-- Q1: How many restaurants are listed per city?
SELECT city, COUNT(*) AS total_restaurants
FROM swiggy
GROUP BY city
ORDER BY total_restaurants DESC
LIMIT 10;

-- Q2: What are the most popular cuisines across India?
SELECT cuisine, COUNT(*) AS count
FROM swiggy
GROUP BY cuisine
ORDER BY count DESC
LIMIT 10;

-- Q3: Which restaurant chains have the most branches?
SELECT name, COUNT(*) AS branches
FROM swiggy
GROUP BY name
ORDER BY branches DESC
LIMIT 10;

-- Q4: Top 5 cities with highest average restaurant rating?
SELECT city,
       ROUND(AVG(CAST(rating AS FLOAT)), 2) AS avg_rating,
       COUNT(*) AS total_restaurants
FROM swiggy
WHERE rating NOT IN ('NEW', '--')
GROUP BY city
HAVING COUNT(*) > 50
ORDER BY avg_rating DESC
LIMIT 5;

-- Q5: What is the average cost for two across cities?
SELECT city,
       ROUND(AVG(CAST(REPLACE(cost, ',', '') AS INTEGER)), 0) AS avg_cost
FROM swiggy
WHERE cost IS NOT NULL
GROUP BY city
ORDER BY avg_cost DESC
LIMIT 10;

-- Q6: Which cuisines have the highest average rating?
SELECT cuisine,
       ROUND(AVG(CAST(rating AS FLOAT)), 2) AS avg_rating,
       COUNT(*) AS restaurant_count
FROM swiggy
WHERE rating NOT IN ('NEW', '--')
GROUP BY cuisine
HAVING COUNT(*) > 100
ORDER BY avg_rating DESC
LIMIT 10;

-- Q7: Restaurants with rating above 4.5 and more than 1000 ratings
SELECT name, city, rating, rating_count, cost
FROM swiggy
WHERE CAST(rating AS FLOAT) >= 4.5
  AND CAST(REPLACE(rating_count, '+', '') AS INTEGER) >= 1000
ORDER BY rating DESC
LIMIT 20;

-- Q8: Business insight — which city has best value for money?
-- (high rating, low cost)
SELECT city,
       ROUND(AVG(CAST(rating AS FLOAT)), 2) AS avg_rating,
       ROUND(AVG(CAST(REPLACE(cost, ',', '') AS INTEGER)), 0) AS avg_cost
FROM swiggy
WHERE rating NOT IN ('NEW', '--')
GROUP BY city
HAVING COUNT(*) > 30
ORDER BY avg_rating DESC, avg_cost ASC
LIMIT 10;