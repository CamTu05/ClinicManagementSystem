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
public class User {
    private int id;
    private String username;
    private String passwordHash;
    private String email;
    private String phone;
    private String fullname;
    private String gender;
    private Date dob;
    private String address;
    private int role;
    private boolean isActive;
    private Timestamp createdAt;

    public User() {
    }

    public User(int id, String username, String passwordHash, String email, String phone, String fullname, String gender, Date dob, String address, int role, boolean isActive, Timestamp createdAt) {
        this.id = id;
        this.username = username;
        this.passwordHash = passwordHash;
        this.email = email;
        this.phone = phone;
        this.fullname = fullname;
        this.gender = gender;
        this.dob = dob;
        this.address = address;
        this.role = role;
        this.isActive = isActive;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", username=" + username + ", passwordHash=" + passwordHash + ", email=" + email + ", phone=" + phone + ", fullname=" + fullname + ", gender=" + gender + ", dob=" + dob + ", address=" + address + ", role=" + role + ", isActive=" + isActive + ", createdAt=" + createdAt + '}';
    }

}
