create database Bike_data;

Select *
From bike_share_yr_0;

Select *
From bike_share_yr_1;

-- Join table of 2021 with 2022

Select *
From bike_share_yr_0
Union
Select *
From bike_share_yr_1;

-- Connecting cost table with bike share table

select *
From cost_table;

With bike_share_cte as (
Select *
From bike_share_yr_0
Union
Select *
From bike_share_yr_1
)

-- Adding reveune and profit to the table

select dteday, season, bike_share_cte.yr, weekday, hr, rider_type, riders, price, COGS, ROUND(riders * price, 2) AS revenue, ROUND(riders * price - COGS, 2) AS profit
From bike_share_cte 
left join cost_table
on bike_share_cte.yr = cost_table.yr;


