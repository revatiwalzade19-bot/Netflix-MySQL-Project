# Netflix moveis and tv shows Analysis using  MySQL 
![netflix logo](https://github.com/revatiwalzade19-bot/Netflix-MySQL-Project/blob/main/netflix%20logo.webp)
## Objective Analyze the distribution of content types movies vs TV shows.
Identify the most common ratings for movies and TV shows.
List and analyze content based on release years, countries, and durations.
Explore and categorize content based on specific criteria and keywords.)


## Dataset
(https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)

## Schema

```SQL DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);```

##Business problem and solution

```SQL SELECT * FROM netflix.netflixs;
SELECT COUNT(*) AS total
FROM netflix.netflixs;

-- . ## Count the number of Movies vs TV Shows
SELECT type, 
count(*) as totalcount
FROM netflix.netflixs
group by type;

-- . ## Find the most common rating for movies and TV shows

SELECT type,rating, COUNT(*) AS total_titles
FROM netflixs
GROUP BY type,rating;

-- .## List all movies released in a specific year (e.g., 2020)
select type,release_year
from netflixs
where release_year =2020
and 
type ='movie';

-- . ## Find the top 5 countries with the most content on Netflix
use netflix;
select country, 
count(id)
from netflixs
group by country;

-- . ## Identify the longest movie
select * from netflixs
where
type = "Movie"
and
duration = (select max(duration) from netflixs);

-- .## Find content added in the last 5 years
use netflix;
SELECT 
*,
date_add (date_added, 'month,DD,YYYY')
from netflixs;


-- . ## List all TV shows with more than 3 seasons
select * from netflixs
where duration >='3 Seasons';

-- . ## Count the number of content items in each genre
use netflix;
    SELECT
    id,
    category
FROM netflixs,
JSON_TABLE(
    concat('["', REPLACE(listed_in, ', ', '","'), '"]'),
    '$[*]' COLUMNS (category VARCHAR(255) PATH '$')
) AS jt;


-- .## List all movies that are documentaries
select type,
count(type)from netflixs
 where listed_in LIKE '%Documentaries%'
group by type;

 --## Find all content with a director Joe Alves
Select * from netflixs
where director ='Joe Alves';

 --## Find how many movies actor 'Karen Young' appeared 
SELECT * from netflixs
WHERE CAST LIKE '%Karen Young%'
AND TYPE = "MOVIE";

-- ## Find the movies produced in India.
select *
 from netflixs 
where country = "india"```

## This project is part of my portfolio, showcasing the SQL skills
essential for data analyst roles.
If you have any questions, feedback, or would like to collaborate, feel free to get in touch!



