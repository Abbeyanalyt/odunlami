
/*
QUESTION 1
take a look at the mavenmoviesmini database.
what do you notice about it? how many tables are there?
what do you think the current schema? */

USE mavenmoviesmini;
-- we only have one table called inventory_non_normalized
-- the table in these database is not normalized but needs to be normalized

/*
QUESTION 2
if you wanted to break out the inventory_non_normalized table into multiple tables
how many tables do you think would be ideal? what would you name those tables
*/
-- inventory(inventory_id, flim_id, store_id)
-- flim (film_id, title, description, release_year, rental_rate, rating)
-- store(store_id, store_manager_first_name, store_manager_last_name, store_address, store_city, store_district)

SELECT * FROM inventory_non_normalized;

/*
QUESTION 3
Based on your answer from question 2 , create a new database with the tables you think will best serve these data set.alter
*/
CREATE DATABASE mavenmoviesmini_normalized;

/*
QUESTION 4
Next, use the data from thr original database to populate the tables in your newly optimized database*/

USE mavenmoviesmini_normalized;
create table inventory as
SELECT Distinct 
inventory_id,
film_id,
store_id
FROM mavenmoviesmini.inventory_non_normalized;

SELECT * FROM inventory;

CREATE TABLE film as
SELECT distinct
film_id,
title,
description,
release_year,
rental_rate,
rating 
from mavenmoviesmini.store;

SELECT * FROM  film;

CREATE TABLE store as
SELECT distinct
store_id,
store_manager_first_name,
store_manager_last_name
store_address,
store_city,
store_district
from mavenmoviesmini.store;

SELECT * FROM store;

/*
QUESTION 5
Make sure your new tables have the proper primary keys defined and that applicable foreign keys are added.
add any constraints you think should apply to the data as well unique, non-null */

-- done

/*
QUSTION 6
finally, after doing all of this technical work, write a brief summary of what you have done 
in a way non-technical client can understand.
communicate what you did and why your new sehema design is better*/

-- we had a table that was redundantly storing a lot of information which was inventory_non_normalized from mavenmoviesmini and i break 
-- it into three tables, an inventory table which has a record of every items of inventory that we have, which that has the same number
-- as their previous table but that table has become a lot more skinny and instead of storing all the data there, that tables has foreign key 
-- which basically are the values that allow us to map to data that is now stored into other tables called the film table and the store table
-- which store information specifically about our films and our stores respectively




