CREATE TABLE customer_data (
    customer_id VARCHAR(20) PRIMARY KEY,
    age_group VARCHAR(10),
    city VARCHAR(50),
    occupation VARCHAR(100),
    gender VARCHAR(10),
    marital_status VARCHAR(10),
    avg_income INT
);

CREATE TABLE customer_spend (
    customer_id VARCHAR(20),
    month VARCHAR(20),
    category VARCHAR(50),
    payment_type VARCHAR(20),
    spend INT);

--Get all customers who are married.
select customer_id 
from customer_data 
where marital_status='Married';

--Find the total number of customers in each city.
select city,count(*) as c from customer_data
group by city
order by c;

--Show the total spends for each customer 
select customer_id, sum(spend) as total_amount_spent
from customer_spend
group by customer_id
order by total_amount_spent desc;

--customers who spent in the 'Electronics' category
select distinct customer_id,category
from customer_spend
where category='Electronics';

---count of customers in each category
select category,count(*)
from customer_spend
group by category
order by count;

--sales spend in each category

select category,sum(spend) as spendings
from customer_spend
group by category
order by spendings desc;

--Find the average spend for each payment type
select payment_type,round(avg(spend),2) as avg_spend
from customer_spend
group by payment_type
order by avg_spend desc;

--List the total amount spent by each customer in the month of May.
select customer_id,sum(spend) from customer_spend
where month='May'
group by customer_id;

--Get the number of customers in each occupation
select occupation,count(*) from customer_data
group by occupation
order by count(*) desc;

--Retrieve the details of customers who are in the age group '25-34'
select customer_id
from customer_data 
where age_group='25-34';

--List all customers who spent using Debit Card.
select customer_id 
from customer_spend
where payment_type='Debit Card';

--Get the total spend for each age group in the Entertainment category.
select cd.age_group,sum(cs.spend) as spendings
from customer_data cd
join customer_spend cs
on cd.customer_id=cs.customer_id
group by age_group;

--Find the highest spend by a customer in the 'Food' category in the month of October.
select max(spend) from customer_spend
where category='Food' and
month='October';

--Show the average income of customers in each occupation.
select occupation,
round(avg(avg_income),2) as average_income
from customer_data
group by occupation
order by average_income desc;

--Show all customers who spent in the 'Electronics' category, including their name and age group.
select cd.customer_id,cd.age_group 
from customer_data cd
join customer_spend cs 
on cd.customer_id=cs.customer_id
where cs.category='Electronics'
order by cd.age_group;

--Find the total spends per customer 
select customer_id ,sum(spend) as spendings
from customer_spend
group by customer_id
order by customer_id;

-- Find the total spend for each city
select cd.city,sum(cs.spend)
from customer_spend cs
join customer_data cd
on cs.customer_id=cd.customer_id
group by cd.city
order by city;

--Show the average income of customers who spent 
--on 'Entertainment' in the month of July.
select round(avg(cd.avg_income),2) as average_income
from customer_data cd
join customer_spend cs
on cd.customer_id=cs.customer_id
where cs.category='Entertainment' and cs.month='July';

--Show the total spend per customer by age group and category.
select cd.age_group,sum(cs.spend) as spendings
from customer_spend cs
join customer_data cd
on cd.customer_id=cs.customer_id
group by cd.age_group
order by spendings;


