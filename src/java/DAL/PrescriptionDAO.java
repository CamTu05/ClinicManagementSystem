/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import DTO.PrescriptionDTO;
import DTO.PrescriptionDTO.MedicineItem;
import Models.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PrescriptionDAO {

    private String status = "ok";
    private Connection con;
    private Vector<Feedback> feedbacks;

    public static PrescriptionDAO INSTANCE = new PrescriptionDAO();

    public PrescriptionDAO() {
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

    public PrescriptionDTO loadLatestPrescriptionByPatientId(int patientId) {

        String sql = """
        ;WITH Latest AS (                         -- chọn đơn mới nhất
            SELECT  TOP 1  p.prescription_id, p.created_at
            FROM    Prescriptions p
            JOIN    Appointments  a ON a.appointment_id = p.appointment_id
            WHERE   a.patient_id = ?
            ORDER BY p.created_at DESC
        )
        SELECT
            l.prescription_id,
            l.created_at,
            m.name       AS medicine_name,
            pd.quantity,
            pd.usage
        FROM        Latest               l
        JOIN        Prescription_details pd ON pd.prescription_id = l.prescription_id
        JOIN        Medicines            m  ON m.medicine_id      = pd.medicine_id
        ORDER BY    m.name;
    """;

        PrescriptionDTO dto = null;

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, patientId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    if (dto == null) {                       // tạo header lần đầu
                        dto = new PrescriptionDTO();
                        dto.setId(rs.getInt("prescription_id"));
                        dto.setCreatedAt(rs.getTimestamp("created_at"));
                    }

                    PrescriptionDTO.MedicineItem med
                            = new PrescriptionDTO.MedicineItem(
                                    rs.getString("medicine_name"),
                                    rs.getInt("quantity"),
                                    rs.getString("usage"));
                    dto.getMedicines().add(med);
                }
            }

        } catch (SQLException e) {
            System.out.println("Error loading latest prescription: " + e.getMessage());
            status = "Error loading latest prescription: " + e.getMessage();
        }
        return dto;   // null nếu bệnh nhân chưa có đơn
    }

    public static void main(String[] args) {
        PrescriptionDTO presList = PrescriptionDAO.INSTANCE.loadLatestPrescriptionByPatientId(20);

//        for (PrescriptionDTO p : presList) {
//            System.out.println(p.toString());
//        }
        System.out.println(presList.toString());
    }

}
