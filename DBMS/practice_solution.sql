---find all course taught in the Fall 2009 semester but not in the Spring  2010 semester.
(select course_id
from section
where semester='Fall' and year=2009)
except
(select course_id
from section
where semester='Spring' and year=2010)

---not in use
select course_id
from section
where semester='Fall' and year=2009 and 
course_id not in
(select course_id
from section
where semester='Spring' and year=2010)

---find all course taught in both the Fall 2009 semeter and in the Spring  2010 semester.
select course_id
from section as S
where semester='Fall' and year=2009 and
exists
(select *
from section as T
where semester='Spring' and year=2010 and 
      S.course_id=T.course_id)

--- in clause 
select course_id
from section
where semester='Fall' and year=2009 and 
course_id in
(select course_id
from section
where semester='Spring' and year=2010)
