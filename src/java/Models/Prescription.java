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
public class Prescription {
    private int id;
    private Appointment appointment;
    private Timestamp createdAt;
    private String notes;

    public Prescription() {
    }

    public Prescription(int id, Appointment appointment, Timestamp createdAt, String notes) {
        this.id = id;
        this.appointment = appointment;
        this.createdAt = createdAt;
        this.notes = notes;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Appointment getAppointment() {
        return appointment;
    }

    public void setAppointment(Appointment appointment) {
        this.appointment = appointment;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return "Prescription{" + "id=" + id + ", appointment=" + appointment + ", createdAt=" + createdAt + ", notes=" + notes + '}';
    }

}
