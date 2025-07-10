/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import java.sql.*;
import java.util.Vector;

/**
 *
 * @author admin
 */
public class DoctorDAO extends DBContext {

    private Vector<Doctor> doctors;
    private Vector<Specialty> specialties;
    private String status = "ok";
    private Connection con;

    public DoctorDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection " + e.getMessage();
        }
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Vector<Doctor> getDoctors() {
        return doctors;
    }

    public void setDoctors(Vector<Doctor> doctors) {
        this.doctors = doctors;
    }

    public Vector<Specialty> getSpecialty() {
        specialties = new Vector<>();
        String sql = "select * from Specialties";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Specialty thisSpecialty = new Specialty(rs.getInt(1), rs.getString(2));
                specialties.add(thisSpecialty);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return specialties;
    }

    public Specialty getSpecialtyById(int id) {
        String sql = "Select * From Specialties where specialty_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Specialty s = new Specialty(rs.getInt("specialty_id"), rs.getString("specialty_name"));
                return s;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public String getDoctorNameById(int id) {
        String sql = "Select [fullname] From [dbo].[Users] where [user_id] = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("fullname");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Vector<Doctor> LoadDoctorsBySpecialty(int specialty_id) {
        String sql = "SELECT [doctor_id]\n"
                + "      ,[specialty_id]\n"
                + "      ,[years_experience]\n"
                + "      ,[description]\n"
                + "      ,[picture]\n"
                + "  FROM [dbo].[Doctors]\n"
                + "  WHERE specialty_id=?";
        doctors = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, specialty_id); 
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("");
                Doctor doc = new Doctor();
                doc.setId(rs.getInt("doctor_id"));
                doc.setSpecialty(getSpecialtyById(specialty_id));
                doc.setYearsExp(rs.getInt("years_experience"));
                doc.setDescription(rs.getString("description"));
                doc.setPicture(rs.getString("picture"));
                doctors.add(doc);
            }
            return doctors;
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }
        return null;
    }

    public Vector<Doctor> LoadAllDoctors() {
        String sql = "SELECT [doctor_id], [specialty_id], [years_experience], [description], [picture] FROM [dbo].[Doctors]";
        doctors = new Vector<>();
        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Doctor doc = new Doctor();
                doc.setId(rs.getInt("doctor_id"));
                doc.setSpecialty(getSpecialtyById(rs.getInt("specialty_id")));
                doc.setYearsExp(rs.getInt("years_experience"));
                doc.setDescription(rs.getString("description"));
                doc.setPicture(rs.getString("picture"));
                doctors.add(doc);
            }
            return doctors;
        } catch (SQLException e) {
            System.out.println("Error at reading Doctors: " + e.getMessage());
            status = "Error at reading Doctors: " + e.getMessage();
        }
        return new Vector<>();
    }
    
    public Doctor getDoctorById(int id, Vector<Doctor> doctors){
        for (Doctor d : doctors){
            if (d.getId()==id){
                return d;
            }
        }
        return null;
    }
    
    public Vector<Specialty> LoadAllSpecialtys() {
        String sql = "Select specialty_id, specialty_name from Specialties";
        specialties = new Vector<Specialty>();
        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Specialty sp = new Specialty();
                sp.setId(rs.getInt("specialty_id"));
                sp.setSpecialtyName(rs.getString("specialty_name"));
                specialties.add(sp);
            }
            return specialties;
        } catch (SQLException e) {
            System.out.println("Error at reading Specialty: " + e.getMessage());
            status = "Error at reading Specialty: " + e.getMessage();
        }
        return new Vector<>();
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
    
    // Phương thức lấy danh sách Feedback cho bác sĩ
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
            stmt.setInt(1, doctorId);  // Set doctorId vào câu truy vấn
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("feedback_id");
                int rating = rs.getInt("rating");
                String comment = rs.getString("comment");
                Timestamp createdAt = rs.getTimestamp("created_at");

                // Lấy thông tin patient (có thể thêm đối tượng Patient và Doctor nếu cần)
                Patient patient = getPatientById(rs.getInt("patient_id"));

                // Lấy thông tin bác sĩ từ Doctor object, giả sử bác sĩ được khởi tạo với doctorId
                Doctor doctor = getDoctorById(id, doctors);

                // Tạo đối tượng Feedback và thêm vào danh sách
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
            // Set các tham số cho PreparedStatement từ đối tượng feedback
            ps.setInt(1, feedback.getPatient().getId());  // Gán ID bệnh nhân
            ps.setInt(2, feedback.getDoctor().getId());    // Gán ID bác sĩ
            ps.setInt(3, feedback.getRating());            // Gán rating
            ps.setString(4, feedback.getComment());        // Gán comment
            ps.setTimestamp(5, feedback.getCreatedAt());   // Gán thời gian tạo feedback

            // Thực thi câu lệnh INSERT
            int rowsAffected = ps.executeUpdate();

            // Kiểm tra nếu ít nhất một dòng đã được thêm vào cơ sở dữ liệu
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Error while inserting feedback: " + e.getMessage());
            status = "Error while inserting feedback: " + e.getMessage();  // Lưu thông báo lỗi
            return false;
        }
    }
    
    public static void main(String[] args) {
        DoctorDAO dao = new DoctorDAO();
        Vector<Doctor>doctors = dao.LoadDoctorsBySpecialty(2);
//        for (Doctor d : doctors){
//            System.out.println("id="+d.getId());
//            System.out.println("specialty="+d.getSpecialty());
//            System.out.println("year exp="+d.getYearsExp());
//            System.out.println("description="+d.getDescription());
//            System.out.println("picture="+d.getPicture());
//            System.out.println("Name=" + dao.getDoctorNameById(d.getId()));
//            System.out.println();
//        }
        Vector<Feedback> fb = dao.getFeedbackByDoctorId(3);
        for (Feedback f : fb){
            System.out.println(f.getComment());
        }
        System.out.println(dao.getDoctorNameById(3));
    }
    
    
}
