/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Medicine;
import Models.Prescription;
import Models.PrescriptionDetail;
import java.sql.*;

/**
 *
 * @author admin
 */
public class PrescriptionDetailDAO {
    private String status = "ok";
    private Connection con;

    public static PrescriptionDetailDAO INSTANCE = new PrescriptionDetailDAO();

    public PrescriptionDetailDAO() {
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

    public PrescriptionDetail getPDByPrescriptionId(int prescriptionId) {
        String sql = "select * from Prescription_details where prescription_id = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, prescriptionId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Prescription p = PrescriptionDAO.INSTANCE.getPresciptionById(prescriptionId);
                Medicine m = MedicineDAO.INSTANCE.getMedicineById(rs.getInt("medicine_id"));                
                PrescriptionDetail pd = new PrescriptionDetail(p, m, rs.getInt("quantity"), rs.getString("usage"));
                return pd;
            }
        } catch (Exception e) {
        }
        return null;
    }
}
