create database w3resouces_prac;
use w3resouces_prac;

# 1. Write a SQL statement to create a simple table countries including columns 
#    country_id,country_name and region_id.

create table if not exists countries(
	country_id int,
    country_name varchar(30),
    region_id int
    );
    
create table dup_countries1 like countries;
select * from dup_countries1;
create table abc select * from countries;
select * from abc;

alter table countries
MODIFY COUNTRY_ID INT NOT NULL;

alter table countries
MODIFY COUNTRY_NAME VARCHAR(30) NOT NULL;
ALTER TABLE COUNTRIES
MODIFY REGION_ID INT NOT NULL;

DESC DUP_COUNTRIES;

# 6. Write a SQL statement to create a table named jobs including columns job_id, job_title, 
#    min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.

CREATE TABLE IF NOT EXISTS jobs(
	job_id int,
    job_title varchar(50),
    min_salary int,
    max_salary int 
    check (max_salary<=25000)
    );
    
insert into jobs values(1,'shivam',10000,20000);
insert into jobs values(1,'shivam',10000,28000);


CREATE TABLE IF NOT EXISTS jobs1(
	job_id int,
    job_title varchar(50),
    min_salary int,
    max_salary int 
    CONSTRAINT MAX_SALARY check (max_salary<=25000)
    );

insert into jobs1 values(1,'shivam',10000,28000);


insert into countries values(101,'india',1);

ALTER TABLE jobs1
ADD CONSTRAINT MIN_SALARY CHECK (min_salary >5000);

insert into jobs1 values(1,'shivam',1000,28000);


# 7. Write a SQL statement to create a table named countries including columns country_id, country_name 
#    and region_id and make sure that no countries except Italy, India and 
#    China will be entered in the table.

ALTER TABLE countries
add constraint ban_country check(country_name in ("Italy","India","China"));

insert into countries values(101,"India",1);
insert into countries values(101,"USA",1);

create table if not exists countries2(
	country_id int,
    country_name varchar(30)
    CONSTRAINT Allowed_country_list check(country_name in ("Italy","India","China")),
    region_id int
    );

insert into countries2 values(101,"USA",1);

/* 8. Write a SQL statement to create a table named job_histry including columns employee_id, 
start_date, end_date, job_id and department_id and make sure that the value against column 
end_date will be entered at the time of insertion to the format like '--/--/----'. */

CREATE TABLE IF NOT EXISTS job_histry(
	employee_id int,
    start_date varchar(10),
    end_date varchar(10)
    CHECK (end_date like '__/__/____'),
    job_id int,
    department_id int
    );
    
    
    insert into job_histry values(101,'11/06/2023','06/06/2012',15,25);
    insert into job_histry values(101,'11/06/2023','06-06-2012',15,25);
    
/* 9. Write a SQL statement to create a table named countries including columns country_id,
country_name and region_id and make sure that no duplicate data against column country_id 
will be allowed at the time of insertion. */

alter table countries2
modify column country_id int Primary key;


ALTER TABLE job_histry
MODIFY EMPLOYEE_ID INT PRIMARY KEY;

insert into countries2 values(NULL, 'INDIA',25);


/* 10. Write a SQL statement to create a table named jobs including columns job_id, job_title, 
min_salary and max_salary, and make sure that, the default value for job_title is blank and 
min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion 
if no value assigned for the specified columns. */

CREATE TABLE IF NOT EXISTS jobs2(
	job_id int,
    job_title varchar(50) DEFAULT "",
    min_salary int DEFAULT 8000,
    max_salary int DEFAULT NULL
    );
    
    INSERT INTO JOBS2(job_id) values(102),(105),(241);
    
    select * from jobs2;
    
/* 11. Write a SQL statement to create a table named countries including columns country_id, 
       country_name and region_id and make sure that the country_id column will be a key field 
       which will not contain any duplicate data at the time of insertion.  */
       
create table if not exists countries3(
	country_id int,
    country_name varchar(30),
    region_id int,
    unique(country_id)
    );
    
insert into countries3 values(101,'india',25);
insert into countries3 values(101,'Russia',24);

create table if not exists countries4(
	country_id int,
    country_name varchar(30),
    region_id int
    );
    
