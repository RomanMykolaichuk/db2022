-- DROP TABLE IF EXISTS employees;

-- CREATE TABLE employees(
--    id INT GENERATED ALWAYS AS IDENTITY,
--    first_name VARCHAR(40) NOT NULL,
--    last_name VARCHAR(40) NOT NULL,
--    balance money not null,
--    PRIMARY KEY(id)
-- );

-- DROP TABLE IF EXISTS employee_audits;
-- CREATE TABLE employee_audits (
--    id INT GENERATED ALWAYS AS IDENTITY,
--    employee_id INT NOT NULL,
--    last_name VARCHAR(40) NOT NULL,
--    differ money not null,
--    changed_on TIMESTAMP(6) NOT NULL
-- );

-- INSERT INTO employees (first_name, last_name,balance)
-- VALUES ('John', 'Doe',1000);
-- 
-- INSERT INTO employees (first_name, last_name, balance)
-- VALUES ('Lily', 'Bush',1000);

-- psql \! chcp 1251

-- select * from employees

-- create or replace procedure transfer(
-- sender int,
-- receiver int,
-- amount money
-- )
-- 
-- language plpgsql
-- 
-- as $$
-- 
-- begin
-- 
-- update employees set balance = balance + amount
-- where id = receiver;
-- 
-- update employees set balance = balance - amount
-- where id = sender;
-- 
-- if exists (select * from employees where balance <0::money)
-- then rollback;
-- else commit;
-- end if;
-- 
-- end;
-- 
-- $$;
-- 


-- call transfer(2,3,300::money);

-- create or replace function log_transfer()
-- returns trigger
-- language plpgsql
-- as $$ 
-- begin
--  if NEW.balance<>OLD.balance
--  then insert into employee_audits(
--  employee_id,last_name, differ, changed_on)
--  values(NEW.id,NEW.last_name, NEW.balance-OLD.balance,current_timestamp); 
--  end if;
-- 
-- return NEW;
-- end;
-- $$;

-- create trigger balance_audit
-- before update
-- on employees
-- for each row
-- execute procedure log_transfer();
-- 

-- select * from employee_audits

-- call transfer(2,3,300::money)


-- select * from employees