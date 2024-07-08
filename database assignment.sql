/* ASSIGNMENT */
create database assignment1;
use assignment1;

create table student(rollno int primary key,name varchar(50),branch varchar(50));
insert into student values(1,"jay","computer science"),
(2,"suhani","electronic and com."),
(3,"kriti","electronic and com.");
create table exam(rollno int,s_code varchar(20),marks int , p_code varchar(50),foreign key(rollno) references student(rollno));
insert into exam values
(1,"CS11",50,"CS"),(1,"CS12",60,"CS"),(2,"EC101",60,"EC"),(2,"EC102",70,"EC"),(3,"EC101",45,"EC"),(3,"EC102",50,"EC");

/*2*/
create table emp1(employee_id int primary key,first_name varchar(50),last_name varchar(50),salary int,joining_date datetime,department varchar(50));
insert into emp1 values(1,"john","abraham",1000000,"2013-01-01 12:00:00","banking"),
(2,"micheal","clarke",800000,"2013-01-01 12:00:00","insurance"),
(3,"roy","thomas",700000,"2013-02-01 12:00:00","banking"),
(4,"tom","jose",600000,"2013-02-01 12:00:00","insurance"),
(5,"jerry","pinto",650000,"2013-02-01 12:00:00","insurance"),
(6,"philip","mathew",750000,"2013-01-01 12:00:00","services"),
(7,"testname1","123",650000,"2013-01-01 12:00:00","services"),
(8,"testname2","lname%",600000,"2013-02-01 12:00:00","insurance");
select * from emp1;


/*q-2 table incentive */
create table incentive(emp_ref_id int,incentive_date date,incentive_amount int,foreign key(emp_ref_id) references emp1(employee_id));
insert into incentive values(1,"2013-02-01",5000),(2,"2013-02-01",3000),(3,"2013-02-01",4000),(1,"2013-01-01",4500),(2,"2013-01-01",3500);
select * from emp1;
/*3*/
select first_name as Employee_name from emp1
where first_name="tom";
/*4*/
select joining_date,first_name,salary from emp1;
/*5*/
select * from emp
order by first_name asc, salary desc;
/*6*/
select * from emp1
where first_name like "j%";
/*7*/
select department, max(salary) from emp1
group by employee_id;
/*8*/
select department, max(salary) from emp1
group by employee_id
order by salary desc;
/*9*/
select first_name, incentive_amount 
from emp1 a
left join incentive b 
on a.employee_id=b.emp_ref_id
and incentive_amount>3000;
/*10*/
create trigger trg_afterinsert_emp1
after insert
DELIMITER //

create trg_after_insert_emp1
after insert on emp1
for each row
begin
    insert into view_table (employee_id,first_name,last_name,salary,joining_date,department)
    values (new.employee_id,new.first_name,new.last_name,new.salary,new.joining_date,new.department);
delimiter ;

/*11*/
create table salesperson (
sno int primary key,
sname varchar(255),
city varchar(255),
comm decimal(10,2)
);

insert into salesperson
values
(1,'Peel','London',.12),
(2,'Serres','San Jose',.13),
(3,'Motika','London',.11),
(4,'Rafkin','Barcelona',.15),
(5,'Axelrod','New York',.1);

select * from salesperson;


create table customer4(s_ref_no int,cnm int ,cname varchar(50),city varchar(50),rating int,foreign key (s_ref_no) references salesperson(sno));

insert into customer4 values
(1,201,'Hoffman','London',100),
(3,202,'Giovanne','Roe',200),
(2,203,'Liu','San Jose',300),
(2,204,'Grass','Barcelona',100),
(3,206,'Clemens','London',300),
(4,207,'Pereira','Roe',100);

/*12*/
select * from salesperson;
select * from customer4;
/*13*/
select *
from orders
where purch_amt > 1000;
/*14*/
select sname, city
from salesperson
where city = 'London' and comm > 0.12;

/*15*/
select * from salesperson
where city = 'Barcelona' or city = 'London';
/*16*/
select * from salesperson
where comm > 0.10 and comm < 0.12;
/*17*/
select * from customer4
where rating > 100 or (rating <= 100 and city = 'Rome');


/*18*/
create table salespeople (
    s_id int primary key,
    name varchar(50),
    city varchar(50),
    commission decimal(4, 2)
);

insert into salespeople (s_id, name, city, commission) values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);	

select * from salesperson;

create table orders(
ord_no  int primary key not null,
purch_amt int,
ord_date date,
customer_id int ,
salesman_id int);


insert into orders values
(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),
(70003,2480.4,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27', 3008,5002),
(70011,75.29,'2012-08-17',3003,5007),
(70013,3045.6,'2012-04-25',3002,5001); 

select * from orders;


/*19*/
select ord_no, ord_date, purch_amt
from orders
where salesman_id = 5001;

create table products (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(50),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM INT
);

insert into products (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) values
(101, 'Mother Board', 3200.00, 15),
(102, 'Key Board', 450.00, 16),
(103, 'ZIP drive', 250.00, 14),
(104, 'Speaker', 550.00, 16),
(105, 'Monitor', 5000.00, 11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer', 2600.00, 13),
(109, 'Refill cartridge', 350.00, 13),
(110, 'Mouse', 250.00, 12);
select * from products;

/*20*/
select PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM
from products
where PRO_PRICE between 200.00 and 600.00;

/*21*/
select avg(PRO_PRICE) as avg_price
from products
where PRO_COM = 16;

/*22*/
select PRO_NAME as "Item Name",PRO_PRICE as "Price in Rs."
from products;

/*23*/

select PRO_NAME as pro_name, PRO_PRICE as pro_price
from products
where PRO_PRICE >= 250.00
order by pro_price desc, pro_name asc;


/*24*/

select PRO_COM as company_code, avg(PRO_PRICE) as avg_price
from products
group by PRO_COM;


















