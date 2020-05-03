create database 1b;
use 1b;
create table branch
(
branchname varchar(20),
branchcity varchar(20),
assets  float( 10),
primary key(branchname)
);
create table accounts
(
accno int,
branchname varchar(20),
balance float(20),
primary key(accno),
foreign key (branchname) references branch(branchname)
);
create table customer
 (
 customername varchar(20),
 customerstreeet  varchar(20),
 city varchar(20),
 primary key (customername)
);
create table depositor
(
 customername varchar(20),
 accno int,
 primary key(customername,accno),
 foreign key (accno) references accounts(accno),
 foreign key(customername) references customer(customername));
 create table loan
 (
 loannumber int,
 branchname varchar(20),
 amount int,
 primary key(loannumber),
 foreign key (branchname) references branch(branchname));
 create table borrower 
 (
 customername varchar(20) primary key,
 loannumber int,
 foreign key (loannumber) references loan(loannumber),
 foreign key(customername) references customer(customername));
 insert into branch values("Sastri nagar","Jammu",4567);
 insert into branch values("Manju ka tilla","Delhi",4569);
 insert into accounts values("5678","Nanak nagar",678);
 insert into accounts values("4567","Sastri nagar",1000);
 insert into accounts values("6784","Manju ka tilla",678);
 insert into accounts values("7894","basavanagudi",645);
 insert into accounts values("5678","Nanak nagar",678);
 insert into accounts values("8943","Dev nagari",6780);
 insert into accounts values("5435","HDFC Vikas lane",648);
 insert into depositor values("Ankit",4567);
 insert into depositor values("paritosh",5435);
 insert into depositor values("Rohit",5678);
 insert into depositor values("sai",6784);
 insert into depositor values("Swastik",8943);
 insert into loan values(4526,"basavanagudi",4567);
 insert into loan values(2341,"Dev nagari",2785);
 insert into loan values(5648,"HDFC Vikas lane",3471);
 insert into loan values(2345,"Manju ka tilla",4622);
 insert into loan values(5674,"Nank nagar",6575);
 insert into loan values (2273,"Sastri nagar",5264);
 insert into borrower values("Ankit",4526);
 insert into borrower values("paritosh",5648);
 insert into borrower values("Rohit",2345);
 insert into borrower values("sai",2341);
 insert into borrower values("Swastik",2273);
 select * from borrower;
 select * from branch;
 select * from accounts;
 select * from customer;
 select * from depositor;
 select * from loan;
 select * from borrower;
 
 
 
 
 






