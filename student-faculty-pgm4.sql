 CREATE TABLE student(
      snum INT,
     sname VARCHAR(10),
       major VARCHAR(2),
       lvl VARCHAR(2),
      age INT, primary key(snum));
      
 CREATE TABLE faculty(
        fid INT,fname VARCHAR(20),
        deptid INT,
        PRIMARY KEY(fid));
 CREATE TABLE faculty(
      fid INT,fname VARCHAR(20),
        deptid INT,
        PRIMARY KEY(fid)
        );
CREATE TABLE enrolled(
        snum INT,
        cname VARCHAR(20),
        PRIMARY KEY(snum,cname),
        FOREIGN KEY(snum) REFERENCES student(snum),
        FOREIGN KEY(cname) REFERENCES class(cname)
        );
INSERT INTO STUDENT VALUES(&snum, '&sname', '&major', '&lvl', &age);
INSERT INTO FACULTY VALUES(&FID, '&FNAME', &DEPTID);

