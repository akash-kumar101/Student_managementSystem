-- INSERT patients Data Table

INSERT INTO Patients
(first_name, last_name, gender, date_of_birth, phone, address)
VALUES
('Rahul', 'Sharma', 'Male', '2000-05-12', '9876500001', 'Delhi'),
('Priya', 'Verma', 'Female', '1998-08-20', '9876500002', 'Noida'),
('Amit', 'Kumar', 'Male', '1995-01-15', '9876500003', 'Patna'),
('Sneha', 'Singh', 'Female', '2001-11-10', '9876500004', 'Pune'),
('Vikash', 'Gupta', 'Male', '1997-03-25', '9876500005', 'Bengaluru');

-- INSERT Doctors Data Table

INSERT INTO Doctors
(doctor_name, specialization, phone, consultation_fee)
VALUES
('Dr. Anil Mehta', 'Cardiologist', '9123400001', 1000.00),
('Dr. Neha Singh', 'Dermatologist', '9123400002', 700.00),
('Dr. Rajesh Verma', 'Orthopedic', '9123400003', 800.00),
('Dr. Pooja Sharma', 'Pediatrician', '9123400004', 600.00),
('Dr. Amit Patel', 'General Physician', '9123400005', 500.00);


-- INSERT Appoitments Data Table

INSERT INTO Appointments
(patient_id, doctor_id, appointment_date,
 appointment_time, status, reason)
VALUES
(1, 1, '2026-10-15', '10:00:00', 'Completed', 'Chest pain'),
(2, 2, '2026-10-16', '11:00:00', 'Completed', 'Skin allergy'),
(3, 3, '2026-10-18', '12:00:00', 'Completed', 'Knee pain'),
(4, 1, '2026-10-20', '10:30:00', 'Scheduled', 'Heart checkup'),
(5, 5, '2026-10-21', '14:00:00', 'Scheduled', 'Fever'),
(1, 5, '2026-10-22', '15:00:00', 'Cancelled', 'General checkup'),
(2, 1, '2026-10-23', '09:30:00', 'Scheduled', 'Follow-up');


-- INSERT Bills Data Table

INSERT INTO Bills
(appointment_id, consultation_charge, medicine_charge,
 other_charge, bill_date, payment_status)
VALUES
(1, 1000.00, 500.00, 200.00, '2026-10-15', 'Paid'),
(2, 700.00, 300.00, 100.00, '2026-10-16', 'Paid'),
(3, 800.00, 450.00, 150.00, '2026-10-18', 'Pending');