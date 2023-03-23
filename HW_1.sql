--Создать таблицу employees
--- id. serial,  primary key,
--- employees_name. Varchar(50), not null

create table employees(
  id serial primary key,
  employees_name varchar (50) unique not null);

 -- Наполнить таблицу employee 70 строками.
 
insert into employees(employees_name)
values ('Иванов'),
('Смирнов'),
('Кузнецов'),
('Попов'),
('Васильев'),
('Петров'),
('Соколов'),
('Михайлов'),
('Фёдоров'),
('Морозов'),
('Волков'),
('Алексеев'),
('Лебедев'),
('Семёнов'),
('Егоров'),
('Павлов'),
('Козлов'),
('Степанов'),
('Николаев'),
('Орлов'),
('Андреев'),
('Макаров'),
('Никитин'),
('Захаров'),
('Зайцев'),
('Соловьев'),
('Борисов'),
('Яковлев'),
('Григорьев'),
('Романов'),
('Воробьев'),
('Сергеев'),
('Кузьмин'),
('Фролов'),
('Александров'),
('Дмитриев'),
('Королев'),
('Гусев'),
('Киселев'),
('Ильин'),
('Максимов'),
('Поляков'),
('Сорокин'),
('Виноградов'),
('Ковалев'),
('Белов'),
('Медведев'),
('Антонов'),
('арасов'),
('Жуков'),
('Баранов'),
('Филиппов'),
('Комаров'),
('Давыдов'),
('Беляев'),
('Герасимов'),
('Богданов'),
('Осипов'),
('Сидоров'),
('Матвеева'),
('Титов'),
('Марков'),
('Миронов'),
('Крылов'),
('Куликов'),
('Карпов'),
('Власов'),
('Мельников'),
('Денисов');
select * from employees;

--Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null

create table salary(
id Serial primary key,
monthly_salary Int not null);

--Наполнить таблицу salary 15 строками:

insert into salary(monthly_salary)
values
       (1100),
       (1200),
       (1300),
       (1400),
       (1500),
       (1600),
       (1700),
       (1800),
       (1900),
       (2000),
       (2100),
       (2200),
       (2300),
       (2400),
       (2500);

      select * from salary;

-- Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
  
   create table employee_salary(
id Serial primary key, 
employee_id Int not null,
salary_id Int not null);

--Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary (employee_id, salary_id)
values (1, 2), 
       (3, 4), 
       (5, 6), 
       (7, 8), 
       (9, 10), 
       (11, 12), 
       (13, 14), 
       (15, 16), 
       (17, 18), 
       (19, 20), 
       (21, 22), 
       (23, 24), 
       (25, 26), 
       (27, 28),
       (29, 30),
       (71, 72),
       (73, 74),
       (75, 76),
       (77, 78),
       (79, 80);
       
      select * from employee_salary;
     
--     Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
     
           create table roles(
           id Serial primary key, role_name int not null unique);
          
-- Поменять тип столба role_name с int на varchar(30)
         
          alter table roles 
          alter column role_name type varchar(30);
         
--  Наполнить таблицу roles 20 строками:   
    
insert into roles(role_name)
values ('Junior Python developer'),
       ('Middle Python developer'),
       ('Senior Python developer'),
       ('Junior Java developer'),
       ('Middle Java developer'),
       ('Senior Java developer'),
       ('Junior JavaScript developer'),
       ('Middle JavaScript developer'),
       ('Senior JavaScript developer'),
       ('Junior Manual QA engineer'),
       ('Middle Manual QA engineer'),
       ('Senior Manual QA engineer'),
       ('Project Manager'),
       ('Designer'),
       ('HR'),
       ('CEO'),
       ('Sales manager'),
       ('Junior Automation QA engineer'),
       ('Middle Automation QA engineer'),
       ('Senior Automation QA engineer');
       
      
--Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
     
create table roles_employee(id Serial primary key,
employee_id int not null unique, 
role_id int not null,
foreign key (employee_id)
 	references employees(id),
 foreign key (role_id)
 	references roles(id)
 );

--Наполнить таблицу roles_employee 40 строками:

insert into roles_employee (employee_id, role_id)
values (35, 3),
		(7, 1),
		(4, 5),
		(5, 8),
		(7, 2),
		(9, 1),
		(11, 10),
		(13, 11),
		(22, 13),
		(32, 12),
		(65, 14),
		(36, 12),
		(28, 14),
		(10, 15),
		(20, 3),
		(30, 3),
		(40, 1),
		(50, 4),
		(60, 17),
		(70, 18),
		(35, 15),
		(37, 11),
		(47, 13),
		(48, 17),
		(51, 14),
		(52, 16),
		(53, 19),
		(54, 20),
		(56, 15),
		(57, 12),
		(43, 14),
		(8, 15),
		(68, 9),
		(21, 7),
		(55, 16),
		(49, 3),
		(46, 6),
		(38, 7),
		(64, 8),
		(17, 12); 



