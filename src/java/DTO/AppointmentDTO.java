package DTO;

import DAL.DoctorDAO;
import DAL.PatientDAO;
import Models.Doctor;
import Models.Patient;

public class AppointmentDTO {

    private int appointmentId;
    private Doctor doctor;    
    private Patient patient;
    private String patientName;   
    private String patientDob;    
    private String service;      
    private String date;         
    private String shift;       
    private String status;      

    public AppointmentDTO() {
    }

    public AppointmentDTO(int appointmentId,
            int doctorId,
            Integer patientId,
            String patientName,
            String patientDob,
            String service,
            String date,
            String shift,
            String status) {

        this.appointmentId = appointmentId;
        this.doctor = DoctorDAO.INSTANCE.getDoctorById(doctorId);

        if (patientId != null) {
            this.patient = PatientDAO.INSTANCE.getPatientById(patientId);
        }

        this.patientName = patientName;
        this.patientDob = patientDob;
        this.service = service;
        this.date = date;
        this.shift = shift;
        this.status = status;
    }

    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int id) {
        this.appointmentId = id;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String name) {
        this.patientName = name;
    }

    public String getPatientDob() {
        return patientDob;
    }

    public void setPatientDob(String dob) {
        this.patientDob = dob;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "AppointmentDTO{"
                + "appointmentId=" + appointmentId
                + ", doctor=" + doctor
                + ", patient=" + patient
                + ", patientName='" + patientName + '\''
                + ", patientDob='" + patientDob + '\''
                + ", service='" + service + '\''
                + ", date='" + date + '\''
                + ", shift='" + shift + '\''
                + ", status='" + status + '\''
                + '}';
    }
}
