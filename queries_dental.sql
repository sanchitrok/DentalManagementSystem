/*All Patient's appointment*/ 
Select appointment_id as Appointment_Id, concat(patient.first_name,' ',patient.last_name) 
as Patient_Name,room.room_number as Room_Number,location.
addressline1 as Address, location.zip_code as Zip_Code,appointment.date as Date from appointment 
join patient using (patient_id) join room using (room_number) join location using (location_id);


/*How many teeth does patients have*/
Select patient.patient_id as Patient_Id, concat(patient.first_name,' ',patient.last_name) 
as Patient_Name,total_teeth as Total_Teeth from patient join medical_history using(patient_id);


/*Show treatment associated with an appointment where ststus of the appointment are booked*/
select treatment.treatment_name as Treatment_Name,treatment.treatment_cost as Treatment_Cost,
appointment.appointment_id as Appointment_ID from treatment join appointment using(appointment_id) 
Where appointment.status='Booked';


/*Show invoice*/
select appointment.appointment_id as Appointment_ID,concat(patient.first_name,' ',patient.last_name) 
as Patient_Name,invoice.amount as Total_Amount,invoice.invoice_id as Invoice_ID from invoice
join appointment using(appointment_id) join patient using (patient_id); 


/*Show treatments that make up an invoice*/
select invoice.invoice_id as Invoice_ID, invoice.date as Invoice_Date,
treatment.treatment_name as Treatment_Name,treatment.treatment_cost,
concat(patient.first_name,' ',patient.last_name) as Patient_Name from invoice join treatment using (appointment_id)
join appointment using (appointment_id) join patient using (patient_id);


/*Appointment of a doctor for tomorrow*/
select a.appointment_id as 'Appointment Id',
concat(b.first_name,',',' ',b.last_name) as 'Patient Name',
c.room_number as 'Room Number',
d.addressline1 as 'Address',
d.zip_code as 'Zip Code',
a.date as 'Date',
e.dentist_id as 'Dentist Id',
concat(e.first_name,',',' ',e.last_name) as 'Dentist Name'
from appointment as a
join patient as b on a.patient_id = b.patient_id
join dentist as e on a.dentist_id = e.dentist_id
join room as c on a.room_number = c.room_number
join location as d on c.location_id = d.location_id
where date = CAST((NOW(3)+1) AS date);
