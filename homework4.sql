use hr;
drop table if exists students;
create table students(
id int primary key auto_increment,
name varchar(128) not null,
age int);

create table teachers(
id int primary key auto_increment,
name varchar(128) not null,
age int
);
create table Competencies(
id int primary key auto_increment,
title varchar(128) not null
);
create table Teachers2Competencies(
id int primary key auto_increment,
teacher_id int,
competencies_id int
);
create table Courses(
id int primary key auto_increment,
teacher_id int,
title varchar(128) not null,
headman_id int
);

create table Students2Courses(
id int primary key auto_increment,
student_id int,
course_id int
);
insert into Students (name,age) values
('Анатолий', 29),
('Олег', 25),
('Семен', 27),
('Олеся', 28),
('Ольга', 31),
('Иван', 22);

INSERT INTO Teachers (name, age) VALUES
('Петр', 39),
('Максим', 35),
('Антон', 37),
('Всеволод', 38),
('Егор', 41),
('Светлана', 32);
INSERT INTO Competencies(title) values
('Математика'),
('Информатика'),
('Программирование'),
('Графика');
insert into Teachers2Competencies(teacher_id, competencies_id) values
(1, 1),
(2, 1),
(2, 3),
(3, 2),
(4, 1),
(5, 3);
-- Добавление записей в таблицу Courses
INSERT INTO Courses (id, title, teacher_id) VALUES
(1, 'Алгебра логики', 2),
(2, 'Математическая статистика', 3),
(4, 'Высшая математика', 5),
(5, 'Javascript', 1),
(6, 'Базовый Python', 1);

-- Добавление записей в таблицу Students2Courses
INSERT INTO Students2Courses (student_id, course_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(3, 3),
(4, 5);
-- Вывести имена студентов и курсы, которые они проходят
select* from students;
SELECT s.name AS student_name, c.title AS course_title
FROM Students s
JOIN Students2Courses sc ON s.id = sc.student_id
JOIN Courses c ON sc.course_id = c.id;
-- 2) Вывести имена всех преподавателей с их компетенциями
SELECT Teachers.name, Competencies.title
FROM Teachers
JOIN Teachers2Competencies ON Teachers.id = Teachers2Competencies.teacher_id
JOIN Competencies ON Teachers2Competencies.competencies_id = Competencies.id;
-- 3) Найти преподавателя, у которого нет компетенций
SELECT Teachers.name
FROM Teachers
LEFT JOIN Teachers2Competencies ON Teachers.id = Teachers2Competencies.teacher_id
WHERE Teachers2Competencies.teacher_id IS NULL;

-- 4) Найти имена студентов, которые не проходят ни один курс
SELECT Students.name
FROM Students
LEFT JOIN Students2Courses ON Students.id = Students2Courses.student_id
WHERE Students2Courses.student_id IS NULL;

-- 5) Найти курсы, которые не посещает ни один студент

SELECT c.title
FROM Courses c
LEFT JOIN Students2Courses sc ON c.id = sc.course_id
WHERE sc.id IS NULL;



-- 6) Найти компетенции, которых нет ни  у одного преподавателя
SELECT Competencies.title
FROM Competencies
LEFT JOIN Teachers2Competencies ON Competencies.id = Teachers2Competencies.competencies_id
WHERE Teachers2Competencies.competencies_id IS NULL;



-- 7) Вывести название курса и имя старосты
SELECT c.title AS course_title, s.name AS headman_name
FROM Courses c
JOIN Students s ON c.headman_id = s.id;
-- 8) Вывести имя студента и имена старост, которые есть на курсах, которые он проходит
SELECT s.name AS student_name, hm.name AS headman_name
FROM Students s
JOIN Students2Courses s2c ON s.id = s2c.student_id
JOIN Courses c ON s2c.course_id = c.id
JOIN Students hm ON c.headman_id = hm.id;
select*from students2courses;