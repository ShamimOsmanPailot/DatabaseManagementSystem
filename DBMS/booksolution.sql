create table employee(
	employee_name varchar(20) not null,
	street varchar(25),
	city varchar(20),
	primary key (employee_name)
)

insert into employee(employee_name,street,city)
values('shamim','horinadi 3400','Brahmanbaria'),
	  ('karim','horinadi 3400','Brahmanbaria');

create table works(
	employee_name varchar(20) not null,
	company_name varchar(25),
	salary int
	primary key(employee_name)
)

insert into works(employee_name,company_name,salary)
values('Raihan','First Bank Corporation',80000),
      ('shamim','First Bank Corporation',56000),
	  ('zBsmi;','itbaari',454545),
	  ('jalal','sparkme',80000);

create table company(
	company_name varchar(25),
	city varchar(20),
	primary key(company_name)
)


create table manages(
	employee_name varchar(20) not null,
	manager_name varchar(20) not null
)



---ans to the ques no:a
select employee.employee_name,city
from employee,works
where  works.company_name='First Bank Corporation' and employee.employee_name=works.employee_name

---same

select e.employee_name,city
from employee as e,works as w
where  w.company_name='First Bank Corporation' and e.employee_name=w.employee_name

---ans to the ques no:b
select *  --doublicate column value show here.
from employee as e,works as w
where  w.company_name='First Bank Corporation' and e.employee_name=w.employee_name and w.salary>10000

---s1
select *
from employee
where employee_name in(
				   select employee_name
				   from works
				   where salary>10000)
---s2
select  e.employee_name,e.street,e.city
from employee as e,works as w
where  w.company_name='First Bank Corporation' and e.employee_name=w.employee_name and w.salary>10000

---ans to the ques no:c
---s1
select employee_name ---solution is wrong
from works
where company_name !='First Bank Corporation'

---s2
select employee_name
from employee
where employee_name not in(
				   select employee_name
				   from works
				   where company_name !='First Bank Corporation')

---ans to the ques no:d

---s1
select employee_name
from works
where salary>all(select salary
					from works
					where company_name='Small Bank Corporation')


with emp_total_salary as (select employee_name, sum(salary) as total_salary
					      from works 
					      group by employee_name) 
select employee_name
from emp_total_salary
where total_salary > all 
						(select total_salary 
						 from emp_total_salary, works 
						 where works.company_name = 'Small Bank Corporation' and emp_total_salary.employee_name = works.employee_name )

---ans to the ques no :e
select company_name
from company
where city

