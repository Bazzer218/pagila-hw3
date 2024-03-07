/*
 * Compute the country with the most customers in it. 
 */
select country from country
join city using(country_id)
join address using(city_id)
join customer using(address_id)
group by country
order by count(customer_id) DESC, country
limit 1
;
