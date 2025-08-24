create database blinkit_db
use blinkit_db

select * from Blinkit_data

--Total number of rows in data
select count(*) from Blinkit_data

--Changiing Item_Fat_content column
update Blinkit_data set Item_Fat_Content=
case 
when Item_Fat_Content in ('LF','low fat') then 'Low Fat'
when Item_Fat_Content = 'reg' then 'Regular'
else Item_Fat_Content
End

select distinct(Item_Fat_Content) from Blinkit_data

--KPI requirements
--Total sales is converted in millions
select concat(CAST(sum(sales)/1000000 AS Decimal(10,2)),'M') AS Total_sales from Blinkit_data


select concat(CAST(sum(sales)/1000000 AS Decimal(10,2)),'M') AS Total_sales from Blinkit_data
 where Item_Fat_Content='Low Fat'

--Average sales
select cast(avg(sales) AS Decimal(5,0)) AS Avg_sales from Blinkit_data

--Number of items
select count(Item_identifier) AS No_of_Items from Blinkit_data

--Average rating
select CAST(avg(rating) AS Decimal(5,0)) AS Avg_Rating from Blinkit_data

