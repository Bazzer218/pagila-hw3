/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 */
select f2.title
from film f1
join film_actor fa1 on (f1.film_id=fa1.film_id)
join actor on (fa1.actor_id = actor.actor_id)
join film_actor fa2 on (actor.actor_id = fa2.actor_id)
join film f2 on (f2.film_id = fa2.film_id)
where f1.title = 'AMERICAN CIRCUS'
group by f2.title
having count(fa1.actor_id) > 1
order by f2.title;
