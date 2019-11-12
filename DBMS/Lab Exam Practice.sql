create database Lab2
--Ans to the ques  no:1
create table Customer(
C_id int identity(101,1),
name varchar(15)not null,
Branch varchar(15)not null,
Gender varchar(10),
Savings int not null
)

insert into Customer(name,Branch,Gender,Savings)
values
('Rahim','Gulshan','Male',10000),
('Karim','Banani','Male',20000),
('John','Gulshan','Male',10500),
('Akber','Dhanmondi','Male',40000),
('Sahid','Baridhora','Male',35000),
('Mila','Banani','Female',85000),
('Sarah','Malibag','Female',58000);
select *
from Customer;
drop table Customer

--Ans to the ques no:2--
select name
from Customer
where Branch='Banani' or Branch='Gulshan';
--Ans to the ques no:3--
select *
from Customer
where Gender='Female' and Savings between 40000 and 60000 and Branch='Banani' 

--Ans to the ques no:4--

Alter table Customer
Add Withdraw varchar(255)

update Customer
set Withdraw=500
where C_id between 103 and 107;



--Ans to the ques no:5--
select name
from Customer
where name like '%im'

--Ans to the ques no:6--
select min(Savings) as Low_Saving
from Customer
--Ans to the ques no:7--
update Customer
set Branch='Banani'
where C_id=101

--Ans to the ques no:8--
delete from Customer
where C_id=107

