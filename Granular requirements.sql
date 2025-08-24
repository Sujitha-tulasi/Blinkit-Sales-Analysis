use blinkit_db

select * from Blinkit_data

--Granular Requirements
--Total sales by Fat content
select Item_Fat_content,
cast(sum(sales) AS decimal(10,2)) AS Total_sales,
cast(avg(sales) AS decimal(5,0)) As Avg_sales,
count(Item_identifier) as no_of_items,
CAST(avg(rating) AS Decimal(5,0)) AS Avg_Rating
from blinkit_data
group by Item_Fat_Content
order by Total_sales desc

--Total sales by item type
select Item_Type,
cast(sum(sales) AS decimal(10,2)) AS Total_sales,
cast(avg(sales) AS decimal(5,0)) As Avg_sales,
count(Item_identifier) as no_of_items,
CAST(avg(rating) AS Decimal(5,0)) AS Avg_Rating
from Blinkit_data
group by Item_Type
order by Total_sales desc

--Fat content by outlet for Total sales
select Outlet_Location_Type,Item_fat_content,
cast(sum(sales) AS decimal(10,2)) AS Total_sales,
cast(avg(sales) AS decimal(5,0)) As Avg_sales,
count(Item_identifier) as no_of_items,
CAST(avg(rating) AS Decimal(5,0)) AS Avg_Rating
from blinkit_data
group by Outlet_Location_Type,Item_Fat_Content
order by Total_sales 

select Outlet_Location_Type,[Low Fat],[Regular]
from
(
select Outlet_Location_Type,Item_fat_content,sales
from Blinkit_data
)AS SourceTable
PIVOT
(
sum(sales)
FOR Item_fat_content IN ([Low Fat],[Regular])
)AS PivotTable
order by Outlet_Location_Type;


--Total sales by outlet Establisment
--when there are normal col and aggregared column in select list then we have to use groupby
select outlet_establishment_year,
cast(sum(sales) as decimal(10,2)) as total_sales ,
cast(avg(sales) AS decimal(5,0)) As Avg_sales,
count(Item_identifier) as no_of_items,
CAST(avg(rating) AS Decimal(5,0)) AS Avg_Rating
from Blinkit_data
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year

--Percentage of sales by outlet size
select outlet_size,
cast(sum(sales) as decimal(10,2)) as Total_sales,
cast((sum(sales) *100.0 / sum(sum(sales)) over()) AS decimal(10,2)) As sales_percentage
from Blinkit_data
group by Outlet_Size
order by Total_sales desc;

--Sales by outlet location type
select outlet_location_type,cast(sum(sales) as decimal(10,2)) 
from Blinkit_data
group by Outlet_Location_Type
order by Outlet_Location_Type


--All metrics by outlet type
select outlet_type,
cast(sum(sales) as decimal(10,2)) AS Total_sales,
cast(avg(sales) AS decimal(5,0)) As Avg_sales,
count(Item_identifier) as no_of_items,
CAST(avg(rating) AS Decimal(5,0)) AS Avg_Rating
from Blinkit_data
group by Outlet_Type
order by Outlet_Type
