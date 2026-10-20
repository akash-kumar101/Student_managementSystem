-- CREATE patient table

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    phone VARCHAR(15) UNIQUE,
    address VARCHAR(200)
);

-- CREATE Doctor Table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    consultation_fee DECIMAL(10,2) NOT NULL
);

-- Create Appointments Table
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status VARCHAR(20) DEFAULT 'Scheduled',
    reason VARCHAR(200),

    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(doctor_id),

    CHECK (status IN (
        'Scheduled', 'Completed', 'Cancelled'
    ))
);

-- Create Bills Table
CREATE TABLE Bills (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT NOT NULL UNIQUE,
    consultation_charge DECIMAL(10,2) NOT NULL,
    medicine_charge DECIMAL(10,2) DEFAULT 0,
    other_charge DECIMAL(10,2) DEFAULT 0,
    bill_date DATE NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'Pending',

    total_amount DECIMAL(10,2)
        GENERATED ALWAYS AS (
            consultation_charge
            + medicine_charge
            + other_charge
        ) STORED,

    FOREIGN KEY (appointment_id)
        REFERENCES Appointments(appointment_id),

    CHECK (consultation_charge >= 0),
    CHECK (medicine_charge >= 0),
    CHECK (other_charge >= 0),
    CHECK (payment_status IN (
        'Pending', 'Paid', 'Partial'
    ))
);

