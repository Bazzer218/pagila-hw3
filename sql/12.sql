/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
LEFT JOIN LATERAL (
  SELECT rental_id, rental_date, name
  FROM rental
  join inventory using(inventory_id)
  join film using(film_id)
  join film_category using(film_id)
  join category using(category_id)
  WHERE customer_id = c.customer_id
  ORDER BY rental_date DESC 
  LIMIT 5
) r ON true
where r.name = 'Action'
group by c.customer_id
having count(r.name) >= 3
order by c.customer_id
;
