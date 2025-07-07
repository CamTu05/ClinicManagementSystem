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
public class Feedback {
    private int id;
    private Patient patient;
    private Doctor doctor;
    private int rating;
    private String comment;
    private Timestamp createdAt;

    public Feedback() {
    }

    public Feedback(int id, Patient patient, Doctor doctor, int rating, String comment, Timestamp createdAt) {
        this.id = id;
        this.patient = patient;
        this.doctor = doctor;
        this.rating = rating;
        this.comment = comment;
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

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", patient=" + patient + ", doctor=" + doctor + ", rating=" + rating + ", comment=" + comment + ", createdAt=" + createdAt + '}';
    }
    
}
