CREATE TABLE cars (
car_id INT PRIMARY KEY,
make VARCHAR(50),
type VARCHAR(50),
style VARCHAR(50),
cost_$ INT
);

INSERT INTO cars (car_id, make, type, style, cost_$)
VALUES (1, 'Honda', 'Civic', 'Sedan', 30000),
(2, 'Toyota', 'Corolla', 'Hatchback', 25000),
(3, 'Ford', 'Explorer', 'SUV', 40000),
(4, 'Chevrolet', 'Camaro', 'Coupe', 36000),
(5, 'BMW', 'X5', 'SUV', 55000),
(6, 'Audi', 'A4', 'Sedan', 48000),
(7, 'Mercedes', 'C-Class', 'Coupe', 60000),
(8, 'Nissan', 'Altima', 'Sedan', 26000);

CREATE TABLE salespersons (
salesman_id INT PRIMARY KEY,
name VARCHAR(50),
age INT,
city VARCHAR(50)
);

INSERT INTO salespersons (salesman_id, name, age, city)
VALUES (1, 'John Smith', 28, 'New York'),
(2, 'Emily Wong', 35, 'San Fran'),
(3, 'Tom Lee', 42, 'Seattle'),
(4, 'Lucy Chen', 31, 'LA');

Create table Sales (
sale_id int primary key,
car_id int,
salesman_id int,
Purchase_Date date,
foreign key(salesman_id) references salespersons(salesman_id),
foreign key(car_id) references cars(car_id)
);

insert into Sales (sale_id,car_id,salesman_id,Purchase_Date)
values(1,1,1,'2021-01-01'),
(2, 3, 3, '2021-02-03'),
(3, 2, 2, '2021-02-10'),
(4, 5, 4, '2021-03-01'),
(5, 8, 1, '2021-04-02'),
(6, 2, 1, '2021-05-05'),
(7, 4, 2, '2021-06-07'),
(8, 5, 3, '2021-07-09'),
(9, 2, 4, '2022-01-01'),
(10, 1, 3, '2022-02-03'),
(11, 8, 2, '2022-02-10'),
(12, 7, 2, '2022-03-01'),
(13, 5, 3, '2022-04-02'),
(14, 3, 1, '2022-05-05'),
(15, 5, 4, '2022-06-07'),
(16, 1, 2, '2022-07-09'),
(17, 2, 3, '2023-01-01'),
(18, 6, 3, '2023-02-03'),
(19, 7, 1, '2023-02-10'),
(20, 4, 4, '2023-03-01');

select * from cars
select * from sales
select * from salespersons

select c.car_id,c.make,c.type,c.style,c.cost_$,s.Purchase_Date as carpurchaseyear from cars as c
join sales as s
on c.car_id=s.car_id
where year(Purchase_Date)=2022;




select count(*) as totalsales, sp.name   from cars as c
join sales as s
on c.car_id=s.car_id
join salespersons as sp
on sp.salesman_id=s.salesman_id
group by sp.salesman_id;

select sp.salesman_id,sum(c.cost_$) as total_revenue,sp.name from cars as c
join sales as s
on c.car_id=s.car_id
join salespersons as sp
on sp.salesman_id=s.salesman_id
group by sp.salesman_id;

select c.make,c.type,c.style,sp.salesman_id,sp.name from cars as c
join sales as s
on c.car_id=s.car_id
join salespersons as sp
on sp.salesman_id=s.salesman_id;

select c.type,sum(c.cost_$) as total_revenue from cars as c
join sales as s
on c.car_id=s.car_id
group by c.type;

select sp.salesman_id,sp.name,c.make,c.type,c.style,year(s.purchase_date) from cars as c
join sales as s
on c.car_id=s.car_id
join salespersons as sp
on sp.salesman_id=s.salesman_id
where sp.name= 'Emily Wong' and year(s.Purchase_Date)=2021;


select c.style,sum(c.cost_$) as total_revenue from cars as c
join sales as s
on c.car_id=s.car_id
where c.style='hatchback';

select year(s.purchase_date),c.style,sum(c.cost_$) as total_revenue from cars as c
join sales as s
on c.car_id=s.car_id
and c.style='SUV' and year(s.purchase_Date)=2022
group by c.style,year(s.purchase_date);


select count(*) as totalsales, sp.name,sp.city,year(s.purchase_Date),sp.salesman_id  from cars as c
join sales as s
on c.car_id=s.car_id
join salespersons as sp
on sp.salesman_id=s.salesman_id
where year(s.purchase_Date)=2023
group by sp.salesman_id,year(s.purchase_Date)
order by totalsales desc
limit 1;


select sp.salesman_id,sum(c.cost_$) as total_revenue,sp.name,sp.age,year(s.purchase_Date)as purchaseyear from cars as c
join sales as s
on c.car_id=s.car_id
join salespersons as sp
on sp.salesman_id=s.salesman_id
where year(s.purchase_Date)=2022
group by sp.salesman_id,year(s.purchase_Date)
order by total_revenue desc limit 1;































