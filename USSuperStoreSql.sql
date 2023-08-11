create database SuperStore;
use SuperStore;
select count(*) from store;
describe store;
select * from store;

-- Which type of shipping mode is mostly preffered for each product category?
select `product category`,`product sub-category` ,`ship mode`,count(`ship mode`) as No_of_times_preferred
from store
group by `product category`
order by No_of_times_preferred desc;

-- Name the city,state,region,month,product,customer segment,sales and profit that contributed to the highest profit to the superstore?
select `city`,`State or province`,`region`,`order date`,`product name`,`product category`,`customer segment`,`sales`,round(sum(`profit`),2) as net_profit_of_this_category
from store
group by `product category`;

-- which customer's frequency of visiting is high? which customer has most profitted to this superstore?
-- I)
select `customer id`,`customer name`,count(`customer id`) as frequency_of_visiting
from store 
group by `customer id` having count(`customer id`)>1
order by count(`customer id`) desc
limit 1 ;
-- II)
select `customer id`,`customer name`,round(max(`profit`),2) as profit
from store
group by `customer id`
order by max(`profit`) desc 
limit 1;

-- which product category is the leading product category and name its most popular subcategory?
select `product category`,`product sub-category`,round(sum(`profit`),2) as net_profit from store 
group by `product category`;
-- office supplies is the leading product category that is making the most profit under pens & art supplies

-- which product the most popular in the superstore,its packaging style,customer segment,in which city?
-- how much profit it is making city-wise,company's net profit from it?
-- top buyer names of that product in each city?
-- I)
select `product name`,`Product Container`,round(sum(`profit`)) as net_profit,`city`,`customer segment`,`customer name`
from store
group by `product name`
order by sum(`profit`) desc
limit 1
;
-- II) & III)
select `product name`,`city`,`region`,round(sum(`profit`)) as net_profit ,`customer id`,`customer segment`,`customer name` from store
where `product name`='Fellowes PB500 Electric Punch Plastic Comb Binding Machine with Manual Bind'
group by `city` order by sum(`profit`) desc ;

desc store;
-- On whaich product, maximum discount discount is offered?
select `product name`,`profit`,`discount`,`customer segment` from store
where discount=(select max(discount) from store);
-- hence we can say that this product is the most unpopular product in the superstore

desc store;

-- Most Sold Product in the sub-Category in each region:
select Region,`Product Category`, `Product Sub-Category`,max(Sales) from store
group by Region having max(sales)
order by Region asc;

-- Most Profitted Product in the sub-Category in each region:
select Region,`Product Category`, `Product Sub-Category`,max(Profit) from store
group by Region having max(Profit)
order by Region asc;


-- CONCLUSION

-- 1 The supermarket is making total profit of nearly 2,12,433 USD
select round(sum(profit)) from store; 
-- 2 The dataset is of three months duration
-- 3 Most popular product in this superstore is 'Fellowes PB500 Electric punch plastic comb binder' and has most sales in the 'Farragaut' city of US
select `product name`,`city` from store group by `product name` order by sum(`sales`) desc limit 1;
-- 4 Customer who has high frequency of visiting in the superstore is 'Jenny Gold' having total visitings =9
-- 5 Customer who has profitted most to the superarket is 'Nina Horne Kelly' from Washington in the east region
select `customer id`,`customer name`,`region`,`city`,round(max(`profit`),2) as profit from store group by `customer id` order by max(`profit`) desc  limit 1;
-- 5 The superstore is making most profit from its branch in the ROSELLE city of US in the EAST
-- 6  The superstore is making most loss from its branch in the Salem City of US in the SOUTH
select `city`,`region`,round(sum(`profit`)) from store group by `region` order by sum(`profit`) desc;






