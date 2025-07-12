package DAL;

import Models.*;
import java.sql.*;
import java.util.Vector;

public class DoctorDAO extends DBContext {

    private Vector<Doctor> doctors;
    private String status = "ok";
    private Connection con;

    public static DoctorDAO INSTANCE = new DoctorDAO();

    public DoctorDAO() {
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

    public Vector<Doctor> getDoctors() {
        return doctors;
    }

    public void setDoctors(Vector<Doctor> doctors) {
        this.doctors = doctors;
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
                doc.setSpecialty(SpecialtyDAO.INSTANCE.getSpecialtyById(specialty_id));
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
                doc.setSpecialty(SpecialtyDAO.INSTANCE.getSpecialtyById(rs.getInt("specialty_id")));
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

    public Doctor getDoctorById(int id, Vector<Doctor> doctors) {
        for (Doctor d : doctors) {
            if (d.getId() == id) {
                return d;
            }
        }
        return null;
    }

    public static void main(String[] args) {

    }
}
