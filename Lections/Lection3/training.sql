create view managers as
select e.emp_no,e.first_name,e.last_name,d.dept_no,m.emp_no as manager
from employees e
join dept_emp d using (emp_no)
join dept_manager m using (dept_no)
where m.to_date = '9999-01-01'


select v.emp_no, (v.first_name || ' ' ||   v.last_name) as Employee,
v.dept_no, v2.manager, (v2.first_name || ' ' ||   v2.last_name) as Manager  
from managers v
join managers v2 on v.manager=v2.emp_no



select   v.first_name,(v2.first_name || ' ' ||   v2.last_name) 
as Emp_Manager, v.dept_no,  count(v.emp_no) as subordinates_amount
from managers v
join managers v2 on v.manager=v2.emp_no
group by 
grouping sets ( (v.first_name),(v.dept_no,Emp_Manager))
having count(v.emp_no)>290
order by dept_no, subordinates_amount desc


/*
*  From ZTM academy
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/

SELECT e.emp_no, count(t.title) as "amount of titles"
FROM employees as e
JOIN titles as t USING(emp_no)
WHERE EXTRACT (YEAR FROM e.hire_date) > 1991
GROUP BY e.emp_no
HAVING count(t.title) > 2
ORDER BY e.emp_no;


create view big_salary as
select e.emp_no, (e.first_name || ' ' ||   e.last_name) as fullname, t.title, d.dept_no, s.salary
from employees e
join titles t using (emp_no)
join dept_emp d using (emp_no)
join salaries s using(emp_no)
where t.to_date='9999-01-01' and d.to_date='9999-01-01' and s.to_date='9999-01-01'

select emp_no, fullname, title, dept_no, salary, 
avg(salary) over(
partition by dept_no
order by title
) 
from big_salary


select emp_no, fullname, title, dept_no, salary, 
avg(salary) over(
partition by dept_no
order by title
) ,
salary-min(salary) over(
partition by dept_no
order by title
)
from big_salary




