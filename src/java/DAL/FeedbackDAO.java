/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Doctor;
import Models.Feedback;
import Models.Patient;
import Models.Specialty;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Vector;

/**
 *
 * @author admin
 */
public class FeedbackDAO extends DBContext {

    private String status = "ok";
    private Connection con;
    private Vector<Feedback> feedbacks;

    public static FeedbackDAO INSTANCE = new FeedbackDAO();

    public FeedbackDAO() {
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

    public Vector<Feedback> getFeedbackByDoctorId(int doctorId) {
        Vector<Feedback> feedbackList = new Vector<>();
        String sql = "SELECT [feedback_id]\n"
                + "      ,[patient_id]\n"
                + "      ,[doctor_id]\n"
                + "      ,[rating]\n"
                + "      ,[comment]\n"
                + "      ,[created_at]\n"
                + "  FROM [dbo].[Feedbacks]"
                + "Where [doctor_id]=?";

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, doctorId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("feedback_id");
                int rating = rs.getInt("rating");
                String comment = rs.getString("comment");
                Timestamp createdAt = rs.getTimestamp("created_at");

                Patient patient = PatientDAO.INSTANCE.getPatientById(rs.getInt("patient_id"));

                Doctor doctor = DoctorDAO.INSTANCE.getDoctorById(id, DoctorDAO.INSTANCE.LoadAllDoctors());

                Feedback feedback = new Feedback(id, patient, doctor, rating, comment, createdAt);
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return feedbackList;
    }
    
    public boolean addFeedback(Feedback feedback) {
        String sql = "INSERT INTO feedback (patient_id, doctor_id, rating, comment, created_at) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, feedback.getPatient().getId());
            ps.setInt(2, feedback.getDoctor().getId());
            ps.setInt(3, feedback.getRating());
            ps.setString(4, feedback.getComment());
            ps.setTimestamp(5, feedback.getCreatedAt());

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }
    
}
