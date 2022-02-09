  drop view managers

  create view managers as
  select e.emp_no, e.first_name, e.last_name, 
  d.dept_no, m.emp_no as manager
  from employees e
  join dept_emp d using (emp_no)
  join dept_manager m Using (dept_no)
  where m.to_date = '9999-01-01'

  select v.emp_no, 
  (v.first_name || ' ' || v.last_name ) as employee,
  v.dept_no,
  (v2.first_name || ' ' || v2.last_name ) as manager
  from managers v
  join managers v2 on v.manager = v2.emp_no

  select  
  v.dept_no,
  
  (v2.first_name || ' ' || v2.last_name ) as manager1,
  count(v.emp_no)
  from managers v
  join managers v2 on v.manager = v2.emp_no
  group by manager1, v.dept_no
  having count(v.emp_no)>50000

  select  
  v.dept_no,
  
  (v2.first_name || ' ' || v2.last_name ) as manager1,
  count(v.emp_no)
  from managers v
  join managers v2 on v.manager = v2.emp_no
  group by manager1, v.dept_no
  having count(v.emp_no)>50000


  select  
  v.dept_no,
  v.last_name,
  (v2.first_name || ' ' || v2.last_name ) as manager1,
  count(v.emp_no)
  from managers v
  join managers v2 on v.manager = v2.emp_no
  group by 
  grouping sets
  ((v.last_name),(v.dept_no),(manager1)
  )
  having count(v.emp_no)>50000
  order by dept_no

/*
*  From ZTM academy
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/

  select e.emp_no, count(t.title)
  from employees e 
  join titles t using (emp_no)
  where extract (year from e.hire_date)>1991
  group by e.emp_no
  having count(title)>1
  order by e.emp_no

  drop view big_salary

  create view big_salary as
  select e.emp_no, e.first_name, e.last_name, d.dept_no, t.title, s.salary
  from employees e
  join titles t using(emp_no)
  join salaries s using(emp_no)
  join dept_emp d using (emp_no)
  where s.to_date = '9999-01-01'



  select * from big_salary



  select emp_no, first_name, last_name,dept_no, title, salary, 
  avg(salary) over () as all_avg,
  avg(salary) over (
  partition by  dept_no,title
  order by dept_no  
  ) as dept_avg  
  from big_salary



  select * from big_salary
  where salary < (select avg(salary) from big_salary)


  
  select first_name, last_name from big_salary
  where salary In (select salary from big_salary
  where salary < (select avg(salary) from big_salary))

