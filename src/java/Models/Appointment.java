/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Timestamp;
import java.sql.Date;

/**
 *
 * @author admin
 */
public class Appointment {
    private int id;
    private Patient patient;
    private String fullname;
    private String phone;
    private Date dob;
    private String gender;
    private String address;
    private Doctor doctor;
    private Service service;
    private int serviceId;
    private Date appointmentDay;
    private String appointmentShift;
    private String status;
    private String description;
    private Timestamp createdAt;

    public Appointment() {
    }

    public Appointment(int id, Patient patient, String fullname, String phone, Date dob, String gender, String address, Doctor doctor, int serviceId, Date appointmentDay, String appointmentShift, String status, String description, Timestamp createdAt) {
        this.id = id;
        this.patient = patient;
        this.fullname = fullname;
        this.phone = phone;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.doctor = doctor;
        this.serviceId = serviceId;
        this.appointmentDay = appointmentDay;
        this.appointmentShift = appointmentShift;
        this.status = status;
        this.description = description;
        this.createdAt = createdAt;
    }

    public Appointment(int id, Doctor doctor, Service service, Date appointmentDay, String appointmentShift, String status, String description, Timestamp createdAt) {
        this.id = id;
        this.doctor = doctor;
        this.service = service;
        this.appointmentDay = appointmentDay;
        this.appointmentShift = appointmentShift;
        this.status = status;
        this.description = description;
        this.createdAt = createdAt;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
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

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public Date getAppointmentDay() {
        return appointmentDay;
    }

    public void setAppointmentDay(Date appointmentDay) {
        this.appointmentDay = appointmentDay;
    }

    public String getAppointmentShift() {
        return appointmentShift;
    }

    public void setAppointmentShift(String appointmentShift) {
        this.appointmentShift = appointmentShift;
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
        return "Appointment{" + "id=" + id + ", patient=" + patient + ", fullname=" + fullname + ", phone=" + phone + ", dob=" + dob + ", gender=" + gender + ", address=" + address + ", doctor=" + doctor + ", serviceId=" + serviceId + ", appointmentDay=" + appointmentDay + ", appointmentShift=" + appointmentShift + ", status=" + status + ", description=" + description + ", createdAt=" + createdAt + '}';
    }
    

}