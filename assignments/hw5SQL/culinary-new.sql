-- CS775/875
-- Assignment #5
-- Database - SQL Source File


USE cs775;

drop table registrations;
drop table schedule;
drop table students;
drop table staff;
drop table offerings;
drop table courses;


CREATE TABLE courses
(
  
   code                 VARCHAR(5),
   school		VARCHAR(35),
   course		VARCHAR(35),
   level		INT,
   description	TEXT,	
   credits		INT,
   
   PRIMARY KEY (code)
);

INSERT INTO `courses` (`code`, `school`, `course`, `level`, `description`, `credits`) VALUES
('cs1', 'Charlie''s Cooking School', 'Sausages', 1, 'Hot Dogs', 3),
('cs2', 'Charlie''s Cooking School', 'Sausages', 2, 'Bratwurst', 4),
('cs3', 'Charlie''s Cooking School', 'Sausages', 3, 'Chorizo', 5),
('cs4', 'Charlie''s Cooking School', 'Sausages', 4, 'Kielbasa', 3),
('cs5', 'Charlie''s Cooking School', 'Sausages', 5, 'Andouille', 2),
('fc1', 'French Academy', 'Croissants', 1, 'A terminal course in Croissant Construction', 3),
('hb1', 'Hans''s Haute Cuisine', 'Bavarian', 1, 'Pretzels and Sauerkraut', 3),
('jp1', 'Jacque''s Culinary Adventure', 'Pastries', 1, 'Croissants', 4),
('jp2', 'Jacque''s Culinary Adventure', 'Pastries', 2, 'Macarons', 4),
('ln1', 'Lorenzo''s Lean Cuisine', 'Napoli', 1, 'Pasta and Gnocchi', 4);


CREATE TABLE offerings
(
   code                 VARCHAR(5),
   classdate	DATE,	
   location		VARCHAR(35),

   PRIMARY KEY (code, classdate),
   FOREIGN KEY (code) REFERENCES courses (code)
);

INSERT INTO `offerings` (`code`, `classdate`, `location`) VALUES
('cs1', '2016-01-01', 'Boston'),
('cs1', '2016-01-10', 'Berlin'),
('cs2', '2016-01-02', 'New York'),
('cs2', '2016-01-11', 'Toronto'),
('cs3', '2016-01-03', 'Chicago'),
('cs3', '2016-01-12', 'Berlin'),
('cs4', '2016-01-04', 'Seattle'),
('cs4', '2016-01-13', 'Hamburg'),
('cs5', '2016-01-05', 'San Diego'),
('cs5', '2016-01-14', 'Geneva'),
('fc1', '2015-11-19', 'Dijon'),
('hb1', '2016-01-08', 'Berlin'),
('hb1', '2016-01-17', 'Houston'),
('jp1', '2016-01-06', 'Paris'),
('jp1', '2016-01-15', 'London'),
('jp2', '2016-01-07', 'Nantes'),
('jp2', '2016-01-16', 'Dublin'),
('ln1', '2016-01-09', 'Naples'),
('ln1', '2016-01-18', 'Rome'),
('jp2', '2016-02-16', 'Dublin'),
('ln1', '2016-02-09', 'Naples');

CREATE TABLE students 
(
   ssn			INT,
   name			VARCHAR(30),
   totalcredits	INT,

   PRIMARY KEY (ssn)
);

INSERT INTO `students` (`ssn`, `name`, `totalcredits`) VALUES
(1111, 'joe', 15),
(2222, 'mary', 25),
(3333, 'steve', 35),
(8888, 'tommy', 23);


CREATE TABLE staff
(
   ssn		INT,
   name		VARCHAR(30),
   job		VARCHAR(20),


   PRIMARY KEY (ssn)
);

INSERT INTO `staff` (`ssn`, `name`, `job`) VALUES
(1111, 'joe', 'chef'),
(5555, 'alice', 'assistant'),
(7777, 'marcus', 'assistant');

CREATE TABLE registrations
(
   ssn			INT,
   code                 VARCHAR(5),
   classdate	DATE,	
   balance		INT,

   PRIMARY KEY (ssn, code, classdate),
   FOREIGN KEY (ssn) REFERENCES students (ssn),
   FOREIGN KEY (code, classdate) REFERENCES offerings (code, classdate)
);

INSERT INTO `registrations` (`ssn`, `code`, `classdate`, `balance`) VALUES
(1111, 'cs1', '2016-01-10', 170),
(1111, 'cs2', '2016-01-11', 800),
(1111, 'cs3', '2016-01-12', 240),
(1111, 'cs4', '2016-01-04', 1000),
(2222, 'cs1', '2016-01-10', 70),
(2222, 'cs2', '2016-01-11', 210),
(2222, 'cs3', '2016-01-12', NULL),
(2222, 'cs4', '2016-01-04', 1234),
(2222, 'fc1', '2015-11-19', 0),
(2222, 'jp1', '2016-01-15', 0),
(2222, 'jp2', '2016-01-16', 0),
(3333, 'cs1', '2016-01-01', 9),
(3333, 'cs3', '2016-01-03', 2000),
(3333, 'cs5', '2016-01-05', 5),
(3333, 'cs5', '2016-01-14', 8),
(3333, 'hb1', '2016-01-08', 8),
(3333, 'hb1', '2016-01-17', 0),
(3333, 'jp1', '2016-01-06', NULL),
(3333, 'jp2', '2016-01-07', 11),
(8888, 'hb1', '2016-01-08', 8);

CREATE TABLE schedule
(
   ssn			INT,
   code                 VARCHAR(5),
   classdate	DATE,
   wages			INT,
   
   PRIMARY KEY (ssn, code, classdate),
   FOREIGN KEY (ssn) REFERENCES staff (ssn),
   FOREIGN KEY (code, classdate) REFERENCES offerings (code, classdate)
);

INSERT INTO `schedule` (`ssn`, `code`, `classdate`,`wages`) VALUES
(1111, 'hb1', '2016-01-08',100),
(5555, 'jp1', '2016-01-06',100),
(5555, 'jp1', '2016-01-15',100),
(5555, 'ln1', '2016-01-09',1000),
(7777, 'cs3', '2016-01-12',1000),
(7777, 'ln1', '2016-01-18',NULL);

SELECT * FROM courses;
SELECT * FROM offerings;
SELECT * FROM students;
SELECT * FROM staff;
SELECT * FROM registrations;
SELECT * FROM schedule;

