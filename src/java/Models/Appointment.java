/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.security.Timestamp;

/**
 *
 * @author admin
 */
public class Appointment {
    private int id;
    private Patient patient;
    private Doctor doctor;
    private int serviceId;
    private Timestamp appointmentTime;
    private String status;
    private String description;
    private Timestamp createdAt;

    public Appointment() {
    }

    public Appointment(int id, Patient patient, Doctor doctor, int serviceId, Timestamp appointmentTime, String status, String description, Timestamp createdAt) {
        this.id = id;
        this.patient = patient;
        this.doctor = doctor;
        this.serviceId = serviceId;
        this.appointmentTime = appointmentTime;
        this.status = status;
        this.description = description;
        this.createdAt = createdAt;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public Timestamp getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(Timestamp appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Appointment{" + "id=" + id + ", patient=" + patient + ", doctor=" + doctor + ", serviceId=" + serviceId + ", appointmentTime=" + appointmentTime + ", status=" + status + ", description=" + description + ", createdAt=" + createdAt + '}';
    }

    
}
