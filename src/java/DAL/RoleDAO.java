package DAL;

import Models.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class RoleDAO extends DBContext {
    private String status = "OK";
    private Connection con;
    private Vector<Role> roles;
    public static RoleDAO INSTANCE = new RoleDAO();

    public RoleDAO() {
        if (INSTANCE == null) {
            INSTANCE = this;
        }
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection: " + e.getMessage();
        }
    }

    public Vector<Role> getRoles() {
        return roles;
    }

    public void setRoles(Vector<Role> roles) {
        this.roles = roles;
    }
    
    public void loadRoles() {
        roles = new Vector<>();
        String sql = "SELECT * FROM Roles"; 
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                roles.add(r);
            }
        } catch (Exception e) {
            status = "Error at loadRoles: " + e.getMessage();
        }
    }

    public Role getRoleById(int id) {
        if (roles == null) loadRoles();
        for (Role r : roles) {
            if (r.getId() == id) return r;
        }
        return null;
    }

    public String getStatus() {
        return status;
    }
}
