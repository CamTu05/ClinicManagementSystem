/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.util.Vector;
import java.sql.Date;

/**
 *
 * @author admin
 */
public class UserDAO extends DBContext {

    private String status = "ok";
    private Connection con;
    private Vector<User> users;

    public Vector<User> getUser() {
        return users;
    }

    public void setUser(Vector<User> users) {
        this.users = users;
    }


    public static UserDAO INSTANCE = new UserDAO();

    public UserDAO() {
        if (INSTANCE == null) {
            INSTANCE = this;
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User findUser(String input, String password) {
        String sql = "select * from Users where (username = ? or email = ?) and password_hash = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, input);
            st.setString(2, input);
            st.setString(3, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password_hash"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("fullname"),
                        rs.getString("gender"),
                        rs.getDate("dob"),
                        rs.getString("address"),
                        rs.getInt("role_id"),
                        rs.getBoolean("is_active"),
                        rs.getTimestamp("created_at"));
                return u;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertUser(String fullname, String username, String email, String password) {
        String sql = "insert into Users (fullname, username, email, password_hash, role_id) values (?, ?, ?, ?, 4)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, fullname);
            st.setString(2, username);
            st.setString(3, email);
            st.setString(4, password);
            st.execute();
        } catch (Exception e) {
        }
    }

    public boolean isUsernameExists(String username) {
        String sql = "SELECT 1 FROM Users WHERE username = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean isEmailExists(String email) {
        String sql = "SELECT 1 FROM Users WHERE email = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (Exception e) {
        }
        return false;
    }

    public void updateUserInfo(User user, String fullname, String gender, String phone, Date dob, String username, String email, String address) {
        String sql = "UPDATE Users SET fullname = ?, gender = ?, phone = ?, dob = ?, username = ?, email = ?, address = ? WHERE username = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, fullname);
            st.setString(2, gender);
            st.setString(3, phone);
            st.setDate(4, dob);
            st.setString(5, username);
            st.setString(6, email);
            st.setString(7, address);
            st.setString(8, user.getUsername());
            st.execute();
        } catch (Exception e) {
        }
    }

    public User findUserById(int userId) {
        String sql = "select * from Users where user_id = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password_hash"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("fullname"),
                        rs.getString("gender"),
                        rs.getDate("dob"),
                        rs.getString("address"),
                        rs.getInt("role_id"),
                        rs.getBoolean("is_active"),
                        rs.getTimestamp("created_at"));
                return u;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public User getUserByInput(String input) {
        String sql = "select * from Users where username = ? or email = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, input);
            st.setString(2, input);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password_hash"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("fullname"),
                        rs.getString("gender"),
                        rs.getDate("dob"),
                        rs.getString("address"),
                        rs.getInt("role_id"),
                        rs.getBoolean("is_active"),
                        rs.getTimestamp("created_at"));
                return u;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updatePassword(User user, String newPassword) {
        String sql = "UPDATE Users SET password_hash = ? WHERE username = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, newPassword);
            st.setString(2, user.getUsername());
            st.execute();
        } catch (Exception e) {
        }
    }

    //For Testing
    public static void main(String[] args) {
        UserDAO d = new UserDAO();

    }
    

    public void LoadUser() {
        String sql = "select * from Users";
        users = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPasswordHash(rs.getString("password_hash"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setFullname(rs.getString("fullname"));
                u.setGender(rs.getString("gender"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));

                u.setRole(rs.getInt("role_id"));
                u.setIsActive(rs.getBoolean("is_active"));
                u.setCreatedAt(rs.getTimestamp("created_at"));
                users.add(u);
                System.out.println(u);
            }
        } catch (Exception e) {
            status = "Error at reading users: " + e.getMessage();
        }
    }

    public String getFullNameById(int id) {
        for (User u : users) {
            if (u.getId() == id) {
                return u.getFullname();
            }
        }
        return "Unknown";
    }
}