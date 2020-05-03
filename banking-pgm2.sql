create table branch(
branchname varchar2(20),
branchcity varchar2(10),
assets number(10,5),
primary key(branchname));

create table account(
accno number(10),
branchname varchar2(20),
balance number(10,5),
primary key(accno),
foreign key (branchname)REFERENCES branch(branchname));
create table customer(
customername varchar2(10),
customerstreet varchar2(30),
city varchar(20),
primary key(customername));



create table depositor(
customername varchar2(10),
accno number(10),
primary key(customername,accno),
foreign key(accno) references account(accno),
foreign key(customername) REFERENCES customer(customername));
drop table depositor;

create table loan(
loannumber number(10),
branchname varchar2(20),
amount number(10),
primary key (loannumber),
foreign key (branchname) references branch(branchname));

create table borrower(
customername varchar2(10),
loannumber number(10),
primary key(customername),
foreign key(customername) references customer(customername),
foreign key(loannumber) references loan(loannumber));

insert into branch values('&branchname','&branchcity',&assets);
insert into account values('&accno','&branchname','&balance');
insert into customer values('&customername','&customerstreet','&city');

insert into depositor values('&customername','&accno');
insert into loan values('&loannumber','&branchname','&amount');
insert into borrower values('&customername','&loannumber');
select * from borrower;
select * from customer;
select * from loan;
select * from depositor;
select * from account;
select * from branch;

SELECT D.CUSTOMER_NAME,B.BRANCH_NAME,A.ACC_NO FROM DEPOSITOR D,BRANCH B,ACCOUNTS A WHERE A.ACC_NO=D.ACC_NO AND B.BRANCH_NAME=A.BRANCH_NAME AND B.BRANCH_NAME="FASER TOWN" AND ( SELECT A.ACC_NO FROM ACCOUNTS A HAVING COUNT(*)>=2);
 

SELECT D.CUSTOMER_NAME FROM DEPOSITOR D WHERE D.ACC_NO=ALL(SELECT A.ACC_NO FROM BRANCH B,ACCOUNTS A WHERE B.BRANCH_CITY="MYSORE" AND A.BRANCH_NAME=B.BRANCH_NAME);

 

DELETE FROM ACCOUNTS WHERE BRANCH_NAME IN(SELECT BRANCH_NAME FROM BRANCH WHERE BRANCH_CITY="BLORE");
SELECT * FROM ACCOUNTS;
