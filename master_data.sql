CREATE SCHEMA hospital;
CREATE TABLE hospital.appointments(
	appointment_id TEXT PRIMARY KEY,
	patient_id TEXT,
	doctor_id TEXT,
	appointment_date TEXT,
	appointment_time TEXT,
	reason_for_visit TEXT,
	status TEXT
);
CREATE TABLE hospital.billings(
	bill_id TEXT,
	patient_id TEXT,
	treatment_id TEXT,
	bill_date TEXT,
	amount TEXT,
	payment_method TEXT,
	payment_status TEXT
);
CREATE TABLE hospital.doctors(
	doctor_id TEXT,
	first_name TEXT,
	last_name TEXT,
	specialization TEXT,
	phone_number TEXT,
	years_experience TEXT,
	hospital_branch TEXT,
	email TEXT
);
CREATE TABLE hospital.patients (
    patient_id TEXT,
    first_name TEXT,
    last_name TEXT,
    gender TEXT,
    date_of_birth TEXT,
    contact_number TEXT,
    address TEXT,
    registration_date TEXT,
    insurance_provider TEXT,
    insurance_number TEXT,
    email TEXT
);
CREATE TABLE hospital.treatments(
    treatment_id TEXT,
    appointment_id TEXT,
    treatment_type TEXT,
    description TEXT,
    money_spent TEXT,
    treatment_date TEXT
);


-- Basic data check
SELECT * FROM hospital.patients LIMIT 10;
DELETE FROM hospital.patients                        
WHERE patient_id = 'patient_id';

SELECT * FROM hospital.treatments LIMIT 10;
DELETE FROM hospital.treatments                        
WHERE treatment_id = 'treatment_id';

SELECT * FROM hospital.billings LIMIT 10;
DELETE FROM hospital.billings                        
WHERE bill_id = 'bill_id';

SELECT * FROM hospital.doctors LIMIT 10;
DELETE FROM hospital.doctors                        
WHERE doctor_id = 'doctor_id';

SELECT * FROM hospital.appointments LIMIT 10;
DELETE FROM hospital.appointments                        
WHERE appointment_id = 'appointment_id';

-- Checking null rows
SELECT * FROM hospital.patients
WHERE patient_id IS NULL OR patient_id = '' OR
first_name IS NULL OR first_name = '' OR
last_name IS NULL OR last_name = '' OR
gender IS NULL OR gender = '' OR
date_of_birth IS NULL OR date_of_birth = '' OR
contact_number IS NULL OR contact_number = '' OR
address IS NULL OR address = '' OR
registration_date IS NULL OR registration_date = '' OR
insurance_provider IS NULL OR insurance_provider = '' OR
insurance_number IS NULL OR insurance_number = '' OR
email IS NULL OR email = ''; -- No null values

SELECT * FROM hospital.treatments
WHERE treatment_id IS NULL OR treatment_id = '' OR
appointment_id IS NULL OR appointment_id = '' OR
treatment_type IS NULL OR treatment_type = '' OR
description IS NULL OR description = '' OR
money_spent IS NULL OR money_spent = '' OR
treatment_date IS NULL OR treatment_date = '';  -- No null values

SELECT * FROM hospital.billings
WHERE bill_id IS NULL OR bill_id = '' OR
patient_id IS NULL OR patient_id = '' OR
treatment_id IS NULL OR treatment_id = '' OR
bill_date IS NULL OR bill_date = '' OR
amount IS NULL OR amount = '' OR
payment_method IS NULL OR payment_method = '' OR
payment_status IS NULL OR payment_status = '';     -- No null values

SELECT * FROM hospital.doctors
WHERE doctor_id IS NULL OR doctor_id = '' OR
first_name IS NULL OR first_name = '' OR
last_name IS NULL OR last_name = '' OR
specialization IS NULL OR specialization = '' OR
phone_number IS NULL OR phone_number = '' OR
years_experience IS NULL OR years_experience = '' OR
hospital_branch IS NULL OR hospital_branch = '' OR
email IS NULL OR email = '';      -- No null values

SELECT * FROM hospital.appointments
WHERE appointment_id IS NULL OR appointment_id = '' OR
patient_id IS NULL OR patient_id = '' OR
doctor_id IS NULL OR doctor_id = '' OR
appointment_date IS NULL OR appointment_date = '' OR
appointment_time IS NULL OR appointment_time = '' OR
reason_for_visit IS NULL OR reason_for_visit = '' OR
status IS NULL OR status = '';     -- No null values

-- Remove spaces
UPDATE hospital.patients
SET
patient_id = TRIM(patient_id),
first_name = TRIM(first_name),
last_name = TRIM(last_name),
gender = TRIM(gender),
date_of_birth = TRIM(date_of_birth),
contact_number = TRIM(contact_number),
address = TRIM(address),
registration_date = TRIM(registration_date),
insurance_provider = TRIM(insurance_provider),
insurance_number = TRIM(insurance_number),
email = TRIM(email);         -- Cleaned 50 white spaces values

UPDATE hospital.treatments
SET
treatment_id = TRIM(treatment_id),
appointment_id = TRIM(appointment_id),
treatment_type = TRIM(treatment_type),
description = TRIM(description),
money_spent = TRIM(money_spent),
treatment_date = TRIM(treatment_date);   -- Cleaned 200 white spaces values

