SELECT * FROM Patients;

SELECT * FROM Doctors;

SELECT
    a.appointment_id,
    p.first_name,
    p.last_name,
    d.doctor_name,
    a.appointment_date,
    a.appointment_time,
    a.status,
    a.reason
FROM Appointments a
JOIN Patients p
    ON a.patient_id = p.patient_id
JOIN Doctors d
    ON a.doctor_id = d.doctor_id
WHERE d.doctor_name = 'Dr. Anil Mehta'
ORDER BY a.appointment_date;



SELECT
    a.appointment_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    d.doctor_name,
    d.specialization,
    a.appointment_date,
    a.appointment_time,
    a.status
FROM Appointments a
JOIN Patients p
    ON a.patient_id = p.patient_id
JOIN Doctors d
    ON a.doctor_id = d.doctor_id;


SELECT *
FROM Appointments
WHERE appointment_date = '2026-10-20';


SELECT
    appointment_id,
    patient_id,
    doctor_id,
    appointment_date,
    appointment_time
FROM Appointments
WHERE appointment_date >= CURRENT_DATE()
  AND status = 'Scheduled'
ORDER BY appointment_date, appointment_time;


SELECT
    b.bill_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    d.doctor_name,
    b.consultation_charge,
    b.medicine_charge,
    b.other_charge,
    b.total_amount,
    b.payment_status
FROM Bills b
JOIN Appointments a
    ON b.appointment_id = a.appointment_id
JOIN Patients p
    ON a.patient_id = p.patient_id
JOIN Doctors d
    ON a.doctor_id = d.doctor_id;


    SELECT
    bill_id,
    appointment_id,
    total_amount,
    payment_status
FROM Bills
WHERE payment_status = 'Pending';


SELECT
    SUM(total_amount) AS total_revenue
FROM Bills
WHERE payment_status = 'Paid';



SELECT
    d.doctor_name,
    d.specialization,
    COUNT(a.appointment_id) AS total_appointments
FROM Doctors d
LEFT JOIN Appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.doctor_name, d.specialization
ORDER BY total_appointments DESC;



SELECT
    p.patient_id,
    p.first_name,
    p.last_name
FROM Patients p
LEFT JOIN Appointments a
    ON p.patient_id = a.patient_id
WHERE a.appointment_id IS NULL;