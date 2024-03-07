/*
 * Find every documentary film that is rated G.
 * Report the title and the actors.
 *
 * HINT:
 * Getting the formatting right on this query can be tricky.
 * You are welcome to try to manually get the correct formatting.
 * But there is also a view in the database that contains the correct formatting,
 * and you can SELECT from that VIEW instead of constructing the entire query manually.
 */
SELECT
    title,
    string_agg(initcap(first_name) || initcap(last_name), ', ') AS actors
FROM (
    SELECT
        f.title,
        f.film_id
    FROM
        film f
    JOIN
        film_category fc ON f.film_id = fc.film_id
    JOIN
        category c ON fc.category_id = c.category_id
    WHERE
        c.name = 'Documentary' AND
        f.rating = 'G'
) AS sq
JOIN
    film_actor fa ON sq.film_id = fa.film_id
JOIN
    actor a ON fa.actor_id = a.actor_id
GROUP BY
    title
ORDER BY
    title;
