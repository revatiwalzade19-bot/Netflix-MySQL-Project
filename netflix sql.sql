SELECT * FROM netflix.netflixs;
SELECT COUNT(*) AS total
FROM netflix.netflixs;

-- . Count the number of Movies vs TV Shows
SELECT type, 
count(*) as totalcount
FROM netflix.netflixs
group by type;

-- . Find the most common rating for movies and TV shows

SELECT type,rating, COUNT(*) AS total_titles
FROM netflixs
GROUP BY type,rating;

-- . List all movies released in a specific year (e.g., 2020)
select type,release_year
from netflixs
where release_year =2020
and 
type ='movie';

-- . Find the top 5 countries with the most content on Netflix
use netflix;
select country, 
count(id)
from netflixs
group by country;

-- . Identify the longest movie
select * from netflixs
where
type = "Movie"
and
duration = (select max(duration) from netflixs);

-- . Find content added in the last 5 years
use netflix;
SELECT 
*,
date_add (date_added, 'month,DD,YYYY')
from netflixs;


-- . List all TV shows with more than 3 seasons
select * from netflixs
where duration >='3 Seasons';

-- . Count the number of content items in each genre
use netflix;
    SELECT
    id,
    category
FROM netflixs,
JSON_TABLE(
    concat('["', REPLACE(listed_in, ', ', '","'), '"]'),
    '$[*]' COLUMNS (category VARCHAR(255) PATH '$')
) AS jt;


-- . List all movies that are documentaries
select type,
count(type)from netflixs
 where listed_in LIKE '%Documentaries%'
group by type;

 -- Find all content with a director Joe Alves
Select * from netflixs
where director ='Joe Alves';

 -- Find how many movies actor 'Karen Young' appeared 
SELECT * from netflixs
WHERE CAST LIKE '%Karen Young%'
AND TYPE = "MOVIE";

-- Find the movies produced in India.
select *
 from netflixs 
where country = "india"



