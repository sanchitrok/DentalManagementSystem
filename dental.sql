/*Creating Schema*/
CREATE SCHEMA `dental` ;


/*Select database*/
use dental;
-- Table specialization


/* Creating tables and adding primary keys*/
CREATE TABLE `specialization`
(
  `specialization` Varchar(20) NOT NULL,
  `dentist_id` Int NOT NULL
)
;

ALTER TABLE `specialization` ADD PRIMARY KEY (`dentist_id`)
;

-- Table dentist

CREATE TABLE `dentist`
(
  `dentist_id` Int NOT NULL,
  `first_name` Varchar(20) NOT NULL,
  `middle_name` Varchar(20),
  `last_name` Varchar(20) NOT NULL,
  `contact_number` Char(20) NOT NULL
)
;

ALTER TABLE `dentist` ADD PRIMARY KEY (`dentist_id`)
;
-- Table dentist_license

CREATE TABLE `dentist_license`
(
  `license_number` Varchar(20) NOT NULL,
  `authority` Varchar(20) NOT NULL,
  `expiry_date` Date NOT NULL,
  `dentist_id` Int NOT NULL
)
;

ALTER TABLE `dentist_license` ADD PRIMARY KEY (`license_number`, `dentist_id`)
;
-- Table login

CREATE TABLE `login`
(
  `username` Varchar(20) NOT NULL,
  `password` Varchar(20) NOT NULL,
  `role` Varchar(20) NOT NULL,
  `dentist_id` Int NOT NULL
)
;

CREATE INDEX `IX_Relationship2` ON `login` (`dentist_id`)
;

ALTER TABLE `login` ADD PRIMARY KEY (`username`)
;
-- Table insurance

CREATE TABLE `insurance`
(
  `policy_number` Varchar(20) NOT NULL,
  `provider` Varchar(20) NOT NULL,
  `max_coverage` Int NOT NULL,
  `patient_id` Int NOT NULL,
  `begin_date` Date NOT NULL,
  `end_date` Date NOT NULL,
  `subscriber` Varchar(20) NOT NULL
)
;

CREATE INDEX `IX_Relationship4` ON `insurance` (`patient_id`)
;

ALTER TABLE `insurance` ADD PRIMARY KEY (`policy_number`)
;
-- Table medical_history

CREATE TABLE `medical_history`
(
  `patient_id` Int NOT NULL,
  `medications` Bit(1),
  `latex_allergy` Bit(1),
  `amalgam_allergy` Bit(1),
  `anaesthetic_allergy` Bit(1),
  `fluoride_allergy` Bit(1),
  `dentures_allergy` Bit(1),
  `total_teeth` Int,
  `other_allergies` Bit(1)
)
;

ALTER TABLE `medical_history` ADD PRIMARY KEY (`patient_id`)
;

-- Table dentist_schedule

CREATE TABLE `dentist_schedule`
(
  `slot1` Bit(1) NOT NULL,
  `slot2` Bit(1) NOT NULL,
  `slot3` Bit(1) NOT NULL,
  `slot4` Bit(1) NOT NULL,
  `slot5` Bit(1) NOT NULL,
  `slot6` Bit(1) NOT NULL,
  `slot7` Bit(1) NOT NULL,
  `slot8` Bit(1) NOT NULL,
  `date` Date NOT NULL,
  `dentist_id` Int NOT NULL
)
;

ALTER TABLE `dentist_schedule` ADD PRIMARY KEY (`dentist_id`)
;
-- Table treatment_catalog

CREATE TABLE `treatment_catalog`
(
  `treatment_name` Varchar(20) NOT NULL,
  `treatment_cost` Int NOT NULL
)
;

ALTER TABLE `treatment_catalog` ADD PRIMARY KEY (`treatment_name`)
;
-- Table treatment

CREATE TABLE `treatment`
(
  `treatment_cost` Int NOT NULL,
  `appointment_id` Int NOT NULL,
  `treatment_name` Varchar(20)
)
;

CREATE INDEX `IX_Relationship9` ON `treatment` (`treatment_name`)
;

CREATE INDEX `IX_Relationship10` ON `treatment` (`appointment_id`)
;
-- Table appointment

CREATE TABLE `appointment`
(
  `appointment_id` Int NOT NULL,
  `patient_id` Int NOT NULL,
  `status` Varchar(20) NOT NULL,
  `date` Date NOT NULL,
  `start_time` Time NOT NULL,
  `end_time` Time NOT NULL,
  `dentist_id` Int,
  `room_number` Varchar(20)
)
;

CREATE INDEX `IX_Relationship7` ON `appointment` (`dentist_id`)
;

