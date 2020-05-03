
create table author(
authorno number(20),name varchar2(10),city varchar2(20),country varchar2(20),primary key(authorno));
create table publisher(
publisherno number(20),name varchar2(20),city varchar2(20),country varchar2(20),primary key(publisherno));
create table catalog(bookno number(20),title varchar2(20),authorno number(20),publisherno number(20),categoryid number(20),year number(20),price number(20),
primary key(bookno),foreign key(authorno) references author(authorno),foreign key(publisherno) references publisher(publisherno));
create table category(categoryid number(20),description varchar2(20),primary key(categoryid));
create table orderdetails(
orderno number(20),bookno number(20),quantity number(20),primary key(orderno),foreign key(bookno) references catalog(bookno));
insert into author values(&authorno,'&name','&city','&country');
select * from author;
insert into publisher values(&publisherno,'&name','&city','&country');
select * from publisher;
insert into category values(&categoryid,'&description');
select * from category;
insert into catalog values(&bookno,'&title',&authorno,&publisherno,&categoryid,&year,&price);
select * from catalog;
insert into orderdetails values
(&orderno,&bookno,&quantity);
select * from orderdetails;
 select * from author where authorno in (select authorno from catalog where year>2000 and price>(select avg(price) from catalog) group by authorno having count(*)>=2);
  select a.authorno,a.name,a.city,a.country from author a,catalog c where c.authorno=a.authorno and c.bookno=(select bookno from orderdetails group by bookno having sum(quantity)=(select max(quantity) from (select sum(quantity) as quantity from orderdetails group by bookno)));
   update catalog set price=1.1*price where publisherno=(select publisherno from publisher where name='eee');
