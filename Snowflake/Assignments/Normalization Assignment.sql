use bikestores;

CREATE TABLE IF NOT EXISTS therapist_directory(
therapist_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
gender VARCHAR(10),
insurance VARCHAR(3) CHECK(insurance IN ('Yes', 'No')),
new_patients VARCHAR(3) CHECK(new_patients IN ('Yes', 'No')),
speciality_one VARCHAR(100),
speciality_two VARCHAR(100),
speciality_three VARCHAR(100),
license VARCHAR(5) CHECK(license IN ('MFT', 'PhD', 'MD')),
phone CHAR(10)
);

CREATE TABLE IF NOT EXISTS hospitals(
hospital_name VARCHAR(50),
state CHAR(2),
city VARCHAR(20),
therapist VARCHAR(100)
);


INSERT INTO therapist_directory(name, gender, insurance,
new_patients, speciality_one,speciality_two, speciality_three,
license, phone)
VALUES ('Flora Martinez', 'Female', 'Yes', 'Yes', 'OCD','Phobias', 'Anxiety', 'MD', '8495776489'),
('Andy James', 'Male', 'Yes', 'No', 'Depression', 'Anxiety','PTSD', 'PhD', '2340894766'),
('Hannah Myers', 'Female', 'No', 'Yes', 'Anxiety','Schizophrenia', 'Bipolar', 'MD', '9907846574'),
('Jane Huang', 'Female', 'Yes', 'Yes', 'Depression', 'Anxiety','Bipolar', 'MD', '4507856797'),
('April Adams', 'Female', 'No', 'Yes', 'OCD', 'Anxiety', 'PTSD','MFT', '4507856797'),
('Jon Schaffer', 'Male', 'Yes', 'No', 'BPD', 'Bipolar','Depression', 'PhD', '9907846574'),
('Shauna West','Female', 'Yes', 'Yes', 'ADHD', 'Anxiety', 'OCD','MD', '8495776480'),
('Juan Angelo', 'Male', 'No', 'Yes', 'Schizophrenia', 'Bipolar','Depression', 'MD', '4507856797'),
('Christie Yang', 'Female', 'Yes', 'Yes', 'Autism', 'ADHD','OCD', 'PhD', '4507856796'),
('Annika Neusler', 'Female', 'Yes', 'No', 'Addiction','Depression', 'PTSD', 'MFT', '9907846575'),
('Simone Anderson', 'Female', 'No', 'No', 'Schizophrenia','Depression', 'PTSD', 'MD', '8304498765'),
('Ted Nyguen', 'Male', 'Yes', 'Yes', 'ADHD', 'Anxiety','Phobias', 'PhD', '4301239990'),
('Valentino Rossi', 'Male', 'Yes', 'Yes', 'Autism', 'Anxiety','Depression', 'MD', '8304498765'),
('Jessica Armer', 'Female', 'No', 'Yes', 'PTSD', 'Bipolar','Depression', 'MD', '3330456612'),
('Sid Michaels', 'Female', 'Yes', 'Yes', 'OCD', 'Phobia','Anxiety', 'MFT', '4301239997'),
('Yen Waters', 'Male', 'Yes', 'Yes', 'Anxiety', 'Depression','ADHD', 'PhD', '4507856796'),
('Ru Izaelia', 'Female', 'No', 'Yes', 'Bipolar', 'BPD','Phobias', 'MD', '4301239990'),
('Vishal Rao', 'Male', 'Yes', 'Yes', 'Depression','Schizophrenia', 'Anxiety', 'MD', '7305557894'),
('Lana John', 'Female', 'Yes', 'Yes', 'Anxiety', 'Phobias','OCD', 'MFT', '7305557894'),
('Izzie Geralt', 'Female', 'Yes', 'Yes', 'Depression','Addiction', 'Anxiety', 'MD', '4301239990'); 

