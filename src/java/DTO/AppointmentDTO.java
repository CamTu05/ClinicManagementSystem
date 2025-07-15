/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import DAL.DoctorDAO;
import DAL.PatientDAO;
import Models.*;

public class AppointmentDTO {
    private int appointmentId;
    private Doctor doctor;
    private Patient patient;
    private String patientName;
    private String patientDob;
    private String service;
    private String date;     // dd/MM/yyyy
    private String time;     // HH:mm
    private String status;

    public AppointmentDTO() {
    }

    public AppointmentDTO(int appointmentId, int doctorId, int patientId, String patientName,String patientDob, String service, String date, String time, String status) {
        this.appointmentId = appointmentId;
        this.doctor = DoctorDAO.INSTANCE.getDoctorById(doctorId);
        this.patient = PatientDAO.INSTANCE.getPatientById(patientId);
        this.patientName = patientName;
        this.patientDob = patientDob;
        this.service = service;
        this.date = date;
        this.time = time;
        this.status = status;
    }

    public void setPatientDob(String patientDob) {
        this.patientDob = patientDob;
    }

    public String getPatientDob() {
        return patientDob;
    }

    public int getAppointmentId() {
        return appointmentId;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public Patient getPatient() {
        return patient;
    }

    public String getPatientName() {
        return patientName;
    }

    public String getService() {
        return service;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }

    public String getStatus() {
        return status;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public void setService(String service) {
        this.service = service;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "AppointmentDTO{" + "appointmentId=" + appointmentId + ", doctor=" + doctor + ", patient=" + patient + ", patientName=" + patientName + ", patientDob=" + patientDob + ", service=" + service + ", date=" + date + ", time=" + time + ", status=" + status + '}';
    }
    
    
}