UPDATE hospital.billings
SET
bill_id = TRIM(bill_id),
patient_id = TRIM(patient_id),
treatment_id = TRIM(treatment_id),
bill_date = TRIM(bill_date),
amount = TRIM(amount),
payment_method = TRIM(payment_method),
payment_status = TRIM(payment_status);     -- Cleaned 200 white spaces values

UPDATE hospital.doctors
SET
doctor_id = TRIM(doctor_id),
first_name = TRIM(first_name),
last_name = TRIM(last_name),
specialization = TRIM(specialization),
phone_number = TRIM(phone_number),
years_experience = TRIM(years_experience),
hospital_branch = TRIM(hospital_branch),
email = TRIM(email);         -- Cleaned 10 white spaces values

UPDATE hospital.appointments
SET
appointment_id = TRIM(appointment_id),
patient_id = TRIM(patient_id),
doctor_id = TRIM(doctor_id),
appointment_date = TRIM(appointment_date),
appointment_time = TRIM(appointment_time),
reason_for_visit = TRIM(reason_for_visit),
status = TRIM(status);  -- Cleaned 200 white spaces values

-- Type conversion
ALTER TABLE hospital.patients
ALTER COLUMN patient_id TYPE VARCHAR USING patient_id::VARCHAR,
ALTER COLUMN date_of_birth TYPE DATE USING TO_DATE(date_of_birth, 'YYYY-MM-DD'),
ALTER COLUMN contact_number TYPE NUMERIC USING contact_number::NUMERIC,
ALTER COLUMN address TYPE VARCHAR USING address::VARCHAR,
ALTER COLUMN registration_date TYPE DATE USING TO_DATE(registration_date, 'YYYY-MM--DD'),
ALTER COLUMN insurance_number TYPE VARCHAR USING insurance_number::VARCHAR,
ALTER COLUMN email TYPE VARCHAR USING email::VARCHAR;

ALTER TABLE hospital.treatments
ALTER COLUMN treatment_id TYPE VARCHAR USING treatment_id::VARCHAR,
ALTER COLUMN appointment_id TYPE VARCHAR USING appointment_id::VARCHAR,
ALTER COLUMN money_spent TYPE NUMERIC USING money_spent::NUMERIC,
ALTER COLUMN treatment_date TYPE DATE USING TO_DATE(treatment_date, 'DD--MM-YYYY');

ALTER TABLE hospital.billings
ALTER COLUMN bill_id TYPE VARCHAR USING bill_id::VARCHAR,
ALTER COLUMN patient_id TYPE VARCHAR USING patient_id::VARCHAR,
ALTER COLUMN treatment_id TYPE VARCHAR USING treatment_id::VARCHAR,
ALTER COLUMN bill_date TYPE DATE USING TO_DATE(bill_date, 'YYYY-MM-DD'),
ALTER COLUMN amount TYPE NUMERIC USING amount::NUMERIC;

ALTER TABLE hospital.doctors
ALTER COLUMN doctor_id TYPE VARCHAR USING doctor_id::VARCHAR,
ALTER COLUMN phone_number TYPE NUMERIC USING phone_number::NUMERIC,
ALTER COLUMN years_experience TYPE NUMERIC USING years_experience::NUMERIC,
ALTER COLUMN email TYPE VARCHAR USING email::VARCHAR;

ALTER TABLE hospital.appointments
ALTER COLUMN patient_id TYPE VARCHAR USING patient_id::VARCHAR,
ALTER COLUMN appointment_id TYPE VARCHAR USING appointment_id::VARCHAR,
ALTER COLUMN doctor_id TYPE VARCHAR USING doctor_id::VARCHAR,
ALTER COLUMN appointment_date TYPE DATE USING TO_DATE(appointment_date, 'YYYY-MM-DD'),
ALTER COLUMN appointment_time TYPE TIME USING appointment_time::TIME;

-- Master data
CREATE VIEW hospital.master_data AS
SELECT 
    p.patient_id,
    p.gender,
    p.date_of_birth,
    d.doctor_id,
    d.specialization,
    d.years_experience,
    a.appointment_id,
    a.appointment_date,
    a.status,
    t.treatment_id,
    t.treatment_type,
    t.money_spent,
    t.treatment_date,
    b.bill_id,
    b.amount,
    b.payment_method,
    b.payment_status
FROM hospital.patients p
LEFT JOIN hospital.appointments a 
    ON p.patient_id = a.patient_id
LEFT JOIN hospital.doctors d 
    ON a.doctor_id = d.doctor_id
LEFT JOIN hospital.treatments t 
    ON a.appointment_id = t.appointment_id
LEFT JOIN hospital.billings b 
    ON t.treatment_id = b.treatment_id;

SELECT * FROM hospital.master_data;

-- Total Revenue
SELECT SUM(amount)
FROM hospital.master_data;

-- Top treatments
SELECT treatment_type, SUM(amount) as Total_revenue
FROM hospital.master_data
GROUP BY treatment_type
ORDER BY Total_revenue DESC;

-- Appointment status
SELECT status, count(*) * 100.0 / SUM(COUNT(*)) OVER() AS percentage
FROM hospital.master_data
GROUP BY status;

-- Save the data
COPY (SELECT * FROM hospital.master_data) 
TO 'D:\Shubham\Healthcare\hospital_final.csv'
WITH CSV HEADER;