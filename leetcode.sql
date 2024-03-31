select name from Customer where referee_id!=2 or referee_id is null;
# Write a solution to find the IDs of the users who visited without making any transactions 
# and the number of times they made these types of visits. Return the result table sorted in any order.
# Write your MySQL query statement below
select v.customer_id, count(v.visit_id) as count_no_trans
from Visits v 
left join Transactions t on v.visit_id= t.visit_id
where t.transaction_id is null 
group by v.customer_id; 


select e.name,b.bonus
from Employee e
left join Bonus b on e.empID= b.empId
where b.bonus<1000 or b.bonus is null ; 

/* Write a solution to find the number of times each student attended each exam.

Return the result table ordered by student_id and subject_name.

The result format is in the following example. */
# Write your MySQL query statement below
select s.student_id, s.student_name, sub.subject_name, count( e.subject_name) as attended_exams
from Students s
cross join Subjects sub
left join Examinations e on e.student_id = s.student_id and e.subject_name= sub.subject_name
group by s.student_id, sub.subject_name, s.student_name
order by s.student_id, sub.subject_name;



/* Write a solution to find managers with at least five direct reports.

Return the result table in any order.

The result format is in the following example.*/

select name from Employee 
where id IN (select managerID from Employee group by managerID 
having count(*) >=5  );

/* Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.*/

select w1.id from Weather w1 join Weather w2 
on DATEDIFF (w1.recordDate, w2.recordDate) = 1
where w1.temperature> w2.temperature;

/* w1 and w2 are aliases for the same Weather table. These aliases are used to represent two instances of the 
same table, allowing you to compare different rows within the same table.
Join Condition:
join Weather w2 on DATEDIFF(w1.recordDate, w2.recordDate) = 1: This is a self-join on the Weather table. 
It joins the table with itself using the condition that the difference in days (DATEDIFF) between the recordDate 
of w1 and w2 is equal to 1. This means that w1 is the record for the day after w2.
Comparison Condition:

where w1.temperature > w2.temperature: This is the filter condition. It selects only those rows 
where the temperature on the day represented by w1 is greater than the temperature on the previous day (w2).  */


/* There is a factory website that has several machines each running the same number of processes. Write a solution 
to find the average time each machine takes to complete a process.

The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time 
is calculated by the total time to complete every process on the machine divided by the number of processes that were run.

The resulting table should have the machine_id along with the average time as processing_time, which should be rounded 
to 3 decimal places. (ROUND) 

Return the result table in any order.*/

# Write your MySQL query statement below
select a1.machine_id, round(avg(a2.timestamp- a1.timestamp),3) as processing_time 
from Activity a1
join Activity a2 on a1.machine_id = a2.machine_id 
and a1.process_id = a2.process_id 
and a1.activity_type= 'start'
and a2.activity_type= 'end'
group by a1.machine_id; 

/* The confirmation rate of a user is the number of 'confirmed' messages divided by 
the total number of requested confirmation messages. 
The confirmation rate of a user that did not request any confirmation messages is 0. 
Round the confirmation rate to two decimal places.

Write a solution to find the confirmation rate of each user.

Return the result table in any order. */

# Write your MySQL query statement below
select s.user_id, round(avg(if (c.action= 'confirmed', 1,0)),2) as confirmation_rate
from Signups s
left join Confirmations c on s.user_id= c.user_id
group by s.user_id; 
/* Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places.

Return the result table in any order.*/
/* The MySQL IFNULL() function lets you return an alternative value if an expression is NULL:
IFNULL(...,0) */
select p.product_id, IFNULL(round(sum(p.price * u.units)/sum(u.units), 2),0) as average_price
from Prices p
left join UnitsSold u on p.product_id = u.product_id
and u.purchase_date between p.start_date and p.end_date
group by p.product_id; 


select p.project_id, IFNULL (round(sum(e.experience_years)/count(p.employee_id),2),0) as average_years
from Project p
left join Employee e on p.employee_id = e.employee_id
group by p.project_id;

select p.project_id, IFNULL (round(avg(e.experience_years),2),0) as average_years
from Project p
left join Employee e on p.employee_id = e.employee_id
group by p.project_id;



/* Write a solution to find the percentage of the users registered in each contest rounded to two decimals.

Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

The result format is in the following example. */


# Write your MySQL query statement below
select contest_id, 
round(count(distinct user_id)*100/ (select count(user_id) from Users), 2) as percentage
from Register
group by contest_id
order by percentage DESC, contest_id;
/* We define query quality as:
The average of the ratio between query rating and its position.
We also define poor query percentage as:
The percentage of all queries with rating less than 3.
Write a solution to find each query_name, the quality and poor_query_percentage.
Both quality and poor_query_percentage should be rounded to 2 decimal places.
Return the result table in any order.
The result format is in the following example. */

select query_name,
round(avg(rating/position),2) as quality,
round(sum(rating<3)* 100/count(*),2) as poor_query_percentage
from Queries
group by query_name
having query_name is not null;
/* Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

Return the result table in any order.

The query result format is in the following example. */

# Write your MySQL query statement below
select DATE_FORMAT(trans_date, '%Y-%m') as month,
country,
count(id) as trans_count,
SUM(CASE WHEN state= 'approved' THEN 1 ELSE 0 end) AS approved_count,
SUM(amount) as trans_total_amount,
sum(case when state= 'approved' then amount else 0 end ) as approved_total_amount
from Transactions
group by country, month;

/* If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.

The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.

Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

The result format is in the following example.*/

select round(sum(case when order_date= customer_pref_delivery_date then 1 else 0 end )*100/count(distinct customer_id), 2) 
as immediate_percentage
from Delivery
where (customer_id, order_date) in 
(select customer_id, min(order_date) as the_first_order from Delivery group by customer_id );

select product_id, year as first_year, quantity, price
from Sales 
where (product_id, year) in (select product_id, min(year) from Sales group by product_id);
/* A single number is a number that appeared only once in the MyNumbers table.

Find the largest single number. If there is no single number, report null. */

select max(num) as num
from
(select max(num) as num from MyNumbers 
group by num 
having count(num)= 1) as unique_numbers;

select customer_id from Customer group by customer_id 
having count(distinct product_key) = (select count(product_key) from Product);

/* Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.

Return the result table in any order.

The result format is in the following example.*/ 
select distinct p1.email from Person p1, Person p2
where p1.id <> p2.id and p1.email = p2.email

/* Write a solution to find the rank of the scores. The ranking should be calculated according to the following rules:

The scores should be ranked from the highest to the lowest.
If there is a tie between two scores, both should have the same ranking.
After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
Return the result table ordered by score in descending order.

The result format is in the following example.*/
select score, dense_rank() over (order by score DESC) as 'rank'
from Scores
order by score DESC;




