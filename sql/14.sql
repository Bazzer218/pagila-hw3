/*
 * Management also wants to create a "best sellers" list for each category.
 *
 * Write a SQL query that:
 * For each category, reports the five films that have been rented the most for each category.
 *
 * Note that in the last query, we were ranking films by the total amount of payments made,
 * but in this query, you are ranking by the total number of times the movie has been rented (and ignoring the price).
 */
SELECT
    name,
    title,
    "total rentals"
FROM (
    SELECT
        name,
        title,
        count(rental_date) as "total rentals",
        ROW_NUMBER() OVER (PARTITION BY name ORDER BY count(rental_date) DESC, title DESC) AS row_num
    FROM
        category
    JOIN
        film_category USING(category_id)
    JOIN
        film USING(film_id)
    JOIN
        inventory USING(film_id)
    JOIN
        rental USING(inventory_id)
    GROUP BY
        name, title
) AS subquery
WHERE
    row_num <= 5
ORDER BY
    name, "total rentals" DESC, title;
