/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

select distinct(first_name ||' '|| last_name) as "Actor Name"
from actor a1
join film_actor fa1 on a1.actor_id = fa1.actor_id
join film f1 on fa1.film_id = f1.film_id
where
(a1.first_name ||' '|| a1.last_name) != 'RUSSELL BACALL' and
f1.title in (
select title from film
join film_actor using(film_id)
join actor using(actor_id)
where (first_name ||' '|| last_name) in (

select distinct(first_name ||' '|| last_name) as "Actor Name"
from actor a1
join film_actor fa1 on a1.actor_id = fa1.actor_id
join film f1 on fa1.film_id = f1.film_id
where
(a1.first_name ||' '|| a1.last_name) != 'RUSSELL BACALL' and
f1.title in (
select title from film
join film_actor using(film_id)
join actor using(actor_id)
where first_name = 'RUSSELL' and last_name = 'BACALL')
)
)
and a1.actor_id not in (
    select a2.actor_id
from actor a2
join film_actor fa1 on a2.actor_id = fa1.actor_id
join film f1 on fa1.film_id = f1.film_id
where
(a1.first_name ||' '|| a1.last_name) != 'RUSSELL BACALL' and
f1.title in (
select title from film
join film_actor using(film_id)
join actor using(actor_id)
where first_name = 'RUSSELL' and last_name = 'BACALL')
)
order by "Actor Name"
;

