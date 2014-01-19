create table admin
(
id number(10),
name varchar2(30),
pwd varchar2(32),
email varchar2(50),
mobile varchar2(20),
city varchar2(20),
state varchar2(20)
);

create table teacher 
(
tid number(10) primary key,
tregId varchar2(20) unique,
tname varchar2(30),
tpwd varchar2(32),
temail varchar2(50),
tmobile varchar2(20),
tsub varchar2(20),
tcity varchar2(20),
tstate varchar2(20)
);

CREATE TABLE QBANK
(
tid number(10),
qid number(10) primary key,
sub varchar2(10),
type varchar2(5),
statement varchar2(4000),
imgpath varchar2(1024),
opt1 varchar2(2048),
opt2 varchar2(2048),
opt3 varchar2(2048),
opt4 varchar2(2048),
ans varchar2(1),
qlevel number(2),
marks number(4)
);

create table homeSetting
(
 universityName varchar2(100),
 about varchar2(2000),
 imgpath1 varchar2(100),
 imglabel1 varchar2(100),
 imgdesc1 varchar2(200),
 imgpath2 varchar2(100),
 imglabel2 varchar2(100),
 imgdesc2 varchar2(200),
 imgpath3 varchar2(100),
 imglabel3 varchar2(100),
 imgdesc3 varchar2(200)
);


CREATE SEQUENCE t_id
START WITH 1000
INCREMENT BY 1;

CREATE SEQUENCE q_id
START WITH 1
INCREMENT BY 1;