INSERT INTO hospitals(hospital_name, state, city, therapist)
VALUES ('Van Holsen Community Hospital', 'CA', 'San Francisco', 'Flora Martinez'),
('Clear Water Services', 'CA', 'San Diego', 'Andy James'),
('Imagery Health', 'CA', 'Sacramento', 'Hannah Myers'),
('Blue Cross Clinic', 'CA', 'Los Angeles', 'Jane Huang'),
('Blue Cross Clinic', 'CA', 'Los Angeles', 'April Adams'),
('Imagery Health', 'CA', 'Sacramento', 'Jon Schaffer'),
('Van Holsen Community Hospital', 'CA', 'Long Beach', 'Shauna West'),
('Blue Cross Clinic', 'CA', 'Santa Barbara', 'Juan Angelo'),
('Blue Cross Clinic', 'CA', 'San Francisco', 'Christie Yang'),
('Imagery Health', 'CA', 'Auburn', 'Annika Neusler'),
('Holistic Health Services', 'CA', 'Santa Barbara', 'Simone Anderson'),
('Open Clinic', 'CA', 'San Jose', 'Ted Nyguen'),
('Holistic Health Services', 'CA', 'Santa Barbara', 'Valentino Rossi'),
('Clark Jamison Hospitals', 'CA', 'Fresno', 'Jessica Armer'),
('Open Clinic', 'CA', 'Oakland', 'Sid Michaels'),
('Blue Cross Clinic', 'CA', 'San Francisco', 'Yen Waters'),
('Open Clinic', 'CA', 'San Jose', 'Ru Izaelia'),
('Clear Minds Community', 'CA', 'Sacramento', 'Vishal Rao'),
('Clear Minds Community', 'CA', 'Sacramento', 'Lana John'),
('Open Clinic', 'CA', 'San Jose', 'Izzie Geralt');

SELECT * FROM therapist_directory;
SELECT * FROM hospitals;

## Determine the number of therapists in Northern California that specialize in mood disorders and, 
## of these therapists, how many are currently accepting new patients.

## We will perform 1NF before fetching this data.

ALTER TABLE hospitals ADD COLUMN hospital_id INT PRIMARY KEY AUTO_INCREMENT ;

ALTER TABLE hospitals ADD COLUMN therapist_id INT;

SET SQL_SAFE_UPDATES = 0;

UPDATE hospitals h 
   SET therapist_id = (SELECT therapist_id FROM therapist_directory td WHERE h.therapist = td.name)
   WHERE h.therapist is not null;
   

## ADDING FOREIGN KEY CONSTRAINT TO HOSPITAL TABLE

ALTER TABLE hospitals
	ADD CONSTRAINT fk_therapist_directory
    FOREIGN KEY (therapist_id) 
    REFERENCES therapist_directory(therapist_id);
    
## drop the therapist name column from hospitals table to make table relevant
ALTER TABLE HOSPITALS
	DROP COLUMN THERAPIST;
   
SELECT * FROM therapist_directory;
SELECT * FROM hospitals;

# SEGREGATE FIRST NAME & LAST NAME IN DIFF COLUMNS NAMED FIRST_NAME AND LAST_NAME
ALTER TABLE therapist_directory
ADD COLUMN last_name varchar(30);

# updating the last_name column
UPDATE therapist_directory
SET last_name = substring(name, position(' ' in name)+1, length(name));

# updating the name with the first_name
ALTER TABLE therapist_directory
RENAME COLUMN name to first_name;

# updating the value of first_name
UPDATE therapist_directory
SET first_name = SUBSTRING(first_name, 1, POSITION(' ' IN first_name)-1);


/* There are also repeating groups of data in the therapist_directory table (“speciality_one”, 
“speciality_two” and “speciality_three”). We’ll move these variables to their own table. 
Don’t forget to add a primary and foreign key to the new table!*/

CREATE TABLE IF NOT EXISTS specialities(
	specialities_key serial PRIMARY KEY,
    speciality_one varchar(100),
    speciality_two varchar(100),
    speciality_three varchar(100),
    therapist_id integer,
    constraint fk_therapist_directory_2
    foreign key (therapist_id) references therapist_directory(therapist_id)
    );
    
insert into specialities(therapist_id, speciality_one, speciality_two, speciality_three)
select therapist_id, speciality_one, speciality_two, speciality_three 
from therapist_directory;

select * from specialities;

# dropping speciality column from the therapist-directory table\
alter table therapist_directory
drop column speciality_one,
drop column speciality_two,
drop column speciality_three;


CREATE TABLE IF NOT EXISTS visit_specifications(
 therapist_id INTEGER PRIMARY KEY,
 insurance VARCHAR(3) CHECK(insurance IN ('Yes', 'No')), 
 new_patients VARCHAR(3) CHECK(new_patients IN ('Yes', 'No')),
 CONSTRAINT fk_visits
 FOREIGN KEY(therapist_id)
 REFERENCES therapist_directory(therapist_id));
 
insert into visit_specifications
select therapist_id, insurance, new_patients
from therapist_directory;

select * from specialities;
select * from visit_specifications;
SELECT * FROM therapist_directory;
SELECT * FROM hospitals;