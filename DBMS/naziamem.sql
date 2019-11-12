
create table Student(
Student_id varchar(20) not null primary key ,
Name varchar(20) not null,
Contact_no varchar(20),
Section varchar(20),
Home_Town varchar(20),
CGPA numeric(3,2),
gpa numeric(3,2),
)
insert into Student(Student_id,Name,Contact_no,Section,Home_Town,CGPA,gpa)
values
      ('CSE 066 07000','Mr.x','017111111111','66','Khulna',null,null),
      ('CSE 066 07001','Mr.Y','018111111111','66','Dhaka',3.51,3.44),
	  ('CSE 066 07002','Mr.Z','019111111111','66','Dhaka',3.51,3.44),
	  ('CSE 066 07003','Mr.XX','012111111111','66','Dhaka',3.50,3.45),
	  ('CSE 066 07004','Mr.YY','013111111111','66','Dhaka',3.53,3.47),
	  ('CSE 066 07005','Mr.ZZ','014111111111','66','Dhaka',3.55,3.47),
	  ('CSE 066 07010','Mr.Y',null,null,null,NULL,NULL)


select Student_id,Name,gpa as Studentinfo
from Student
where gpa !=0
order by gpa desc


select avg(CGPA) as CGPA_AVG
from Student
where CGPA in (select CGPA
					 from Student
					 where CGPA != 0)

