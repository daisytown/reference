use pubs
drop table emp1
create table emp1(
empid varchar(4) primary key,
empname varchar(30)
)
insert into emp1 values ('1001','张三')
insert into emp1 values ('1002','李四')

drop table students
create table students(
stud_id varchar(20) primary key,
stud_name varchar(30)
)
insert into students values ('s100','David')
insert into students values ('s200','Williams')
