use geekbrains;

-- Таблица курсов
create table courses (
    id int auto_increment not null primary key,
    name varchar(150) unique
);


-- Таблица студентов
drop table students;
create table students (
    id int auto_increment not null primary key,
    firstname varchar(100) not null,
    lastname varchar(100) not null,
    email varchar(100) not null unique,
    course_id int
);

alter table students add column birthday date;

