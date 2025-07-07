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
public class Payment {
    private int id;
    private Appointment appointment;
    private Timestamp paidAt;
    private String method;

    public Payment() {
    }

    public Payment(int id, Appointment appointment, Timestamp paidAt, String method) {
        this.id = id;
        this.appointment = appointment;
        this.paidAt = paidAt;
        this.method = method;
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

   
    public Timestamp getPaidAt() {
        return paidAt;
    }

    public void setPaidAt(Timestamp paidAt) {
        this.paidAt = paidAt;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    @Override
    public String toString() {
        return "Payment{" + "id=" + id + ", appointment=" + appointment + ", paidAt=" + paidAt + ", method=" + method + '}';
    }

    
}
