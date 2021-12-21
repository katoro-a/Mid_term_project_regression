-- how to get rid of a table --> drop table sakila.house_price_data;
	
-- Question 1: create a database called house_price_regression 
	-- CREATE SCHEMA `house_price_regression` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ; 
-- Question 2: create a table house_price_data with the same columns as given in the csv file. Make sure you use the correct data types for the columns  
	-- USE THIS LINK TO COMPLETE THE FOLLOWING  
	-- https://medium.com/@AviGoom/how-to-import-a-csv-file-into-a-mysql-database-ef8860878a68
-- put the table in the wrong schema 
CREATE TABLE `house_price_data` (
  `id` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `bedrooms` int DEFAULT NULL,
  `bathrooms` int DEFAULT NULL,
  `sqft_living` int DEFAULT NULL,
  `sqft_lot` int DEFAULT NULL,
  `floors` int DEFAULT NULL,
  `waterfront` int DEFAULT NULL,
  `view_from` int DEFAULT NULL,
  `condition_1` int DEFAULT NULL,
  `grade` int DEFAULT NULL,
  `sqft_above` int DEFAULT NULL,
  `sqft_basement` int DEFAULT NULL,
  `yr_built` varchar(45) DEFAULT NULL,
  `yr_renovated` datetime DEFAULT NULL,
  `zipcode` int DEFAULT NULL,
  `latitude` int DEFAULT NULL,
  `longitud` int DEFAULT NULL,
  `sqft_living15` int DEFAULT NULL,
  `sqft_lot15` int DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


LOAD DATA LOCAL INFILE '/Users/Bijou/Desktop/Ironhack_prework_activities/Week_11/Mid_semester_proj/Regression/regression_data_sqldata.csv' INTO TABLE house_price_data FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS
 (id,date_new,bedrooms, bathrooms, sqft_living,sqft_lot, floors,
       waterfront, view_from, condition_1, grade, sqft_above,
       sqft_basement, yr_built, yr_renovated, zipcode, latitude, longitud,
       sqft_living15, sqft_lot15, price);




-- Question 3: Import the data from the csv file into the table. Before you import the data into the empty table, make sure that you have deleted the headers from the csv file. To not modify the original data, if you want you can create a copy of the csv file as well. Note you might have to use the following queries to give permission to SQL to import data from csv files in bulk:
	-- SHOW VARIABLES LIKE 'local_infile'; -- this query would shou you the status fo the varibale 'local_infile'.If it is off, use the next command, otherwise you should be good to go
	-- SET GLOBAL local_infile = 1;


-- Question 4: Select all the data from table house_price_data to check if the data was imported correctly

SELECT * FROM house_price_regression.house_price_data;

-- Question 5:Use the alter table command to drop the column date from the database, as we would not use it in the analysis with SQL. Select all the data from the table to verify if the command worked. Limit your returned results to 10.




-- Question 6:Use sql query to find how many rows of data you have.
select count(*)
FROM house_price_regression.house_price_data;
-- Question 7:Now we will try to find the unique values in some of the categorical columns: deleted the headers from the csv file.To not modify the original data, if you want you can create a copy of the csv file as well.Note you might have to use the following queries to give permission to SQL to ijmport data from csv files in bulk:
	-- part 1:What are the unique values in the column bedrooms?
select distinct(bedrooms)
FROM house_price_regression.house_price_data
order by bedrooms desc;
	-- part 2: What are the unique values in the column bathrooms? 
select distinct(bathrooms)
FROM house_price_regression.house_price_data
order by bathrooms desc;
	-- part 3: What are the unique values in the column floors?
select distinct(floors)
FROM house_price_regression.house_price_data
order by floors desc;
	-- part 4: What are the unique values in the column condition? 
    -- might need to change the name of this column since its also a command 
select distinct(condition_1)
FROM house_price_regression.house_price_data
order by condition_1;
	-- part 5: What are the unique values in the column grade? 
select distinct(grade)
FROM house_price_regression.house_price_data
order by grade desc;
-- Question 8: Arrange the data in a decreasing order by the price of the house. 
	-- Return only the IDs of the top 10 most expensive houses in your data.
select id,price
FROM house_price_regression.house_price_data
order by price desc
limit 10;
-- Question 9: What is the average price of all the properties in your data?    
	-- LIMIT THE DECIMAL PLACE TO 2 PLACES TRY THAT 
select avg(price) as average_price 
FROM house_price_regression.house_price_data;
-- Question 10: In this exercise we will use simple group by to check the properties of some of the categorical variables in our data
	-- part 1: What is the average price of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the prices. Use an alias to change the name of the second column.
select bedrooms,avg(price) as average_price
FROM house_price_regression.house_price_data
group by bedrooms
order by bedrooms;    
   
   -- note that you cannot use the avg(price) group by because of the order of operations !!
   
   
   -- part 2: What is the average sqft_living of the houses grouped by bathrooms? The returned result should have only two columns, bedrooms and Average of the sqft_living. Use an alias to change the name of the second column.
select bathrooms,avg(sqft_living) as avg_sqft_living
FROM house_price_regression.house_price_data
group by bathrooms;
	-- part 3: What is the average price of the houses with a waterfront and without a waterfront? The returned result should have only two columns, waterfront and Average of the prices. Use an alias to change the name of the second column.
select waterfront,avg(price) as avg_price
FROM house_price_regression.house_price_data
group by waterfront;
	-- HELP FIX part 4: Is there any correlation between the columns condition and grade? You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
select condition_1,grade
from house_price_regression.house_price_data
group by grade,condition_1
order by grade;

-- ### HELP********************dhfsfhlfshf

-- Question 11: One of the customers is only interested in the following houses: 
	-- use this link https://www.sqlshack.com/learn-mysql-sorting-and-filtering-data-in-a-table/
		-- Number of bedrooms either 3 or 4
		-- Bathrooms more than 3
		-- 1 Floor
		-- No waterfront
		-- Condition should be 3 at least
		-- Grade should be 5 at least
		-- Price less than 300000
	-- use a where filter use and instead of a comma??
select id,bedrooms,bathrooms,floors,waterfront,condition_1,grade,price
from house_price_regression.house_price_data
where floors = 1 and waterfront = 0 and condition_1 <= 3 and grade <=5 and price<300000 and bedrooms between 3 and 4
; 

-- Question 12:Your manager wants to find out the list of properties whose prices are twice more than the average of all 
		-- the properties in the database. Write a query to show them the list of such properties. You might need to use a sub query 
        -- for this problem.
-- use a sub query  
-- HELP LOOK OVER HOW TO DO SUB QUERIES 
select id,price,avg(price) as avg_price
from house_price_regression.house_price_data
where price > 2*
(
select avg(price) as average_price
)
group by id,price;

-- Question 13: Since this is something that the senior management is regularly interested in, create a view of the same query.
	-- Create a temporary view table of the above query 
create view properties_two_times_the_avg as 
select *
from house_price_regression.house_price_data
where price > 2*
(select avg(price) as average_price);

-- Question 14: Most customers are interested in properties with three or four bedrooms. What is the difference in average prices of the properties with three and four bedrooms?
select avg(price) as avg_price, bedrooms
from house_price_regression.house_price_data
where bedrooms =3 or bedrooms =4
group by bedrooms
order by bedrooms desc 
;

-- use having instead of where on aggregated data 

-- Question 15: What are the different locations where properties are available in your database? (distinct zip codes)
select distinct(zipcode) as ava_zipcodes
from house_price_regression.house_price_data; 

select count(distinct(zipcode)) as ava_zipcodes
from house_price_regression.house_price_data; 


-- Question 16: Show the list of all the properties that were renovated.
select id,sqft_living15,sqft_lot15 
from house_price_regression.house_price_data;

-- HELP Question 17: Provide the details of the property that is the 11th most expensive property in your database. 
	-- use rank on price and then select the 11th   
    -- use sub query 
select rank() over (order by price desc) as rank_ ,price
from house_price_regression.house_price_data 
where rank_ = 11; 


select * from(
	select 
		price,id, dense_rank() over (order by price desc)price_rank
from house_price_regression.house_price_data 
) t
where price_rank = 11;
        

	-- CANT USE WHERE HAVE TO USE A DIFFERNT OPERATION 








