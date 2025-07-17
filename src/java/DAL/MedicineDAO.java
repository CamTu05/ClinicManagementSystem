/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Medicine;
import java.sql.*;
/**
 *
 * @author admin
 */
public class MedicineDAO {
     private String status = "ok";
    private Connection con;

    public static MedicineDAO INSTANCE = new MedicineDAO();

    public MedicineDAO() {
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
    
    public Medicine getMedicineById(int medicineId) {
        String sql = "select * from Medicines where medicine_id = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, medicineId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Medicine m = new Medicine(rs.getInt("medicine_id"),
                        rs.getString("name"),
                        rs.getString("unit"),
                        rs.getDouble("price"),
                        rs.getString("description"));
                return m;
            }
        } catch (Exception e) {
        }
        return null;
    }
}