CREATE INDEX `IX_Relationship8` ON `appointment` (`patient_id`)
;

CREATE INDEX `IX_Relationship11` ON `appointment` (`room_number`)
;

ALTER TABLE `appointment` ADD PRIMARY KEY (`appointment_id`)
;
-- Table patient

CREATE TABLE `patient`
(
  `patient_id` Int NOT NULL,
  `first_name` Varchar(20) NOT NULL,
  `middle_name` Varchar(20),
  `last_name` Varchar(20) NOT NULL,
  `contact_number` Char(20) NOT NULL,
  `date_of_birth` Date NOT NULL,
  `addressline1` Varchar(20) NOT NULL,
  `addressline2` Varchar(20),
  `zip_code` Char(20) NOT NULL,
  `emergency_contact_number` Char(20),
  `gender` Char(20),
  `email_address` Varchar(20) NOT NULL
)
;

ALTER TABLE `patient` ADD PRIMARY KEY (`patient_id`)
;
-- Table tooth

CREATE TABLE `tooth`
(
  `tooth_id` Char(20) NOT NULL,
  `tooth_type` Varchar(20),
  `treatment_description` Varchar(20),
  `patient_id` Int
)
;

CREATE INDEX `IX_Relationship12` ON `tooth` (`patient_id`)
;
-- Table prescription

CREATE TABLE `prescription`
(
  `medicine_name` Varchar(20) NOT NULL,
  `morning` Bit(1) NOT NULL,
  `afternoon` Bit(1) NOT NULL,
  `night` Bit(1) NOT NULL,
  `duration` Int NOT NULL,
  `notes` Varchar(20),
  `appointment_id` Int NOT NULL
)
;

ALTER TABLE `prescription` ADD PRIMARY KEY (`medicine_name`, `appointment_id`)
;
-- Table invoice

CREATE TABLE `invoice`
(
  `invoice_id` Int NOT NULL,
  `date` Datetime NOT NULL,
  `amount` Int,
  `appointment_id` Int NOT NULL
)
;

ALTER TABLE `invoice` ADD PRIMARY KEY (`invoice_id`, `appointment_id`)
;
-- Table room

CREATE TABLE `room`
(
  `room_number` Varchar(20) NOT NULL,
  `room_type` Varchar(20),
  `location_id` Varchar(20) NOT NULL
)
;

CREATE INDEX `IX_Relationship18` ON `room` (`location_id`)
;

ALTER TABLE `room` ADD PRIMARY KEY (`room_number`)
;
-- Table location

CREATE TABLE `location`
(
  `location_id` Varchar(20) NOT NULL,
  `addressline1` Varchar(20) NOT NULL,
  `addressline2` Varchar(20),
  `contact_number` Char(20) NOT NULL,
  `zip_code` Char(20) NOT NULL
)
;

CREATE INDEX `IX_Relationship20` ON `location` (`zip_code`)
;

ALTER TABLE `location` ADD PRIMARY KEY (`location_id`)
;
-- Table equipment

CREATE TABLE `equipment`
(
  `equipment_name` Varchar(20) NOT NULL,
  `maintenance_due_date` Date NOT NULL,
  `warranty_end_date` Date NOT NULL,
  `purchase_date` Date NOT NULL,
  `equipment_id` Int NOT NULL,
  `room_number` Varchar(20)
)
;

CREATE INDEX `IX_Relationship13` ON `equipment` (`room_number`)
;

ALTER TABLE `equipment` ADD PRIMARY KEY (`equipment_id`)
;
-- Table location_catalouge

CREATE TABLE `location_catalouge`
(
  `zip_code` Char(20) NOT NULL,
  `city` Varchar(20) NOT NULL,
  `county` Varchar(20) NOT NULL
)
;

ALTER TABLE `location_catalouge` ADD PRIMARY KEY (`zip_code`)
;
-- Table supplies

CREATE TABLE `supplies`
(
  `supplies_name` Varchar(20) NOT NULL,
  `no_of_units` Int NOT NULL,
  `cost_of_each_unit` Int NOT NULL,
  `location_id` Varchar(20) NOT NULL,
  `supply_id` Int NOT NULL
)
;

CREATE INDEX `IX_Relationship16` ON `supplies` (`location_id`)
;


