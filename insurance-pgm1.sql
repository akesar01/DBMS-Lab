create table person(Driver_id varchar2(10),Name varchar2(20),Address varchar2(30),primary key(Driver_id));
create table car1(Reg_no varchar2(10),Model varchar2(10),Year number(4),primary key(Reg_no));
create table Accident(Report_no number(5),ADate date,location varchar2(15),primary key(Report_no));
create table Owns(Driver_id varchar2(10),Reg_no varchar(10),primary key(Driver_id,Reg_no),foreign key(Driver_id) references person(Driver_id),foreign key(Reg_no) references car1(Reg_no));
create table participated(Driver_id varchar2(10),Reg_no varchar2(10),Report_no number(5),DamageAmt number(7,2),primary key(Driver_id,Reg_no,Report_no),
foreign key(Driver_id,Reg_no) references Owns(Driver_id,Reg_no) on delete cascade,foreign key(Report_no) references Accident(Report_no)on delete cascade);
insert into person values('&Driver_id','&Name','&Address');
select * from person;
insert into car1 values('&Reg_no','&Model',&Year);
select * from car1;
insert into Accident values(&Report_no,'&ADate','&location');
select * from Accident;
insert into Owns values('&Driver_id','&Reg_no');
select * from Owns;
insert into participated values('&Driver_id','&Reg_no',&Report_no,&DamageAmt);
select * from participated;
update participated set DamageAmt=25000 where Report_no=123 and Reg_no='1bm19cs408';
SELECT COUNT(*) FROM ACCIDENT
WHERE ADATE LIKE '04-02-00';
