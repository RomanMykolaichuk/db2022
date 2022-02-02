-- select * from employees
-- where emp_no=10001;

-- select emp_no, first_name, last_name,hire_date
-- from employees;

-- select emp_no as "Працівник", concat(first_name, ' ',last_name) as "Full name" ,hire_date
-- from employees;

-- select count(first_name) from employees;

/*select avg(salary)from salaries
where from_date>'2000-01-01'::date;*/

-- select max(from_date) from salaries;

-- select distinct dept_no from dept_emp

-- select distinct * from dept_emp
-- where dept_no='d001' and to_date='9999-01-01' and from_date>'2000-01-01';

-- select * from employees 
-- where last_name='Facello' and (first_name='Georgi' or first_name='Kirk');

-- insert into departments (dept_no)
-- values('d010');

-- alter table departments add some_column integer;
-- select * from departments;


-- SELECT * from departments 
-- where not some_column isnull;
-- 
-- update departments set some_column=1 
-- where dept_no>'d005'
-- 

-- select *, COALESCE(some_column, '2') from departments;
-- 
-- select * from employees 
-- where first_name ILike  'g%';

-- Between and, IN (,,,), Like, ILike

-- select * from employees 
-- where cast(emp_no as text) like '1011%';

-- select * from employees 
-- where emp_no :: text like '1011%';
-- 
-- select first_name, last_name from employees
-- Where first_name like 'G%'
-- Order by first_name, last_name;

-- select em.first_name, em.last_name, t.title
-- from employees as em, titles t
-- where em.emp_no=t.emp_no and t.to_date='9999-01-01';

select em.first_name, em.last_name, t.title, s.salary
from employees as em 
join titles as t
on em.emp_no=t.emp_no
join salaries as s
on s.emp_no=em.emp_no
where  t.to_date='9999-01-01';







