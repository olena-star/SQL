use hr;

select * from employees;

select first_name,last_name,department_id
from employees where department_id = 90 ;

select first_name,last_name,salary 
from employees where salary >5000;

select first_name, last_name
from employees where last_name like 'L%';

select * from departments;
select department_name,location_id
from departments where location_id = 1700;

select* from locations;
select city, country_id
from locations where country_id like 'US' ;
