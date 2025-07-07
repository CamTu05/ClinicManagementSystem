/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class Specialty {
    private int id;
    private String specialtyName;

    public Specialty() {
    }

    public Specialty(int id, String specialtyName) {
        this.id = id;
        this.specialtyName = specialtyName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSpecialtyName() {
        return specialtyName;
    }

    public void setSpecialtyName(String specialtyName) {
        this.specialtyName = specialtyName;
    }

    @Override
    public String toString() {
        return "Specialty{" + "id=" + id + ", specialtyName=" + specialtyName + '}';
    }
    
}
