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
public class ResetToken {
    private int id;
    private User user;
    private String token;
    private Timestamp createdAt;
    private Timestamp expiresAt;
    private boolean isUsed;

    public ResetToken() {
    }

    public ResetToken(int id, User user, String token, Timestamp createdAt, Timestamp expiresAt, boolean isUsed) {
        this.id = id;
        this.user = user;
        this.token = token;
        this.createdAt = createdAt;
        this.expiresAt = expiresAt;
        this.isUsed = isUsed;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getExpiresAt() {
        return expiresAt;
    }

    public void setExpiresAt(Timestamp expiresAt) {
        this.expiresAt = expiresAt;
    }

    public boolean isIsUsed() {
        return isUsed;
    }

    public void setIsUsed(boolean isUsed) {
        this.isUsed = isUsed;
    }

    @Override
    public String toString() {
        return "ResetToken{" + "id=" + id + ", user=" + user + ", token=" + token + ", createdAt=" + createdAt + ", expiresAt=" + expiresAt + ", isUsed=" + isUsed + '}';
    }

    
}
