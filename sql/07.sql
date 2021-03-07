/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSEL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */
SELECT DISTINCT
    a2.first_name || ' ' || a2.last_name AS "Actor Name"
FROM actor as a1
JOIN film_actor fa1 on a1.actor_id = fa1.actor_id
JOIN film_actor fa2 on fa1.film_id = fa2.film_id
JOIN film_actor fa3 on fa2.film_id = fa3.film_id
JOIN actor a2 on fa2.actor_id = a2.actor_id
WHERE a1.actor_id IN
    (SELECT DISTINCT 
        a2.actor_id
    FROM actor as a1
    JOIN film_actor fa1 on a1.actor_id = fa1.actor_id
    JOIN film_actor fa2 on fa1.film_id = fa2.film_id
    JOIN actor a2 on fa2.actor_id = a2.actor_id
    WHERE a1.actor_id = 112 
    AND a2.actor_id != 112 
)
AND a2.actor_id NOT IN 
    (SELECT DISTINCT 
        a2.actor_id
    FROM actor as a1
    JOIN film_actor fa1 on a1.actor_id = fa1.actor_id
    JOIN film_actor fa2 on fa1.film_id = fa2.film_id
    JOIN actor a2 on fa2.actor_id = a2.actor_id
    WHERE a1.actor_id = 112 
)
ORDER BY "Actor Name";
