---Find names of instructors with salary greater than that of some (at least one) instructor in the Biology department.

select distinct T.name
from instructor as T,instructor as S
where T.salary>S.salary and S.dept_name='Biology'

select name
from instructor
where salary>some(select salary
				  from instructor
				  where dept_name='Biology')

select name
from instructor
where salary>all (select salary
				  from instructor
				  where dept_name='Biology')

---“Find all courses taught in both the Fall 2009 semester and in the Spring 2010 semester”

select course_id
from section as S
where semester='Fall' and year=2009 and
             exists(select *
			        from section as T
					where semester='Spring' and year=2010
					and S.course_id=T.course_id)


select distinct S.ID,S.name
from student as S
where not exists((select course_id
				  from course
				  where dept_name='Biology')
				  except
				  (select T.course_id
				  from takes as T
				  where S.ID=T.ID))

---Find all courses that were offered at most once in 2009
select T.course_id
from course as T
where unique (select R.course_id
			  from section as R
			  where T.course_id=R.course_id
			  and R.year=2009)

---Find the average instructors’ salaries of those departments where the average salary is greater than $42,000.”

select dept_name,avg_salary
from (select dept_name,avg(salary)as avg_salary
	  from instructor
	  group by dept_name) as dept_avg (dept_name, avg_salary)
where avg_salary>42000;


--Find all departments with the maximum budget 
with max_budget(value)as (select max(budget)
						  from department)
select dept_name
from department,max_budget
where department.budget=max_budget.value

---Find all departments where the total salary is greater than the average of the total salary at all departments
with dept_total(dept_name,value)as
	(select dept_name,sum(salary)
	 from instructor
	 group by dept_name),
dept_total_avg(value) as
	                    (select avg(value)
					     from dept_total)
select dept_name
from dept_total,dept_total_avg
where dept_total.value>dept_total_avg.value;

---List all departments along with the number of instructors in each department
select dept_name,              
(select count(*)                 
from instructor                 
where department.dept_name = instructor.dept_name)as num_instructors
from department;

---Delete all instructors from the Finance department
delete from instructor                     
where dept_name= 'Finance';

---Delete all tuples in the instructor relation for those instructors associated with a department located in the Watson building.
delete from instructor                     
where dept_name in (select dept_name                                                        
from department                                                        
where building = 'Watson');

---Delete all instructors whose salary is less than the average salary of instructors
delete from instructor
where salary < (select avg (salary) 
                           from instructor);

---Increase salaries of instructors whose salary is over $100,000 by 3%, and all others by a 5% 

update instructor               
set salary = salary * 1.03               
where salary > 100000;          
update instructor                
 set salary = salary * 1.05                
 where salary <= 100000;

 --same
  update instructor               
  set salary = case                                      
              when salary <= 100000 
			  then salary * 1.05                                      
			  else salary * 1.03                                    
			   end



