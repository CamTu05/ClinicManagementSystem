/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Doctor;
import Models.Feedback;
import Models.Patient;
import DTO.FeedbackInfor;
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

                Doctor doctor = DoctorDAO.INSTANCE.getDoctorById(id);

                Feedback feedback = new Feedback(id, patient, doctor, rating, comment, createdAt);
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    public boolean addFeedback(Feedback feedback) {
        String sql = "INSERT INTO Feedbacks (patient_id, doctor_id, rating, comment, created_at) "
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

    public Vector<FeedbackInfor> getFeedbackInfoByDoctor(int doctorId) throws SQLException {
        String sql = """
        SELECT 
            u.fullname AS patient_name,
            UPPER(LEFT(
                RIGHT(LTRIM(RTRIM(u.fullname)), 
                      CHARINDEX(' ', REVERSE(LTRIM(RTRIM(u.fullname))) + ' ') - 1), 
                1)) AS initial,
            CONVERT(VARCHAR(10), f.created_at, 120) AS feedback_date,
            f.comment
        FROM Feedbacks f
        JOIN Users u ON f.patient_id = u.user_id
        WHERE f.doctor_id = ?
        ORDER BY f.created_at DESC
    """;

        Vector<FeedbackInfor> feedbacks = new Vector();

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, doctorId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    FeedbackInfor fb = new FeedbackInfor();
                    fb.setPatient_name(rs.getString("patient_name"));
                    fb.setInitial(rs.getString("initial"));
                    fb.setFeedback_date(rs.getDate("feedback_date"));
                    fb.setComment(rs.getString("comment"));
                    feedbacks.add(fb);
                }
            }
        }
        return feedbacks;
    }

    public Vector<Feedback> loadFeedbacks() {
        String sql = "Select * FROM Feedbacks";
        Vector<Feedback> feedbacks = new Vector<>();
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback();
                int feedbackId = rs.getInt(1);
                int patientId = rs.getInt(2);
                int doctorId = rs.getInt(3);
                int rating = rs.getInt(4);
                String comment = rs.getString(5);
                Timestamp createdAt = rs.getTimestamp(6);

                f.setId(feedbackId);
                f.setPatient(PatientDAO.INSTANCE.getPatientById(patientId));
                f.setDoctor(DoctorDAO.INSTANCE.getDoctorById(doctorId));
                f.setRating(rating);
                f.setComment(comment);
                f.setCreatedAt(createdAt);

                feedbacks.add(f);
            }
        } catch (Exception e) {
        }
        return feedbacks;
    }

    public static void main(String[] args) throws SQLException {
        Vector<Feedback> fs = FeedbackDAO.INSTANCE.loadFeedbacks();
        for (Feedback f : fs) {
            System.out.println(f.toString());
        }
        Feedback feedback = new Feedback(8, PatientDAO.INSTANCE.getPatientById(18), DoctorDAO.INSTANCE.getDoctorById(2), 3, "haha", new Timestamp(System.currentTimeMillis()));
        FeedbackDAO.INSTANCE.addFeedback(feedback);
        fs = FeedbackDAO.INSTANCE.loadFeedbacks();
        for (Feedback f : fs) {
            System.out.println(f.toString());
        }
        
    }
}
