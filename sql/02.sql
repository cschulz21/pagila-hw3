/*
 * Count the number of movies that contain each type of special feature.
 */
SELECT
    unnest AS "special_features",
    count(*)
FROM
(SELECT
    film_id,
    unnest(special_features)
FROM film
) AS t
GROUP BY unnest
ORDER BY unnest;
