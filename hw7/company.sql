-- CS775/875
-- Sample Database - SQL Source File

USE <jjf1027>;

DROP TABLE IF EXISTS DEPENDENT;
DROP TABLE IF EXISTS WORKS_ON;
DROP TABLE IF EXISTS PROJECT;
DROP TABLE IF EXISTS DEPT_LOCATIONS;
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS DEPARTMENT;


CREATE TABLE DEPARTMENT
(

	Dname        	VARCHAR(25) NOT NULL,

	Dnumber      	INTEGER(4),

	Mgr_ssn       	CHAR(9) NOT NULL,

	Mgr_start_DATE 	DATE,


	PRIMARY KEY (Dnumber),

	KEY (Dname)

);



CREATE TABLE EMPLOYEE
(

	Fname    	VARCHAR(15) NOT NULL,

	Minit    	VARCHAR(1),

	Lname    	VARCHAR(15) NOT NULL,

	Ssn      	CHAR(9),

	BDATE    	DATE,

	Address  	VARCHAR(50),

	Sex      	CHAR,

	Salary   	DECIMAL(10,2),

	Super_ssn 	CHAR(9),

	Dno      	INTEGER(4),


	PRIMARY KEY (Ssn),
	FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber)

);



CREATE TABLE PROJECT
(

	Pname      	VARCHAR(25) NOT NULL,

	Pnumber    	INTEGER(4),

	Plocation  	VARCHAR(15),

	Dnum       	INTEGER(4) NOT NULL,


	PRIMARY KEY (Pnumber),

	UNIQUE (Pname),

	FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber)
);



CREATE TABLE DEPT_LOCATIONS
(

	Dnumber   	INTEGER(4),

	Dlocation 	VARCHAR(15),


	PRIMARY KEY (Dnumber,Dlocation),

	FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber)
);



CREATE TABLE DEPENDENT
(

	Essn           	CHAR(9),

	Dependent_name 	VARCHAR(15),

	Sex            	CHAR,

	BDATE          	DATE,

	Relationship   	VARCHAR(8),


	PRIMARY KEY (Essn,Dependent_name),

	FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn)

);


CREATE TABLE WORKS_ON
(

	Essn   		CHAR(9),

	Pno    		INTEGER(4),

	Hours  		DECIMAL(4,1),


	PRIMARY KEY (Essn,Pno),

	FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn),

	FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber)

);


INSERT INTO DEPARTMENT VALUES
('Research',5,'333445555','1978-05-22'),
('Administration',4,'987654321','1985-01-01'),
('Headquarters',1,'888665555','1971-06-19'
);


INSERT INTO EMPLOYEE VALUES
('Ahmad','V','Jabbar','987987987','1969-03-29','980 Dallas, Houston, TX','M','25000.00','987654321','4'
),
('Joyce','A','English','453453453','1972-07-31','5631 Rice, Houston, TX','F','25000.00','333445555','5'
),
('Ramesh','K','Narayan','666884444','1962-09-15','971 Fire Oak, Humble, TX','M','38000.00','333445555','5'),
('Alicia','J','Zelaya','999887777','1968-07-19','3321 Castle, Spring, TX','F','25000.00','987654321','4'),
('John','B','Smith','123456789','1965-01-09','731 Fondren, Houston, TX','M','30000.00','333445555','5'),
('Jennifer','S','Wallace','987654321','1941-06-20','291 Berry, Bellaire, TX','F','43000.00','888665555','4'),
('Franklin','T','Wong','333445555','1955-12-08','638 Voss, Houston, TX','M','40000.00','888665555','5'
),
('James','E','Borg','888665555','1937-11-10','450 Stone, Houston, TX','M','55000.00',NULL,'1')
;

INSERT INTO PROJECT VALUES
('ProductX','1','Bellaire','5'
),
('ProductY','2','Sugarland','5'),
(
'ProductZ','3','Houston','5'
),
('Computerization','10','Stafford','4'),
(
'Reorganization','20','Houston','1'),
(
'Newbenefits','30','Stafford','4'
);

INSERT INTO DEPT_LOCATIONS VALUES
("1","Houston"),
(
"4","Stafford"
),
("5","Bellaire"),

("5","Houston"),

("5","Sugarland")
;


INSERT INTO DEPENDENT VALUES
("333445555","Alice","F","1976-04-05","Daughter"),
("333445555","Theodore","M","1973-10-25","Son"),
("333445555","Joy","F","1948-05-03","Spouse"
),
("987654321","Abner","M","1932-02-29","Spouse"
),
("123456789","Michael","M","1978-01-01","Son"),
("123456789","Alice","F","1978-12-31","Daughter"),
(
"123456789","Elizabeth","F","0000-00-00","Spouse"
);




INSERT INTO WORKS_ON VALUES
("123456789","1","32.5"
),
("123456789","2","7.5"),
("666884444","3","40.0"
),
("453453453","1","20.0"),
("453453453","2","20.0"),
(
"333445555","2","10.0"),
("333445555","3","10.0"
),
("333445555","10","10.0"
),
("333445555","20","10.0"),
(
"999887777","30","30.0"
),
("999887777","10","10.0"
),
("987987987","10","35.0"
),
("987987987","30","5.0"
),
("987654321","30","20.0"
),
("987654321","20","15.0"
),
("888665555","20", NULL
);



ALTER TABLE EMPLOYEE ADD FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn);

DESCRIBE DEPARTMENT;
DESCRIBE EMPLOYEE;
DESCRIBE PROJECT;
DESCRIBE DEPT_LOCATIONS;
DESCRIBE DEPENDENT;
DESCRIBE WORKS_ON;

SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;
SELECT * FROM PROJECT;
SELECT * FROM DEPT_LOCATIONS;
SELECT * FROM DEPENDENT;
SELECT * FROM WORKS_ON;
