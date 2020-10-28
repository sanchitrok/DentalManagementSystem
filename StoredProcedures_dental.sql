/*Stored procedure for insertion of an appointment for a patient*/
DELIMITER $$
CREATE PROCEDURE  insertAppointmentRow (   
 p_appointment_id INT,
 p_patient_id Int,
 p_status Varchar(20),
 p_room_number Varchar(20),
 p_date Date,
 p_start_time Time,
 p_end_time Time,
 p_dentist_id Int) 
BEGIN   
	IF   p_patient_id IS NULL OR p_status IS NULL OR p_room_number IS NULL 
	     OR p_date IS NULL OR p_start_time IS NULL OR p_end_time IS NULL OR p_dentist_id IS NULL THEN
		  Signal Sqlstate '22002'
          SET message_text='VALUES Cannot be null';
	  
	ELSE
			INSERT INTO appointment(appointment_id,patient_id,status,room_number,date,start_time,end_time,dentist_id) 
			VALUES ( p_appointment_id,   
		             p_patient_id,
					 p_status,
					 p_room_number,
					 p_date,
					 p_start_time,
					 p_end_time,
					 p_dentist_id 
                     );
END IF;
END;
DELIMITER;
/*Stored Procedure for inserting new Tooth details of a patient*/
DELIMITER $$
CREATE PROCEDURE insertToothRow (   
 p_appointment_id Int ,
 p_tooth_id char(20),
 p_tooth_type Varchar(20) ,
 p_treatment_description Varchar(20)) 
BEGIN   
	IF    p_appointment_id IS NULL OR p_tooth_id IS NULL OR p_tooth_type IS NULL THEN
		  SIGNAL sqlstate '22002'
		  SET message_text='VALUES Cannot be null';
	ELSE					 
		  INSERT INTO tooth(tooth_id,tooth_type,treatment_description,patient_id) VALUES
           (p_tooth_id, p_tooth_type , p_treatment_description , 
           (select patient_id from appointment where appointment_id = p_appointment_id) 
           );
	END IF; 
END;
DELIMITER;
