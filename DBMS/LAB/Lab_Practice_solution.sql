---Ans to the ques no:01
create database Lab2
create table customer(
 C_id numeric(6,0) not null,
 name varchar (15) not null,
 Brahch char(10) ,
 Gender char(10),
 Savings numeric(6,0)
);

insert into customer(C_id,name,Brahch,Gender,Savings)
values(101,'Rahim','Gulshan','Male',10000),
      (102,'Karim','Banani','Male',20000),
	  (103,'John','Gulshan','Male',10500),
	  (104,'Akber','Dhanmondi','Male',40000),
	  (105,'Sahid','Baridhora','Male',35000),
	  (106,'Mila','Banani','Female',85000),
	  (107,'Sarah','Malibag','Female',58000);

select *
from customer


---Ans to the ques no:02
select name
from customer
where Brahch='Banani' or Brahch='Gulshan'

---Ans to the ques no:03
select *
from customer
where  ((Savings>=40000 and Savings<=60000 )and exists (select *
											 from customer
											 where Brahch='Banani'))