/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author admin
 */
import Models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class UserDAO extends DBContext {

    private String status = "ok";
    private Connection con;
    private Vector<User> user;
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

    public Vector<User> getUser() {
        return user;
    }

    public void setUser(Vector<User> user) {
        this.user = user;
    }

    public void LoadUser() {
        String sql = "select * from Users";
        user = new Vector<>();
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

                int roleId = rs.getInt("role_id");
                u.setRole(RoleDAO.INSTANCE.getRoleById(roleId));
                u.setIsActive(rs.getBoolean("is_active"));
                u.setCreatedAt(rs.getTime("created_at"));
                user.add(u);
                System.out.println(u);
            }
        } catch (Exception e) {
            status = "Error at reading users: " + e.getMessage();
        }
    }

    public String getFullNameById(int id) {
        for (User u : user) {
            if (u.getId() == id) {
                return u.getFullname();
            }
        }
        return "Unknown";
    }

}

class Using{
    public static void main(String[] args) {
        UserDAO.INSTANCE.LoadUser();
        int n= UserDAO.INSTANCE.getUser().size();
                
        System.out.println(n);
    }
}