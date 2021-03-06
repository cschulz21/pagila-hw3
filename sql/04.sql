/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
SELECT DISTINCT
    first_name || ' ' || last_name AS "Actor Name"
FROM(
    SELECT
        film_id,
        unnest(special_features)
    FROM film
    ) AS t
INNER JOIN film_actor USING (film_id)
INNER JOIN actor USING (actor_id)
WHERE unnest = 'Behind the Scenes'
ORDER BY "Actor Name";
