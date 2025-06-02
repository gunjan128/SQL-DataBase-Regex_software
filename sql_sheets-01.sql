use  sakila;

show tables;

desc actor;

desc film_actor;
desc film;
select * from actor limit 10;

select * from film_actor;

desc mocie;
-- we have combine film-actor in film table, to find out actor , film_id, film_name done by each actor;
select fa.actor_id,fa.film_id,f.film_id,f.title from film_actor as fa
join film as f on fa.film_id=f.film_id;
-- findout actor_id and the movie-name only for those movies lenght>100
select fa.actor_id,f.film_id,f.title ,f.length from film_actor as fa 
inner join film as f on f.length>100;
-- get the actor_id and number_of_movies we have done goal caree;

-- get title and film_id from the movies, who has rating= 'nc-17' and short all those movies based desc order of film

select film_id,title,rating from film where rating="NC-17"
order by film_id desc;



