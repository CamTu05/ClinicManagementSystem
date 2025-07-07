/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class PrescriptionDetail {
    private Prescription prescription;
    private Medicine medicine;
    private int quantity;
    private String usage;

    public PrescriptionDetail() {
    }

    public PrescriptionDetail(Prescription prescription, Medicine medicine, int quantity, String usage) {
        this.prescription = prescription;
        this.medicine = medicine;
        this.quantity = quantity;
        this.usage = usage;
    }

    public Prescription getPrescription() {
        return prescription;
    }

    public void setPrescription(Prescription prescription) {
        this.prescription = prescription;
    }

    public Medicine getMedicine() {
        return medicine;
    }

    public void setMedicine(Medicine medicine) {
        this.medicine = medicine;
    }


   
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUsage() {
        return usage;
    }

    public void setUsage(String usage) {
        this.usage = usage;
    }

    @Override
    public String toString() {
        return "PrescriptionDetail{" + "prescription=" + prescription + ", medicine=" + medicine + ", quantity=" + quantity + ", usage=" + usage + '}';
    }

    
}
