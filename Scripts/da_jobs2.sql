--data analyst jobs exercise

-- 1. How many rows are in the data_analyst_jobs table?
-- SELECT *
-- FROM data_analyst_jobs
--1793

-- 2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
-- SELECT *
-- FROM data_analyst_jobs
-- LIMIT 10
-- --exxonmobil

-- 3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
-- SELECT count(*)
-- FROM data_analyst_jobs
-- WHERE location = 'TN' or location = 'KY'
-- --21 in TN, 27 combined

-- 4. How many postings in Tennessee have a star rating above 4?
-- SELECT COUNT(*)
-- FROM data_analyst_jobs
-- WHERE location = 'TN' AND star_rating>4
-- 3

-- 5. How many postings in the dataset have a review count between 500 and 1000?
-- SELECT COUNT(*)
-- FROM data_analyst_jobs AS DAJ 
-- WHERE review_count between 500 AND 1000
-- 151

-- 6. Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?
-- SELECT location AS state, avg(star_rating) AS avg_rating
-- FROM data_analyst_jobs
-- GROUP BY location
-- KS with 4.09

-- 7. Select unique job titles from the data_analyst_jobs table. How many are there?
-- SELECT COUNT(DISTINCT (title))
-- FROM data_analyst_jobs
-- 881

-- 8. How many unique job titles are there for California companies?
-- SELECT COUNT(DISTINCT(title))
-- FROM data_analyst_jobs
-- WHERE location = 'CA'
-- 230

-- 9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
-- SELECT COUNT(company)
-- FROM data_analyst_jobs
-- WHERE (review_count)>5000
-- 184


-- 10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
-- SELECT company, star_rating
-- FROM data_analyst_jobs
-- WHERE (review_count)>5000
-- GROUP BY star_rating, company
-- ORDER BY (star_rating) desc
-- american express. general motors, kaiser permanete, microsoft, nike, unilever all tied at 4.19999998909 star_rating


-- 11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
-- SELECT COUNT(title)
-- FROM data_analyst_jobs
-- WHERE title LIKE '%Analyst%'
-- 1636

-- 12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
-- SELECT COUNT(title)
-- FROM data_analyst_jobs
-- WHERE title IS NOT NULL
-- AND title LIKE '%Analyst%' 
-- AND title LIKE '%Analytics%'
-- 106

-- BONUS: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
-- Disregard any postings where the domain is NULL.
-- Order your results so that the domain with the greatest number of hard to fill jobs is at the top.
-- Which three industries are in the top 3 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

-- SELECT domain AS industry, COUNT(title) AS number_jobs
-- FROM data_analyst_jobs
-- WHERE domain IS NOT NULL
-- AND skill LIKE '%SQL%'
-- AND days_since_posting > 21
-- GROUP BY domain
-- ORDER BY number_jobs DESC;
-- "Internet and Software"
-- "Banks and Financial Services"
-- "Consulting and Business Services"