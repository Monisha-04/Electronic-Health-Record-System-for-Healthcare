CREATE OR REPLACE PROCEDURE ManageHealthRecord (
    p_record_id IN NUMBER,
    p_patient_id IN NUMBER,
    p_visit_date IN DATE,
    p_diagnosis IN CLOB,
    p_treatment IN CLOB,
    p_medication IN CLOB,
    p_action IN VARCHAR2
) AS
BEGIN
    IF p_action = 'INSERT' THEN
        INSERT INTO HealthRecords (RECORD_ID, PATIENT_ID, VISIT_DATE, DIAGNOSIS, TREATMENT, MEDICATION)
        VALUES (p_record_id, p_patient_id, p_visit_date, p_diagnosis, p_treatment, p_medication);
    ELSIF p_action = 'UPDATE' THEN
        UPDATE HealthRecords
        SET PATIENT_ID = p_patient_id,
            VISIT_DATE = p_visit_date,
            DIAGNOSIS = p_diagnosis,
            TREATMENT = p_treatment,
            MEDICATION = p_medication
        WHERE RECORD_ID = p_record_id;
    ELSIF p_action = 'DELETE' THEN
        DELETE FROM HealthRecords
        WHERE RECORD_ID = p_record_id;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Invalid action specified.');
    END IF;
END;
/



CREATE OR REPLACE PROCEDURE ManageDiagnosis (
    p_diagnosis_id IN NUMBER,
    p_patient_id IN NUMBER,
    p_diagnosis_date IN DATE,
    p_diagnosis_description IN CLOB,
    p_diagnosis_status IN VARCHAR2,
    p_action IN VARCHAR2
) AS
BEGIN
    IF p_action = 'INSERT' THEN
        INSERT INTO Diagnoses (DIAGNOSIS_ID, PATIENT_ID, DIAGNOSIS_DATE, DIAGNOSIS_DESCRIPTION, DIAGNOSIS_STATUS)
        VALUES (p_diagnosis_id, p_patient_id, p_diagnosis_date, p_diagnosis_description, p_diagnosis_status);
    ELSIF p_action = 'UPDATE' THEN
        UPDATE Diagnoses
        SET PATIENT_ID = p_patient_id,
            DIAGNOSIS_DATE = p_diagnosis_date,
            DIAGNOSIS_DESCRIPTION = p_diagnosis_description,
            DIAGNOSIS_STATUS = p_diagnosis_status
        WHERE DIAGNOSIS_ID = p_diagnosis_id;
    ELSE
        RAISE_APPLICATION_ERROR(-20002, 'Invalid action specified.');
    END IF;
END;
/



CREATE OR REPLACE PROCEDURE ManageMedication (
    p_medication_id IN NUMBER,
    p_patient_id IN NUMBER,
    p_medication_name IN VARCHAR2,
    p_dosage IN VARCHAR2,
    p_frequency IN VARCHAR2,
    p_start_date IN DATE,
    p_action IN VARCHAR2
) AS
BEGIN
    IF p_action = 'INSERT' THEN
        INSERT INTO Medications (MEDICATION_ID, PATIENT_ID, MEDICATION_NAME, DOSAGE, FREQUENCY, START_DATE)
        VALUES (p_medication_id, p_patient_id, p_medication_name, p_dosage, p_frequency, p_start_date);
    ELSIF p_action = 'UPDATE' THEN
        UPDATE Medications
        SET PATIENT_ID = p_patient_id,
            MEDICATION_NAME = p_medication_name,
            DOSAGE = p_dosage,
            FREQUENCY = p_frequency,
            START_DATE = p_start_date
        WHERE MEDICATION_ID = p_medication_id;
    ELSIF p_action = 'DELETE' THEN
        DELETE FROM Medications
        WHERE MEDICATION_ID = p_medication_id;
    ELSE
        RAISE_APPLICATION_ERROR(-20003, 'Invalid action specified.');
    END IF;
END;
/

