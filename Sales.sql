use sales;

select count(*) from customers;    --  38
select count(*) from date ;         -- 1126
select count(*) from markets;       -- 17
select count(*) from products;        -- 279
select count(*) from transactions ;  --       150283

select * from transactions limit 5;

select * from transactions where market_code = "Mark001";
select count(*) from transactions where market_code = "Mark001";           -- 1035 
select * from transactions where currency = "USD";
select count(*) from transactions where currency = "USD";              -- 2 


-- JOINS --

select sales.transactions.*, sales.date.* 
from transactions 
inner join sales.date 
on sales.transactions.order_date = sales.date.date;

select sales.transactions.*, sales.date.* 
from transactions 
inner join sales.date 
on sales.transactions.order_date = sales.date.date
where sales.date.year= 2020;

-- finding revenue for each year --

select sum(sales.transactions.sales_amount) 
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date
where sales.date.year = 2019;           -- 336452114


 select sum(sales.transactions.sales_amount) 
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date
where sales.date.year = 2018;                 -- 414308941

select sum(sales.transactions.sales_amount) 
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date
where sales.date.year = 2017;            -- 9356952

select distinct year from sales.date;

select sum(sales.transactions.sales_amount) 
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date
where sales.date.year = 2020;        -- 142235559 


select sum(sales.transactions.sales_amount) 
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date
where sales.date.year = 2017 and sales.transactions.market_code= 'Mark001';     -- revenue in chennai is 1670830 for fiscal year 2017 


select sum(sales.transactions.sales_amount) 
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date
where sales.date.year = 2018 and sales.transactions.market_code= 'Mark001';     -- revenue in chennai is 8969881 for fiscal year 2018

select sum(sales.transactions.sales_amount) 
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date
where sales.date.year = 2019 and sales.transactions.market_code= 'Mark001';     -- revenue in chennai is 5123768 for fiscal year 2019


select sum(sales.transactions.sales_amount) 
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date
where sales.date.year = 2020 and sales.transactions.market_code= 'Mark001';     -- revenue in chennai is 2463024 for fiscal year 2020  

select distinct product_code from sales.transactions where market_code = "Mark001";

 --  to check currency duplication --
 
 select distinct(transactions.currency) from sales.transactions;
 -- 'INR'
-- 'USD'
-- 'INR\r'
-- 'USD\r'
select count(*) from transactions where transactions.currency ='INR\r';            -- 150000
select count(*) from transactions where transactions.currency = "INR";                    -- 279

select count(*) from transactions where transactions.currency ='USD\r';            -- 2
select count(*) from transactions where transactions.currency = "USD";         -- 2

select * from transactions where currency = "USD" or currency ="USD\r"; 
  
 
 -- revenue for 2020
 
select sum(transactions.sales_amount) from transactions inner join date
on transactions.order_date = date.date where date.year =2020 and currency = "INR" or currency ="INR\r";      -- 984823726 