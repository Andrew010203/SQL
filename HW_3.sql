--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами
select employee.employee_name, salary.monthly_salary
from employee
inner join salary on employee.id = salary.id;
-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employee.employee_name, salary.monthly_salary
from employee
inner join salary on employee.id = salary.id
where monthly_salary < 2000;
--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_id, monthly_salary
from employee_salary
right join salary
on employee_salary.id = salary.id
where employee_id is null;
-- 4. Вывести все зарплатные позиции меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_id, monthly_salary
from employee_salary
right join salary
on employee_salary.id = salary.id
where employee_id is null and monthly_salary < 2000;
--5. Найти всех работников кому не начислена ЗП
select employees_name, salary.monthly_salary
from employees 
left join employee_salary 
on employees.id = employee_salary.employee_id 
left join salary on salary.id = employee_salary.salary_id
where monthly_salary is null;
-- 6. Вывести всех работников с названиями их должности.
select employee_name, role_name 
from roles_employee 
join roles on roles_employee.role_id = roles.id 
join employee on roles_employee.employee_id = employee.id;
-- 7. Вывести имена и должность только Java разработчиков.
select employees.employees_name, role_name 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
where role_name like '%Java%';
-- 8. Вывести имена и должность только Python разработчиков.
select employees.employees_name, role_name 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
where role_name like '%Python%';
-- 9. Вывести имена и должность всех QA инженеров.
select employees.employees_name, role_name 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
where role_name like '%QA engineer';
--10. Вывести имена и должность ручных QA инженеров.
select employees.employees_name, role_name 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
where role_name like '%Manual QA engineer';
-- 11. Вывести имена и должность автоматизаторов QA
select employees.employees_name, role_name 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
where role_name like '%Automation QA engineer';
-- 12. Вывести имена и зарплаты Junior специалистов
select employees.employees_name, monthly_salary 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
inner join salary on employees.id = salary.id
where role_name like 'Junior%';
--13. Вывести имена и зарплаты Middle специалистов
select employees.employees_name, monthly_salary 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
inner join salary on employees.id = salary.id
where role_name like 'Middle%';
--14. Вывести имена и зарплаты Senior специалистов
select employees.employees_name, monthly_salary 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
inner join salary on employees.id = salary.id
where role_name like 'Senior%';
--15. Вывести зарплаты Java разработчиков
select monthly_salary 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
inner join salary on employees.id = salary.id
where role_name like '%Java developer';
-- 16. Вывести зарплаты Python разработчиков
select monthly_salary 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
inner join salary on employees.id = salary.id
where role_name like '% Python developer';
--17. Вывести имена и зарплаты Junior Python разработчиков
select employees.employees_name, monthly_salary 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
join salary on employees.id = salary.id
where role_name like 'Junior Python developer';
-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employees.employees_name, monthly_salary 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
join salary on employees.id = salary.id
where role_name like 'Middle JavaScript developer';
-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employees.employees_name, monthly_salary 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
join salary on employees.id = salary.id
where role_name like 'Senior Java developer';
--20. Вывести зарплаты Junior QA инженеров
select roles.role_name, salary.monthly_salary
from employees 
left join roles_employee on employees.id = roles_employee.employee_id 
left join roles on roles.id = roles_employee.role_id
left join employee_salary on employees.id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id
where role_name like '%Junior _% QA%';
--21. Вывести среднюю зарплату всех Junior специалистов
select round(AVG(monthly_salary), 2) as "Средняя зп", roles.role_name
from employee_salary
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Junior%'
group by 2;
--22. Вывести сумму зарплат JS разработчиков
select SUM(monthly_salary) 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
inner join salary on employees.id = salary.id
where role_name like '% JavaScript developer';
-- 23. Вывести минимальную ЗП QA инженеров
select MIN(monthly_salary) 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
inner join salary on employees.id = salary.id
where role_name like '% QA engineer';
--24. Вывести максимальную ЗП QA инженеров
select MAX(monthly_salary) 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
inner join salary on employees.id = salary.id
where role_name like '% QA engineer';
-- 25. Вывести количество QA инженеров
select COUNT(role_name)
from employee_salary
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%QA%';
--26. Вывести количество Middle специалистов
select COUNT(role_name)
from employee_salary
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%Middle%';
-- 27. Вывести количество разработчиков
select COUNT(role_name)
from employee_salary
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%developer%';
-- 28. Вывести фонд (сумму) зарплаты разработчиков
select SUM(monthly_salary) 
from roles_employee
join roles on roles_employee.role_id = roles.id 
join employees on employee_id = employees.id 
inner join salary on employees.id = salary.id
where role_name like '%developer%';
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees_name, role_name, monthly_salary 
from employee_salary
join salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
order by monthly_salary ASC;
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees_name, role_name, monthly_salary 
from employee_salary
join salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
where monthly_salary between 1700 and 2300
order by monthly_salary ASC;
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employees_name, role_name, monthly_salary 
from employee_salary
join salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
where monthly_salary < 2300
order by monthly_salary ASC;
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employees_name, role_name, monthly_salary 
from employee_salary
join salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary ASC;


