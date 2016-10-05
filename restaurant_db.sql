CREATE TABLE restaurant (
  id serial PRIMARY KEY,
  name varchar,
  address varchar,
  category varchar
);

CREATE TABLE reviewer (
  id serial PRIMARY KEY,
  name varchar,
  email varchar,
  karma integer CHECK (karma >= 0 and karma < 8)
);

CREATE TABLE review (
  id serial PRIMARY KEY,
  reviewer_id integer REFERENCES reviewer (id),
  stars integer CHECK (stars > 0 and stars < 6),
  title varchar,
  review text,
  restaurant_id integer REFERENCES restaurant(id)
);

--displays the restaurant.name values and average of the review.star values in a left joined
--table after verifying the names and stars through referencing with the restaurant id's #4
select name, avg(stars) as average_stars from review left outer join restaurant
on review.restaurant_id = restaurant.id group by name;

--displays restaurant.name and a count of how many instances of the restaurant.id has been
--referenced as review.restaurant_id in the review table. #5
select name, count(review.restaurant_id) as num_reviews from review left outer join restaurant
on review.restaurant_id = restaurant.id group by name order by num_reviews desc;

--#6
select restaurant.name, review, reviewer.name from review inner join restaurant
on review.restaurant_id = restaurant.id inner join reviewer on review.reviewer_id = reviewer.id;

--#7
select reviewer.name, avg(stars) from review inner join reviewer
on review.reviewer_id = reviewer.id group by reviewer.name

--#8
select reviewer.name, stars from review inner join reviewer
on review.reviewer_id = reviewer.id order by stars asc limit 2

--#9
select category, avg(stars) from review inner join restaurant
on review.restaurant_id = restaurant.id group by category
