/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Patient;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class PatientDAO extends DBContext{
    
    private String status = "ok";
    private Connection con;

    public static PatientDAO INSTANCE = new PatientDAO();

    public PatientDAO() {
        if (INSTANCE == null) {
            INSTANCE = this;
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }
    
    public Patient getPatientById(int patientId) {
        Patient patient = null;
        String sql = "SELECT * FROM Patients WHERE patient_id = ?";

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, patientId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Lấy dữ liệu từ ResultSet và tạo đối tượng Patient
                int id = rs.getInt("id");
                String bloodType = rs.getString("blood_type");
                String allergies = rs.getString("allergies");
                String medicalHistory = rs.getString("medical_history");

                patient = new Patient(id, bloodType, allergies, medicalHistory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return patient;
    }
}
