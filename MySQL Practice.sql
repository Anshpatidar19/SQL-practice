create database Flipcart_db;
create table Products(
product_id serial primary key,
name varchar (100) not null,
sku_code char(8) unique not null,
price numeric(10,2) check (price>=0),
stock_quantity int default 0 check (stock_quantity >=0),
is_avaiable boolean default true,
category text not null,
last_update Timestamp default now() 
);
insert into products(name,sku_code,price,stock_quantity,is_avaiable,category)
values
('Wireless Mouse','WM123456',699.99,50,TRUE,'Electronics'),
('Bluetooth speaker','BS123456',1499.99,30,TRUE,'Electronics'),
('Laptop','LS123456',799.99,20,TRUE,'Accessories'),
('USB-c Hub','MX123456',1299.99,15,TRUE,'Accessories'),
('Notebook','UC123456',99.99,100,TRUE,'Stationery'),
('Pen Set','NB123456',199.99,200,TRUE,'Stationery'),
('Coffee Mug','CM123456',299.99,75,TRUE,'Home & Kitchen'),
('LED Desk Lamp','DL123456',899.99,40,TRUE,'Home & Kitchen'),
('Yoga Mate','YM123456',499.99,25,TRUE,'Fitness'),
('Water Bottle','WB123456',349.99,60,TRUE,'Fitness');

select * from products;
select name, price from products;
select * from products where category='Electronics';
select category,count(*)from products group by category Having count(*)>1;
select * from products order by name ASC; 
select * from products limit 3;
select name as Item_name, price as Item_price from products;
select Distinct category from products;
select * from products where category != 'Electronics';
select * from products where price < 1000 and category = 'Electronics';
select * from products where category in ('Electronics','Fitness','Home & Kitchen');
select * from products where sku_code like '_B%';
select * from products where not category = 'Electronics';
select count(product_id) from products;
select sum(price) from products ;
select sum(price) from products where category = 'Fitness';
select round(avg(price),2) from products ;
select min(price) from products;
select max(price) from products;

select name ,price from products where price = (select min(price) from products);
select avg(price) from products where category ='Home & Kitchen'or'Fitness';
select name, stock_quantity from products where is_avaiable = true and stock_quantity>=50 and price !=299;
SELECT category, name, price FROM products p 
WHERE price = (
    SELECT MAX(price)
    FROM products
    WHERE category = p.category
);
select distinct Upper(category) as category_upper from products order by category_upper desc;
select Upper(name) from products;
select lower(name) from products;
select length(name) from products;
select substring('Brother in arms',12,4);
select name ,substring(sku_code,1,2)from products;
select concat(name,' ',category) as product_with_category from products;
select concat_ws(':',name,category) as product_with_category from products;
select trim('   brother  ');
select name,replace(sku_code,left(sku_code,2),'GG') from products;