alter table countries4
modify country_id int unique;

insert into countries4 values(101,'india',25);
insert into countries4 values(101,'Russia',24);

create table if not exists countries5(
	country_id int,
    country_name varchar(30),
    region_id int
    );
    
alter table countries5
add constraint unique(country_id);

insert into countries5 values(101,'india',25);
insert into countries5 values(101,'Russia',24);


/* 12. Write a SQL statement to create a table countries including columns country_id, 
country_name and region_id and make sure that the column country_id will be unique and 
store an auto incremented value.   */

create table if not exists countries6(
	country_id int unique auto_increment,
    country_name varchar(30),
    region_id int
    );
    
insert into countries6(country_name, region_id)
values("India", 25), ("Israel", 35),("Hamas",84);

select * from countries6;


/* 13. Write a SQL statement to create a table countries including columns country_id, 
country_name and region_id and make sure that the combination of columns country_id and 
region_id will be unique   */

create table if not exists countries7(
	country_id int ,
    country_name varchar(30),
    region_id int,
    unique(country_id, region_id)
    );
    
insert into countries7 values(101,'india',25);
insert into countries7 values(102,'Russia',24);
insert into countries7 values(102,'india',25);
insert into countries7 values(101,'Russia',25);

insert into countries7 values(102,'india',25);
insert into countries7 values(101,'Russia',25);

/* 14. Write a SQL statement to create a table job_history including columns employee_id, start_date, 
end_date, job_id and department_id and make sure that, the employee_id column does not contain any 
duplicate value at the time of insertion and the foreign key column job_id contain only those values 
which are exists in the jobs table.
Here is the structure of the table jobs;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+   */

CREATE TABLE IF NOT EXISTS jobs_3(
	job_id varchar(10) primary key,
    job_title varchar(35) default null,
    min_salary decimal(6,0) default null,
    max_salary decimal(6,0) default null
    );
    
desc jobs_3;
    
insert into jobs_3 values(101,'shivam',5000,10000),(102,'Abhishek',15000,18000),(103,'Bantu',8000,16000);

CREATE TABLE IF NOT EXISTS job_history(
	employee_id int unique,
    start_date varchar(15), 
	end_date varchar(15),
    job_id varchar(15),
    department_id int,
    foreign key(job_id) references jobs_3(job_id)
    );
    
insert into job_history values(2,'02/05/23','05/05/23',104,15);
insert into job_history values(123,'02/05/23','05/05/23',102,15,3);
    
alter table job_history
add column region_id int;

select * from job_history;

alter table job_history
add column Id int first;

alter table job_history
add column first_name varchar(25) after job_id;

alter table job_history
drop column first_name;

alter table job_history
rename column Id to Emp_id;

alter table job_history
add primary key(employee_id, job_id);

desc job_history;

alter table job_history
drop primary key;

CREATE TABLE IF NOT EXISTS jobs_4(
	job_id varchar(10) ,
    job_title varchar(35) default null,
    state_id int ,
    min_salary decimal(6,0) default null,
    max_salary decimal(6,0) default null
    );
    
desc jobs_4;
    
alter table jobs_4
add primary key(job_id);

alter table jobs_4
drop primary key;

alter table job_history_2
add constraint fk_job_id foreign key(job_id) references jobs_4(job_id);

CREATE TABLE IF NOT EXISTS job_history_2(
	employee_id int primary key,
    start_date varchar(15), 
	end_date varchar(15),
    job_id varchar(15),
    department_id int
    );

insert into job_history_2 values(103, '21-07-2023', '30-01-2025', '13', 25);

insert into jobs_4(job_id, state_id) values('13', 51);

desc job_history_2;
desc jobs_4;

alter table jobs_4
add index indx_job_id (job_id);

CREATE INDEX indx_job_id
ON job_history_2 (job_id);

alter table jobs_4
drop index indx_job_id;

alter table job_history_2
drop constraint fk_job_id;

select left(start_date,3) from job_history_2;

select substring(start_date,1,3) from job_history_2;

select round(salary/12,2) from job_history_2;


