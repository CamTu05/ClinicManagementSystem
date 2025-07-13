/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Models.TempModels;

import java.sql.Date;

public class DoctorInformation {
    private int doctorId;
    private String fullName;
    private String gender;
    private Date dob;
    private String email;
    private String phone;
    private String address;
    private String specialtyName;
    private int yearsExperience;
    private String description;
    private String picture;
    private String schedule;  
    private double avgRating; 

    public DoctorInformation() {
    }

    public DoctorInformation(int doctorId, String fullName, String gender, Date dob, String email, String phone, String address, String specialtyName, int yearsExperience, String description, String picture, String schedule, double avgRating) {
        this.doctorId = doctorId;
        this.fullName = fullName;
        this.gender = gender;
        this.dob = dob;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.specialtyName = specialtyName;
        this.yearsExperience = yearsExperience;
        this.description = description;
        this.picture = picture;
        this.schedule = schedule;
        this.avgRating = avgRating;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public String getFullName() {
        return fullName;
    }

    public String getGender() {
        return gender;
    }

    public Date getDob() {
        return dob;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public String getSpecialtyName() {
        return specialtyName;
    }

    public int getYearsExperience() {
        return yearsExperience;
    }

    public String getDescription() {
        return description;
    }

    public String getPicture() {
        return picture;
    }

    public String getSchedule() {
        return schedule;
    }

    public double getAvgRating() {
        return avgRating;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setSpecialtyName(String specialtyName) {
        this.specialtyName = specialtyName;
    }

    public void setYearsExperience(int yearsExperience) {
        this.yearsExperience = yearsExperience;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    public void setAvgRating(double avgRating) {
        this.avgRating = avgRating;
    }

    @Override
    public String toString() {
        return "DoctorInformation{" + "doctorId=" + doctorId + ", fullName=" + fullName + ", gender=" + gender + ", dob=" + dob + ", email=" + email + ", phone=" + phone + ", address=" + address + ", specialtyName=" + specialtyName + ", yearsExperience=" + yearsExperience + ", description=" + description + ", picture=" + picture + ", schedule=" + schedule + ", avgRating=" + avgRating + '}';
    }

}
