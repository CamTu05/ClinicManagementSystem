/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class Service {
    private int id;
    private String serviceName;
    private double price;
    private String description;
    private Specialty specialty;

    public Service() {
    }

    public Service(int id, String serviceName, double price, String description, Specialty specialty) {
        this.id = id;
        this.serviceName = serviceName;
        this.price = price;
        this.description = description;
        this.specialty = specialty;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Specialty getSpecialty() {
        return specialty;
    }

    public void setSpecialty(Specialty specialty) {
        this.specialty = specialty;
    }

    @Override
    public String toString() {
        return "Service{" + "id=" + id + ", serviceName=" + serviceName + ", price=" + price + ", description=" + description + ", specialty=" + specialty + '}';
    }

}
