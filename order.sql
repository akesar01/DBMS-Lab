create table customer1(
custno number(10),
cname varchar2(10),
city varchar2(10),
primary key(custno));

create table order1(
orderno number(10),
odate date,
custno number(10),
ordamt number(10),
primary key(orderno),
foreign key(custno) references customer1(custno));
drop table order1;
create table item(
itemno number(10),
price number(10),
primary key(itemno));

create table orderitem(
orderno number(10),
itemno number(10),
qty number(10),
primary key(orderno,itemno),
foreign key (orderno) references order1(orderno),
foreign key (itemno) references item(itemno));

create table warehouse(
warehouseno number(10),
city varchar2(20),
primary key(warehouseno));

create table shipment(
orderno number(10),
warehouseno number(10),
sdate date,
primary key (orderno,warehouseno),
foreign key (orderno) references order1(orderno),
foreign key (warehouseno) references warehouse(warehouseno)
);
insert into customer1 values(&custno,'&cname','&city');
insert into order1 values(&orderno,'&odate',&custno,&ordamt);
insert into item values(&itemno,&unitprice);
insert into orderitem values(&orderno,&itemno,&qty);
insert into warehouse values(&warehouseno,'&city');
insert into shipment values(&orderno,&warehouseno,'&sdate');
select * from customer1;
select * from order1;
select * from item;
select * from orderitem;
select * from warehouse;
select * from shipment;

SELECT C.CNAME, COUNT(*) AS NO_OF_ORDER,AVG(O.ORD_AMT) FROM CUSTOMERS C,ORDERS O WHERE C.CUST_NO=O.CUST_NO GROUP BY(O.CUST_NO);
 
SELECT S.ORDER_NO,W.CITY FROM SHIPMENT S,WAREHOUSE W WHERE S.WAREHOUSE_NO=W.WAREHOUSE_NO AND W.CITY="BLORE";
 
ALTER TABLE ORDER_ITEM ADD CONSTRAINT FOREIGN KEY(ITEM_NO) REFERENCES ITEM(ITEM_NO) ON DELETE SET NULL;
DELETE FROM ITEM WHERE ITEM_NO=10;