/*Adding foreign keys*/
ALTER TABLE `supplies` ADD PRIMARY KEY (`supply_id`)
;
ALTER TABLE `specialization` ADD CONSTRAINT `dentist has specialization` FOREIGN KEY (`dentist_id`) REFERENCES `dentist` (`dentist_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `dentist_license` ADD CONSTRAINT `dentist has license(s)` FOREIGN KEY (`dentist_id`) REFERENCES `dentist` (`dentist_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `appointment` ADD CONSTRAINT `one dentist will have many appointments` FOREIGN KEY (`dentist_id`) REFERENCES `dentist` (`dentist_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `dentist_schedule` ADD CONSTRAINT `every dentist will have a schedule` FOREIGN KEY (`dentist_id`) REFERENCES `dentist` (`dentist_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `login` ADD CONSTRAINT `every dentist will have a login` FOREIGN KEY (`dentist_id`) REFERENCES `dentist` (`dentist_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `insurance` ADD CONSTRAINT `patient has insurance(s)` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `medical_history` ADD CONSTRAINT `each patient has a medical history` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `treatment` ADD CONSTRAINT `treatment reference from retreatment_catalog` FOREIGN KEY (`treatment_name`) REFERENCES `treatment_catalog` (`treatment_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `treatment` ADD CONSTRAINT `app can have treatment(s)` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `appointment` ADD CONSTRAINT `appointment takes place in a room` FOREIGN KEY (`room_number`) REFERENCES `room` (`room_number`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `invoice` ADD CONSTRAINT `each appointment generates invoice(s)` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `prescription` ADD CONSTRAINT `appointment has a prescription` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `appointment` ADD CONSTRAINT `patient can have many appointment(s)` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `tooth` ADD CONSTRAINT `patient can have a tooth` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `room` ADD CONSTRAINT `one location can have multiple rooms` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `equipment` ADD CONSTRAINT `room has equipment(s)` FOREIGN KEY (`room_number`) REFERENCES `room` (`room_number`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `location` ADD CONSTRAINT `one location reference can have multiple locations` FOREIGN KEY (`zip_code`) REFERENCES `location_catalouge` (`zip_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `supplies` ADD CONSTRAINT `location has supplies` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


/*inserting values into tables*/
Insert into patient (patient_id,first_name,last_name,contact_number,date_of_birth,addressline1,zip_code,gender,email_address) 
values (1,'Leon','Mendes','9871234456','1996-12-19','Andheri','400064','M','leonmendes@gmail.com'),
(2,'Anto','Fernando','9876543213','1996-09-09','Dadar','400056','M','af@gmail.com'),
 (3,'Manisha','Moku','9987654389','1996-08-01','Jogeshwari','400065','F','mm@gmail.com'),
 (4,'Chinmay','Pawar','9985674398','1996-11-26','Jogeshwari','400065','M','cp@gmail.com'),
 (5,'Aurelio','Roberlio','9087643309','1996-09-10','Goa','400011','M','ar@gmail.com'),
 (6,'Pratiksha','Saravodya','9984554378','1996-04-28','Thane','400045','F','ps@gmail.com'),
 (7,'Riddic','Carlo','9988954378','1996-01-24','Mira Road','400095','M','rc@gmail.com'),
 (8,'Suraj','Gurav','9547657689','1996-03-28','Mira Road','432065','M','sg@gmail.com'),
 (9,'Britney','Scott','9986757609','1996-08-09','Chicago','444465','F','bs@gmail.com'),
 (10,'Rushabh','Sudame','9987654334','1996-10-06','Pune','456065','M','rs@gmail.com'),
 (11,'Sunil','Dsouza','9982354376','1996-11-14','Nalasopara','407865','M','sd@gmail.com'),
 (12,'Rashmi','Patel','9567656709','1997-09-06','Ahmedabad','432098','F','rp@gmail.com'),
 (13,'Divanshu','Raina','9976654356','1998-07-013','Mahim','400023','M','dr@gmail.com'),
 (14,'Ashish','Sankhe','9986554358','1994-08-23','Karjat','407869','M','as@gmail.com'),
 (15,'Sunita','Palkar','9587654389','1995-02-06','Powai','400089','F','sp@gmail.com'),
 (16,'Prateek','Kalkumbe','9987654347','1995-10-13','Pimpri','400087','M','pk@gmail.com'),
 (17,'Aditya','Sinha','9984554376','1993-07-23','Chinchwad','400067','M','as@gmail.com'),
 (18,'Shreya','Jain','9677654370','1992-05-10','Boston','400078','F','sj@gmail.com'),
 (19,'Chaitnya','Pujari','9987654390','1993-12-16','Satara','400023','M','cp@gmail.com'),
 (20,'Santosh','Rathore','9987654561','1992-01-16','Indore','400455','M','sr@gmail.com'),
 (21,'Deepika','Koli','8987654367','1992-07-08','Texas','400012','F','dk@gmail.com'),
 (22,'Nimisha','Palke','9987623323','1994-08-23','Jaipur','400020','F','np@gmail.com'),
 (23,'Ankita','Singh','9987234367','1995-12-01','Jharkhand','400021','F','as@gmail.com'),
 (24,'Navya','Sharma','9487645323','1990-12-23','Bangalore','400043','F','ns@gmail.com'),
 (25,'Shweta','Raj','9923656376','1991-07-11','Kerala','404321','F','sr@gmail.com');
 
 
 insert into insurance (policy_number,provider,max_coverage,patient_id,begin_date,end_date,subscriber)
 values('PI1','BlueCross',3000,1,'2012-01-01','2022-01-01','Leon'),
 ('PI2','RedCross',5000,3,'2010-01-01','2018-01-01','Manisha'),
 ('PI3','GreenCross',4500,9,'2015-01-01','2025-01-01','Britney'),
 ('PI4','BlueShield',7000,14,'2002-01-01','2012-01-01','Ashish'),
 ('PI5','RedShield',8000,17,'2015-01-01','2030-01-01','Aditya'),
 ('PI6','RedCross',9000,18,'2009-01-01','2019-01-01','Shreya'),
 ('PI7','BlueCross',7800,20,'2020-01-01','2022-01-01','Santosh'),
 ('PI8','BlueShield',6800,23,'2008-01-01','2018-01-01','Ankita'),
 ('PI9','RedShield',5500,25,'2005-01-01','2025-01-01','Shweta'),
 ('PI10','RedShield',3500,21,'2011-01-01','2021-01-01','Deepika');


 insert into medical_history 
 (patient_id,medications,latex_allergy,amalgam_allergy,anaesthetic_allergy,
 fluoride_allergy,dentures_allergy,total_teeth,other_allergies)
 values(1,1,1,0,1,0,1,32,0),
 (2,0,0,1,1,0,1,31,1),
 (3,1,0,1,0,1,1,29,0),
 (4,0,1,1,1,0,1,28,1),
 (5,0,0,1,1,0,1,30,0),
 (6,1,0,1,1,0,1,31,0),
 (7,1,0,0,1,0,1,30,0),
 (8,0,1,1,0,0,1,31,0),
 (9,1,1,0,1,1,1,30,1),
 (10,0,0,1,1,0,1,29,0),
 (11,0,1,1,0,0,1,28,1),
 (12,1,0,0,1,0,1,31,0),
 (13,0,1,1,1,0,1,32,0),
 (14,1,1,1,0,0,1,30,1),
 (15,1,0,0,1,0,1,31,1),
 (16,1,0,1,1,0,1,32,0),
 (17,0,0,1,0,0,1,30,1),
 (18,1,0,1,0,1,1,29,0),
 (19,0,0,1,1,0,1,27,0),
 (20,0,0,1,1,0,1,30,0),
 (21,0,0,1,1,0,1,31,0),
 (22,1,0,1,1,0,0,32,1),
 (23,0,1,1,1,0,1,31,0),
 (24,1,0,1,1,0,1,29,1),
 (25,0,1,1,1,0,1,30,0);

 
 insert into tooth (tooth_id,tooth_type,treatment_description,patient_id)
 values('UL1','Molar','filling',1),
 ('UL2','Premolar','surgery',15),
 ('UL3','Deciduous','filling',17),
 ('UL4','Permament','checking',22),
 ('UL5','Permament','filling',24),
 ('UL6','Molar','filling',12),
 ('UL7','Premolar','surgery',5),
 ('UL8','Deciduous','filling',7);

 
 insert into dentist (dentist_id,first_name,last_name,contact_number)
 values(1,'Shaunak','Deshpande',9878767874),
 (2,'Rohit','Nemade',9478765878),
 (3,'Sayali','Kulkarni',9568767889),
 (4,'Priya','Guha',8978767856),
 (5,'Swapnil','Bhale',9566767879);

 
 insert into dentist_license (license_number,authority,expiry_date,dentist_id)
 values('DL1','Municpal','2025-01-01',1),
 ('DL2','Tooth Expert','2022-01-01',2),
 ('DL3','Dental Shield','2021-01-01',3),
 ('DL4','Dental Cross','2018-01-01',4),
 ('DL5','Corporation','2015-01-01',5);

 
 insert into specialization (specialization,dentist_id)
 values('Oral Surgery',1),
 ('Oral Medicine',2),('Orthodontist',3),('Prosthodontist',4),('Oral Pathologist',5);

 
 insert into login (username,password,role,dentist_id)
 values('ShauDesh','SD1','Dentist',1),
 ('RohNem','RN2','Dentist',2),
 ('SayKul','SK3','Dentist',3),
 ('PriGu','PG4','Dentist',4),
 ('SwapBhal','SB5','Dentist',5);

 
 insert into dentist_schedule (slot1,slot2,slot3,slot4,slot5,slot6,slot7,slot8,date,dentist_id)
 values(1,0,0,1,0,1,0,1,'2020-10-10',1),
 (0,1,0,1,0,1,0,1,'2020-10-10',2),
 (1,0,0,1,0,0,1,0,'2020-10-10',3),
 (0,1,1,1,0,1,0,1,'2020-10-10',4),
 (1,0,1,0,0,1,0,1,'2020-10-11',5);

 
 insert into treatment_catalog values('Root Canal',10000),
 ('Root Surgery',15000),('Cavity Filling',4500),('Cleaning',3500);

 
 insert into location_catalouge values('60607','Chicago','Miller'),
 ('60608','Chicago','Carpenter'),('60609','Chicago','Flournoy'),
 ('60610','Chicago','Oakley');

 
 insert into location(location_id,addressline1,contact_number,zip_code) values
 ('1','Miller Street','7810087678','60607'),
 ('2','Carpenter Street','781056770','60608'),('3','Oakley Street','7810087888','60610');


insert into supplies values('Gloves',20,15,'1',1),
('Needles',10,5,'1',2),('Scissors',15,25,'1',3),('Gloves',10,12,'2',4),
('Needles',20,8,'2',5),('Napkins',50,2,'2',6),('Gloves',30,10,'3',7),
('Napkins',20,3,'3',8);


insert into room values(101,'Surgery Room','1'),
(102,'Emergency Room','1'),(103,'Clinical Room','1'),(201,'Surgery Room','2'),
(202,'Emergency Room','2'),(203,'Clinical Room','2'),(301,'Surgery Room','3'),
(302,'Emergency Room','3'),(303,'Clinical Room','3');


insert into equipment values('X-ray Machine','2020-12-01','2022-01-01','2016-01-01',1,101),
('X-ray Machine','2020-12-28','2021-01-01','2018-01-01',2,201),
('X-ray Machine','2020-11-01','2022-05-01','2017-01-01',3,301),
('Computer','2020-12-12','2025-01-01','2012-01-01',4,102),
('Computer','2021-01-01','2027-12-01','2014-01-01',5,202),
('Computer','2021-01-01','2027-12-01','2014-01-01',6,101),
('Printer','2020-12-01','2022-01-01','2016-01-01',7,102),
('Printer','2021-01-01','2027-12-01','2014-01-01',8,202),
('Printer','2020-12-01','2022-01-01','2016-01-01',9,302),
('Computer','2021-01-01','2027-12-01','2014-01-01',10,203),
('Computer','2020-12-01','2022-01-01','2016-01-01',11,103),
('Computer','2021-01-01','2027-12-01','2014-01-01',12,301),
('X-ray Machine','2020-12-01','2022-01-01','2016-01-01',13,303),
('X-ray Machine','2020-12-01','2022-01-01','2016-01-01',14,302);


insert into appointment values 
(8,4,'Booked','2020-10-18','15:00:00','16:00:00',3,301),
(9,5,'UnBooked','2020-10-19','15:00:00','16:00:00',4,301),
(1,3,'Booked','2020-10-10','13:00:00','14:00:00',1,101),
(2,9,'Booked','2020-10-10','11:00:00','13:00:00',2,201),
(3,20,'Booked','2020-10-10','9:00:00','10:00:00',3,103),
(4,14,'Unbooked','2020-10-10','9:00:00','11:00:00',4,303),
(5,13,'Unbooked','2020-10-10','10:00:00','12:00:00',5,202),
(6,21,'Booked','2020-10-10','15:00:00','16:00:00',2,301),
(7,23,'Booked','2020-10-10','14:00:00','17:00:00',1,302);


insert into prescription values('Iboprofen',1,1,1,7,'Only Liquids diet',1),
('Advil',1,0,1,5,'Rest completely',4),
('Crocin',0,0,1,4,'',7),
('Iboprofen',1,0,0,3,'',5);


insert into treatment values (4500,1,'Cavity filling'),
(3500,2,'Cleaning'),(10000,4,'Root Canal'),
(15000,5,'Root Surgery'),(4500,3,'Cavity filling'),
(15000,6,'Root Surgery');


insert into invoice values(1,'2020-10-12 12:00:00',5500,1),
(2,'2020-10-12 14:00:00',8500,3),
(3,'2020-10-12 12:00:00',7800,5),
(4,'2020-10-12 12:00:00',9000,6),
(5,'2020-10-12 12:00:00',4500,7);
 
 







