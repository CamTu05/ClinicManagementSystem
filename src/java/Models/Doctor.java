/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import DAL.UserDAO;

/**
 *
 * @author admin
 */
public class Doctor {
    private int id;
    private User doctor;
    private Specialty specialty;
    private int yearsExp;
    private String description;
    private String picture;
    

    public Doctor() {
    }

    public Doctor(int id, Specialty specialty, int yearsExp, String description, String picture) {
        this.id = id;
        this.specialty = specialty;
        this.yearsExp = yearsExp;
        this.description = description;
        this.picture = picture;
    }

    public Doctor(User doctor, Specialty specialty, int yearsExp, String description, String picture) {
        this.doctor = doctor;
        this.specialty = specialty;
        this.yearsExp = yearsExp;
        this.description = description;
        this.picture = picture;
    }

    public User getDoctor() {
        return doctor;
    }

    public void setDoctor(User doctor) {
        this.doctor = doctor;
    }

    public int getId() {
        return id;
    }

    public Specialty getSpecialty() {
        return specialty;
    }

    public int getYearsExp() {
        return yearsExp;
    }

    public String getDescription() {
        return description;
    }

    public String getPicture() {
        return picture;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setSpecialty(Specialty specialty) {
        this.specialty = specialty;
    }

    public void setYearsExp(int yearsExp) {
        this.yearsExp = yearsExp;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }
    

    @Override
    public String toString() {
        return "Doctor{" + "id=" + id + ", specialty=" + specialty + ", yearsExp=" + yearsExp + ", description=" + description + ", picture=" + picture + '}';
    }

    public String getShortName(){
        return getPicture().substring(0, picture.lastIndexOf("."));
    }
    
    public String getDoctorName() {
    if (this.doctor != null) {
        return this.doctor.getFullname();
    }
    return "Unknown";
}

}