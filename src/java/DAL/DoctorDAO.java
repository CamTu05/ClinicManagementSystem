package DAL;

import Models.*;
import java.sql.*;
import java.util.Vector;

public class DoctorDAO extends DBContext {

    private String status = "ok";
    private Connection con;
    private Vector<Doctor> doctors = new Vector<>();
    private Vector<Doctor> doc = new Vector<>();
    private Vector<Specialty> specialties = new Vector<>();

    public static DoctorDAO INSTANCE = new DoctorDAO();

    public DoctorDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection " + e.getMessage();
        }
    }

    // Load all doctors (general)
    public void LoadDoctor() {
        String sql = "SELECT * FROM Doctors";
        doc = new Vector<>();
        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Doctor d = new Doctor();
                d.setId(rs.getInt("doctor_id"));
                int specialtyId = rs.getInt("specialty_id");
                Specialty specialty = getSpecialtyById(specialtyId);
                d.setSpecialty(specialty);
                d.setYearsExp(rs.getInt("years_experience"));
                d.setDescription(rs.getString("description"));
                d.setPicture(rs.getString("picture"));
                doc.add(d);
            }
        } catch (SQLException e) {
            status = "Error at LoadDoctor: " + e.getMessage();
        }
    }

    // Load doctors by specialty
    public Vector<Doctor> LoadDoctorsBySpecialty(int specialty_id) {
        String sql = "SELECT doctor_id, specialty_id, years_experience, description, picture FROM Doctors WHERE specialty_id=?";
        doctors = new Vector<>();
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, specialty_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Doctor d = new Doctor();
                d.setId(rs.getInt("doctor_id"));
                d.setSpecialty(getSpecialtyById(rs.getInt("specialty_id")));
                d.setYearsExp(rs.getInt("years_experience"));
                d.setDescription(rs.getString("description"));
                d.setPicture(rs.getString("picture"));
                doctors.add(d);
            }
        } catch (SQLException e) {
            status = "Error at LoadDoctorsBySpecialty: " + e.getMessage();
        }
        return doctors;
    }

    // Load all doctors
    public Vector<Doctor> LoadAllDoctors() {
        String sql = "SELECT doctor_id, specialty_id, years_experience, description, picture FROM Doctors";
        doctors = new Vector<>();
        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Doctor d = new Doctor();
                d.setId(rs.getInt("doctor_id"));
                d.setSpecialty(getSpecialtyById(rs.getInt("specialty_id")));
                d.setYearsExp(rs.getInt("years_experience"));
                d.setDescription(rs.getString("description"));
                d.setPicture(rs.getString("picture"));
                doctors.add(d);
            }
        } catch (SQLException e) {
            status = "Error at LoadAllDoctors: " + e.getMessage();
        }
        return doctors;
    }

    // Get all specialties
    public Vector<Specialty> LoadAllSpecialtys() {
        String sql = "SELECT specialty_id, specialty_name FROM Specialties";
        specialties = new Vector<>();
        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Specialty s = new Specialty(rs.getInt("specialty_id"), rs.getString("specialty_name"));
                specialties.add(s);
            }
        } catch (SQLException e) {
            status = "Error at LoadAllSpecialtys: " + e.getMessage();
        }
        return specialties;
    }

    // Get specialty by id
    public Specialty getSpecialtyById(int id) {
        String sql = "SELECT * FROM Specialties WHERE specialty_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Specialty(rs.getInt("specialty_id"), rs.getString("specialty_name"));
            }
        } catch (SQLException e) {
            System.out.println("Error at getSpecialtyById: " + e.getMessage());
        }
        return null;
    }

    // Get doctor by id
    public Doctor getDoctorById(int id) {
        for (Doctor d : doc) {
            if (d.getId() == id) return d;
        }
        return null;
    }

    public Doctor getDoctorById(int id, Vector<Doctor> doctorsList) {
        for (Doctor d : doctorsList) {
            if (d.getId() == id) return d;
        }
        return null;
    }

    // Get doctor name by user id
    public String getDoctorNameById(int id) {
        String sql = "SELECT fullname FROM Users WHERE user_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getString("fullname");
        } catch (SQLException e) {
            System.out.println("Error at getDoctorNameById: " + e.getMessage());
        }
        return null;
    }

    // Get patient by id
    public Patient getPatientById(int patientId) {
        String sql = "SELECT * FROM Patients WHERE patient_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, patientId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Patient(
                    rs.getInt("patient_id"),
                    rs.getString("blood_type"),
                    rs.getString("allergies"),
                    rs.getString("medical_history")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error at getPatientById: " + e.getMessage());
        }
        return null;
    }

    // Get feedback by doctor
    public Vector<Feedback> getFeedbackByDoctorId(int doctorId) {
        Vector<Feedback> feedbackList = new Vector<>();
        String sql = "SELECT feedback_id, patient_id, doctor_id, rating, comment, created_at FROM Feedbacks WHERE doctor_id=?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, doctorId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback(
                    rs.getInt("feedback_id"),
                    getPatientById(rs.getInt("patient_id")),
                    getDoctorById(doctorId, doctors),
                    rs.getInt("rating"),
                    rs.getString("comment"),
                    rs.getTimestamp("created_at")
                );
                feedbackList.add(f);
            }
        } catch (SQLException e) {
            System.out.println("Error at getFeedbackByDoctorId: " + e.getMessage());
        }
        return feedbackList;
    }

    // Add feedback
    public boolean addFeedback(Feedback feedback) {
        String sql = "INSERT INTO Feedback (patient_id, doctor_id, rating, comment, created_at) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, feedback.getPatient().getId());
            ps.setInt(2, feedback.getDoctor().getId());
            ps.setInt(3, feedback.getRating());
            ps.setString(4, feedback.getComment());
            ps.setTimestamp(5, feedback.getCreatedAt());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error at addFeedback: " + e.getMessage());
            return false;
        }
    }

    // Getter/Setter
    public Vector<Doctor> getDoctors() {
        return doctors;
    }

    public void setDoctors(Vector<Doctor> doctors) {
        this.doctors = doctors;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
