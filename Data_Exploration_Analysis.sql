--drop table if exists zepto;

--creating table

create table zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,	
quantity INTEGER
);



--Data Exploration

select * from zepto limit 10;

select count(*) from zepto;


--null values
select * from zepto where category is NULL or 
name is null or mrp is null or discountpercent is null or availablequantity is null or discountedsellingprice is null
or weightingms is null or outofstock is null or quantity is null;

-- distinct categories

select distinct category from zepto;

--product in stock vs out of stock

select * from zepto;

select outofstock,count(sku_id) from zepto group by outofstock;

--product names present multiple times

select name, count(sku_id) as total_items from zepto
group by name 
having count(sku_id) >1 
order by total_items desc;

--data cleaning

--products with price = 0

select * from zepto where mrp = 0 or discountedsellingprice = 0;

delete from zepto where sku_id = 3607;

----convert paise to rupees

update zepto set mrp = mrp/100 , discountedsellingprice = discountedsellingprice/100;

--data analysis

-- Q1. Find the top 10 best-value products based on the discount percentage.

select distinct name, mrp, discountpercent as dp from zepto order by dp desc limit 10;

--Q2.What are the Products with High MRP but Out of Stock

select * from zepto order by sku_id;

select distinct name, mrp, outofstock from zepto where outofstock = 'True' and mrp > 300 order by mrp desc;

--Q3.Calculate Estimated Revenue for each category

select category,sum(discountedsellingprice * availablequantity) as total_revenue from zepto 
group by category order by total_revenue desc;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

select distinct name, mrp, discountpercent from zepto where mrp > 500 and discountpercent < 10 order by mrp,discountpercent;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.

select category , round(AVG(discountpercent),2) as avg_discount_percent from zepto group by category order by avg_discount_percent desc limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.

select distinct name, weightingms, discountedsellingprice ,round(discountedsellingprice/weightingms,2) as price_per_gms
from zepto where weightingms >= 100 order by price_per_gms,weightingms;

--Q7.Group the products into categories like Low, Medium, Bulk

select distinct name, weightingms, 
case when weightingms < 1000 then 'low'
     when weightingms < 5000 then 'Medium'
	 else 'bulk' 
	 end as weightedcatgory from zepto;

select distinct name, count(sku_id), weightingms, 
case when weightingms < 1000 then 'low'
     when weightingms < 5000 then 'Medium'
	 else 'bulk' 
	 end as weightedcategory from zepto group by weightedcategory , weightingms, name;

--Q8.What is the Total Inventory Weight Per Category 

select * from zepto;

select category, round(sum(weightingms * availablequantity)/1000,2) as total_weightingkgs
from zepto group by category order by total_weightingkgs;
	 