CREATE TABLE `employees` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL DEFAULT '0',
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(25) NOT NULL,
  `EMAIL` varchar(25) NOT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `HIRE_DATE` date NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `SALARY` decimal(8,2) DEFAULT NULL,
  `COMMISSION_PCT` decimal(2,2) DEFAULT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  UNIQUE KEY `EMP_EMAIL_UK` (`EMAIL`),
  KEY `EMP_DEPARTMENT_IX` (`DEPARTMENT_ID`),
  KEY `EMP_JOB_IX` (`JOB_ID`),
  KEY `EMP_MANAGER_IX` (`MANAGER_ID`),
  KEY `EMP_NAME_IX` (`LAST_NAME`,`FIRST_NAME`)
);


INSERT INTO `employees` VALUES (100,'Steven','King','SKING','515.123.4567','1987-06-17','AD_PRES',24000.00,0.00,0,90),(101,'Neena','Kochhar','NKOCHHAR','515.123.4568','1987-06-18','AD_VP',17000.00,0.00,100,90),(102,'Lex','De Haan','LDEHAAN','515.123.4569','1987-06-19','AD_VP',17000.00,0.00,100,90),(103,'Alexander','Hunold','AHUNOLD','590.423.4567','1987-06-20','IT_PROG',9000.00,0.00,102,60),(104,'Bruce','Ernst','BERNST','590.423.4568','1987-06-21','IT_PROG',6000.00,0.00,103,60),(105,'David','Austin','DAUSTIN','590.423.4569','1987-06-22','IT_PROG',4800.00,0.00,103,60),(106,'Valli','Pataballa','VPATABAL','590.423.4560','1987-06-23','IT_PROG',4800.00,0.00,103,60),(107,'Diana','Lorentz','DLORENTZ','590.423.5567','1987-06-24','IT_PROG',4200.00,0.00,103,60),(108,'Nancy','Greenberg','NGREENBE','515.124.4569','1987-06-25','FI_MGR',12000.00,0.00,101,100),(109,'Daniel','Faviet','DFAVIET','515.124.4169','1987-06-26','FI_ACCOUNT',9000.00,0.00,108,100),(110,'John','Chen','JCHEN','515.124.4269','1987-06-27','FI_ACCOUNT',8200.00,0.00,108,100),(111,'Ismael','Sciarra','ISCIARRA','515.124.4369','1987-06-28','FI_ACCOUNT',7700.00,0.00,108,100),(112,'Jose Manuel','Urman','JMURMAN','515.124.4469','1987-06-29','FI_ACCOUNT',7800.00,0.00,108,100),(113,'Luis','Popp','LPOPP','515.124.4567','1987-06-30','FI_ACCOUNT',6900.00,0.00,108,100),(114,'Den','Raphaely','DRAPHEAL','515.127.4561','1987-07-01','PU_MAN',11000.00,0.00,100,30),(115,'Alexander','Khoo','AKHOO','515.127.4562','1987-07-02','PU_CLERK',3100.00,0.00,114,30),(116,'Shelli','Baida','SBAIDA','515.127.4563','1987-07-03','PU_CLERK',2900.00,0.00,114,30),(117,'Sigal','Tobias','STOBIAS','515.127.4564','1987-07-04','PU_CLERK',2800.00,0.00,114,30),(118,'Guy','Himuro','GHIMURO','515.127.4565','1987-07-05','PU_CLERK',2600.00,0.00,114,30),(119,'Karen','Colmenares','KCOLMENA','515.127.4566','1987-07-06','PU_CLERK',2500.00,0.00,114,30),(120,'Matthew','Weiss','MWEISS','650.123.1234','1987-07-07','ST_MAN',8000.00,0.00,100,50),(121,'Adam','Fripp','AFRIPP','650.123.2234','1987-07-08','ST_MAN',8200.00,0.00,100,50),(122,'Payam','Kaufling','PKAUFLIN','650.123.3234','1987-07-09','ST_MAN',7900.00,0.00,100,50),(123,'Shanta','Vollman','SVOLLMAN','650.123.4234','1987-07-10','ST_MAN',6500.00,0.00,100,50),(124,'Kevin','Mourgos','KMOURGOS','650.123.5234','1987-07-11','ST_MAN',5800.00,0.00,100,50),(125,'Julia','Nayer','JNAYER','650.124.1214','1987-07-12','ST_CLERK',3200.00,0.00,120,50),(126,'Irene','Mikkilineni','IMIKKILI','650.124.1224','1987-07-13','ST_CLERK',2700.00,0.00,120,50),(127,'James','Landry','JLANDRY','650.124.1334','1987-07-14','ST_CLERK',2400.00,0.00,120,50),(128,'Steven','Markle','SMARKLE','650.124.1434','1987-07-15','ST_CLERK',2200.00,0.00,120,50),(129,'Laura','Bissot','LBISSOT','650.124.5234','1987-07-16','ST_CLERK',3300.00,0.00,121,50),(130,'Mozhe','Atkinson','MATKINSO','650.124.6234','1987-07-17','ST_CLERK',2800.00,0.00,121,50),(131,'James','Marlow','JAMRLOW','650.124.7234','1987-07-18','ST_CLERK',2500.00,0.00,121,50),(132,'TJ','Olson','TJOLSON','650.124.8234','1987-07-19','ST_CLERK',2100.00,0.00,121,50),(133,'Jason','Mallin','JMALLIN','650.127.1934','1987-07-20','ST_CLERK',3300.00,0.00,122,50),(134,'Michael','Rogers','MROGERS','650.127.1834','1987-07-21','ST_CLERK',2900.00,0.00,122,50),(135,'Ki','Gee','KGEE','650.127.1734','1987-07-22','ST_CLERK',2400.00,0.00,122,50),(136,'Hazel','Philtanker','HPHILTAN','650.127.1634','1987-07-23','ST_CLERK',2200.00,0.00,122,50),(137,'Renske','Ladwig','RLADWIG','650.121.1234','1987-07-24','ST_CLERK',3600.00,0.00,123,50),(138,'Stephen','Stiles','SSTILES','650.121.2034','1987-07-25','ST_CLERK',3200.00,0.00,123,50),(139,'John','Seo','JSEO','650.121.2019','1987-07-26','ST_CLERK',2700.00,0.00,123,50),(140,'Joshua','Patel','JPATEL','650.121.1834','1987-07-27','ST_CLERK',2500.00,0.00,123,50),(141,'Trenna','Rajs','TRAJS','650.121.8009','1987-07-28','ST_CLERK',3500.00,0.00,124,50),(142,'Curtis','Davies','CDAVIES','650.121.2994','1987-07-29','ST_CLERK',3100.00,0.00,124,50),(143,'Randall','Matos','RMATOS','650.121.2874','1987-07-30','ST_CLERK',2600.00,0.00,124,50),(144,'Peter','Vargas','PVARGAS','650.121.2004','1987-07-31','ST_CLERK',2500.00,0.00,124,50),(145,'John','Russell','JRUSSEL','011.44.1344.429268','1987-08-01','SA_MAN',14000.00,0.40,100,80),(146,'Karen','Partners','KPARTNER','011.44.1344.467268','1987-08-02','SA_MAN',13500.00,0.30,100,80),(147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278','1987-08-03','SA_MAN',12000.00,0.30,100,80),(148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268','1987-08-04','SA_MAN',11000.00,0.30,100,80),(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','1987-08-05','SA_MAN',10500.00,0.20,100,80),(150,'Peter','Tucker','PTUCKER','011.44.1344.129268','1987-08-06','SA_REP',10000.00,0.30,145,80),(151,'David','Bernstein','DBERNSTE','011.44.1344.345268','1987-08-07','SA_REP',9500.00,0.25,145,80),(152,'Peter','Hall','PHALL','011.44.1344.478968','1987-08-08','SA_REP',9000.00,0.25,145,80),(153,'Christopher','Olsen','COLSEN','011.44.1344.498718','1987-08-09','SA_REP',8000.00,0.20,145,80),(154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668','1987-08-10','SA_REP',7500.00,0.20,145,80),(155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508','1987-08-11','SA_REP',7000.00,0.15,145,80),(156,'Janette','King','JKING','011.44.1345.429268','1987-08-12','SA_REP',10000.00,0.35,146,80),(157,'Patrick','Sully','PSULLY','011.44.1345.929268','1987-08-13','SA_REP',9500.00,0.35,146,80),(158,'Allan','McEwen','AMCEWEN','011.44.1345.829268','1987-08-14','SA_REP',9000.00,0.35,146,80),(159,'Lindsey','Smith','LSMITH','011.44.1345.729268','1987-08-15','SA_REP',8000.00,0.30,146,80),(160,'Louise','Doran','LDORAN','011.44.1345.629268','1987-08-16','SA_REP',7500.00,0.30,146,80),(161,'Sarath','Sewall','SSEWALL','011.44.1345.529268','1987-08-17','SA_REP',7000.00,0.25,146,80),(162,'Clara','Vishney','CVISHNEY','011.44.1346.129268','1987-08-18','SA_REP',10500.00,0.25,147,80),(163,'Danielle','Greene','DGREENE','011.44.1346.229268','1987-08-19','SA_REP',9500.00,0.15,147,80),(164,'Mattea','Marvins','MMARVINS','011.44.1346.329268','1987-08-20','SA_REP',7200.00,0.10,147,80),(165,'David','Lee','DLEE','011.44.1346.529268','1987-08-21','SA_REP',6800.00,0.10,147,80),(166,'Sundar','Ande','SANDE','011.44.1346.629268','1987-08-22','SA_REP',6400.00,0.10,147,80),(167,'Amit','Banda','ABANDA','011.44.1346.729268','1987-08-23','SA_REP',6200.00,0.10,147,80),(168,'Lisa','Ozer','LOZER','011.44.1343.929268','1987-08-24','SA_REP',11500.00,0.25,148,80),(169,'Harrison','Bloom','HBLOOM','011.44.1343.829268','1987-08-25','SA_REP',10000.00,0.20,148,80),(170,'Tayler','Fox','TFOX','011.44.1343.729268','1987-08-26','SA_REP',9600.00,0.20,148,80),(171,'William','Smith','WSMITH','011.44.1343.629268','1987-08-27','SA_REP',7400.00,0.15,148,80),(172,'Elizabeth','Bates','EBATES','011.44.1343.529268','1987-08-28','SA_REP',7300.00,0.15,148,80),(173,'Sundita','Kumar','SKUMAR','011.44.1343.329268','1987-08-29','SA_REP',6100.00,0.10,148,80),(174,'Ellen','Abel','EABEL','011.44.1644.429267','1987-08-30','SA_REP',11000.00,0.30,149,80),(175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266','1987-08-31','SA_REP',8800.00,0.25,149,80),(176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265','1987-09-01','SA_REP',8600.00,0.20,149,80),(177,'Jack','Livingston','JLIVINGS','011.44.1644.429264','1987-09-02','SA_REP',8400.00,0.20,149,80),(178,'Kimberely','Grant','KGRANT','011.44.1644.429263','1987-09-03','SA_REP',7000.00,0.15,149,0),(179,'Charles','Johnson','CJOHNSON','011.44.1644.429262','1987-09-04','SA_REP',6200.00,0.10,149,80),(180,'Winston','Taylor','WTAYLOR','650.507.9876','1987-09-05','SH_CLERK',3200.00,0.00,120,50),(181,'Jean','Fleaur','JFLEAUR','650.507.9877','1987-09-06','SH_CLERK',3100.00,0.00,120,50),(182,'Martha','Sullivan','MSULLIVA','650.507.9878','1987-09-07','SH_CLERK',2500.00,0.00,120,50),(183,'Girard','Geoni','GGEONI','650.507.9879','1987-09-08','SH_CLERK',2800.00,0.00,120,50),(184,'Nandita','Sarchand','NSARCHAN','650.509.1876','1987-09-09','SH_CLERK',4200.00,0.00,121,50),(185,'Alexis','Bull','ABULL','650.509.2876','1987-09-10','SH_CLERK',4100.00,0.00,121,50),(186,'Julia','Dellinger','JDELLING','650.509.3876','1987-09-11','SH_CLERK',3400.00,0.00,121,50),(187,'Anthony','Cabrio','ACABRIO','650.509.4876','1987-09-12','SH_CLERK',3000.00,0.00,121,50),(188,'Kelly','Chung','KCHUNG','650.505.1876','1987-09-13','SH_CLERK',3800.00,0.00,122,50),(189,'Jennifer','Dilly','JDILLY','650.505.2876','1987-09-14','SH_CLERK',3600.00,0.00,122,50),(190,'Timothy','Gates','TGATES','650.505.3876','1987-09-15','SH_CLERK',2900.00,0.00,122,50),(191,'Randall','Perkins','RPERKINS','650.505.4876','1987-09-16','SH_CLERK',2500.00,0.00,122,50),(192,'Sarah','Bell','SBELL','650.501.1876','1987-09-17','SH_CLERK',4000.00,0.00,123,50),(193,'Britney','Everett','BEVERETT','650.501.2876','1987-09-18','SH_CLERK',3900.00,0.00,123,50),(194,'Samuel','McCain','SMCCAIN','650.501.3876','1987-09-19','SH_CLERK',3200.00,0.00,123,50),(195,'Vance','Jones','VJONES','650.501.4876','1987-09-20','SH_CLERK',2800.00,0.00,123,50),(196,'Alana','Walsh','AWALSH','650.507.9811','1987-09-21','SH_CLERK',3100.00,0.00,124,50),(197,'Kevin','Feeney','KFEENEY','650.507.9822','1987-09-22','SH_CLERK',3000.00,0.00,124,50),(198,'Donald','OConnell','DOCONNEL','650.507.9833','1987-09-23','SH_CLERK',2600.00,0.00,124,50),(199,'Douglas','Grant','DGRANT','650.507.9844','1987-09-24','SH_CLERK',2600.00,0.00,124,50),(200,'Jennifer','Whalen','JWHALEN','515.123.4444','1987-09-25','AD_ASST',4400.00,0.00,101,10),(201,'Michael','Hartstein','MHARTSTE','515.123.5555','1987-09-26','MK_MAN',13000.00,0.00,100,20),(202,'Pat','Fay','PFAY','603.123.6666','1987-09-27','MK_REP',6000.00,0.00,201,20),(203,'Susan','Mavris','SMAVRIS','515.123.7777','1987-09-28','HR_REP',6500.00,0.00,101,40),(204,'Hermann','Baer','HBAER','515.123.8888','1987-09-29','PR_REP',10000.00,0.00,101,70),(205,'Shelley','Higgins','SHIGGINS','515.123.8080','1987-09-30','AC_MGR',12000.00,0.00,101,110),(206,'William','Gietz','WGIETZ','515.123.8181','1987-10-01','AC_ACCOUNT',8300.00,0.00,205,110);

/* 1. Write a query to display the name (first_name, last_name) and salary for all employees 
	whose salary is not in the range $10,000 through $15,000. */
    
select first_name, last_name, salary from `employees`
where salary not between 10000 and 15000
order by salary desc;

/* 2. Write a query to display the name (first_name, last_name) and 
	  department ID of all employees in departments 30 or 100 in ascending order.  */

select first_name, last_name, department_id from `employees`
where department_id = 30 or department_id = 100
order by 3;

/* 3. Write a query to display the name (first_name, last_name) and salary for all 
	  employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100. */ 

select first_name, last_name, salary from `employees`
where (salary not between 10000 and 15000) AND (department_id in (30,100))
order by 3;

/* 4. Write a query to display the name (first_name, last_name) and hire date for 
	all employees who were hired in 1987. */

select first_name, last_name, hire_date from `employees`
where extract(year from hire_date) = 1987;

select first_name, last_name, hire_date,year(hire_date) from `employees`
where year(hire_date) = 1987;

/* 5. Write a query to display the first_name of all employees 
	who have both "b" and "c" in their first name.  */
    
select first_name from `employees`
where first_name like '%b%' and first_name like '%c%';

/* 6. Write a query to display the last name, job, and salary for all employees whose job is 
that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000. */

select last_name, JOB_ID, salary from employees
where JOB_ID in ('IT_PROG', 'SH_CLERK') and salary not in (4500, 10000, 15000);

select distinct job_id from employees;

/* 7. Write a query to display the last name of employees whose names have exactly 6 characters. */

select last_name from employees
where last_name regexp '^.{6}$';

/* 8. Write a query to display the last name of employees having 'e' as the third character.  */

select last_name from employees
where last_name regexp '^.{2}e';

/* 9. Write a query to display the jobs/designations available in the employees table.  */

select distinct job_id from employees;

/* 10. Write a query to display the name (first_name, last_name), salary and PF (15% of salary) of all employees.  */

select first_name, last_name, salary, salary*0.15 as PF from employees;

/* 11. Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'. */

select * from employees where last_name in ('BLAKE', 'SCOTT', 'KING', 'FORD');

### Aggregate Functions and Group by [14 exercises with solution] -------

/* 4. Write a query to get the maximum salary of an employee working as a Programmer.*/

select max(salary) from employees where job_id = 'it_prog';

/* 5. Write a query to get the average salary and number of employees working the department 90. */

select avg(salary), count(*) from employees 
where department_id = 90;

/* 7. Write a query to get the number of employees with the same job.  */

select job_id, count(*) as no_of_emp from employees
group by job_id
order by 2 desc;

/* 8. Write a query to get the difference between the highest and lowest salaries.  */

select job_id, max(salary) - min(salary) from employees
group by 1
order by 2 desc;

/* 9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.  */

select manager_id, min(salary) from employees
group by 1
order by 2 desc;

/* 10. Write a query to get the department ID and the total salary payable in each department.  */

select department_id, sum(salary) from employees
group by 1
order by 2 desc;

/* 11. Write a query to get the average salary for each job ID excluding programmer.  */

select job_id, avg(salary) from employees
where job_id != 'it_prog'
group by 1
order by 2 desc;

/* 12. Write a query to get the total salary, maximum, minimum, average salary 
	   of employees (job ID wise), for department ID 90 only.  */
       
select job_id, sum(salary), max(salary), min(salary), avg(salary) from employees
where department_id = 90
group by 1
order by 2 desc;

/* 13. Write a query to get the job ID and maximum salary of the employees 
	   where maximum salary is greater than or equal to $4000.  */
       
select job_id, max(salary) as max_sal from employees
group by 1
having max_sal >= 4000
order by 2 desc;

/* 14. Write a query to get the average salary for all departments employing more than 10 employees. */

select department_id, avg(salary), count(*) as no_of_emp from employees
group by 1
having no_of_emp > 10
order by 3 desc;

CREATE TABLE `departments` (
  `DEPARTMENT_ID` decimal(4,0) NOT NULL DEFAULT '0',
  `DEPARTMENT_NAME` varchar(30) NOT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `LOCATION_ID` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`DEPARTMENT_ID`),
  KEY `DEPT_MGR_FK` (`MANAGER_ID`),
  KEY `DEPT_LOCATION_IX` (`LOCATION_ID`)
);

