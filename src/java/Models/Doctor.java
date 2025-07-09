/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class Doctor {
    private int id;
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

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getPicture() {
        return picture;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Specialty getSpecialty() {
        return specialty;
    }

    public void setSpecialty(Specialty specialty) {
        this.specialty = specialty;
    }

    public int getYearsExp() {
        return yearsExp;
    }

    public void setYearsExp(int yearsExp) {
        this.yearsExp = yearsExp;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Doctor{" + "id=" + id + ", specialty=" + specialty + ", yearsExp=" + yearsExp + ", description=" + description + '}';
    }


    
}