INSERT INTO `departments` VALUES (10,'Administration',200,1700),(20,'Marketing',201,1800),(30,'Purchasing',114,1700),(40,'Human Resources',203,2400),(50,'Shipping',121,1500),(60,'IT',103,1400),(70,'Public Relations',204,2700),(80,'Sales',145,2500),(90,'Executive',100,1700),(100,'Finance',108,1700),(110,'Accounting',205,1700),(120,'Treasury',0,1700),(130,'Corporate Tax',0,1700),(140,'Control And Credit',0,1700),(150,'Shareholder Services',0,1700),(160,'Benefits',0,1700),(170,'Manufacturing',0,1700),(180,'Construction',0,1700),(190,'Contracting',0,1700),(200,'Operations',0,1700),(210,'IT Support',0,1700),(220,'NOC',0,1700),(230,'IT Helpdesk',0,1700),(240,'Government Sales',0,1700),(250,'Retail Sales',0,1700),(260,'Recruiting',0,1700),(270,'Payroll',0,1700);



/* 1. Write a query to find the name (first_name, last_name) and the salary of the employees 
	  who have a higher salary than the employee whose last_name='Bull'.  */
      
select first_name, last_name, salary from employees
where salary > ( select salary from employees where last_name = 'Bull')
order by 3 desc;

/*2. Write a query to find the name (first_name, last_name) of all employees who works in the IT department. */

select first_name, last_name from employees
where department_id in ( select department_id from departments where department_name = 'IT');

