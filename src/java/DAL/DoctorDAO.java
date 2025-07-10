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

    
    public static void main(String[] args) {
        DoctorDAO dao = new DoctorDAO();
        Vector<Doctor>doctors = dao.LoadDoctorsBySpecialty(2);
        for (Doctor d : doctors){
            System.out.println("id="+d.getId());
            System.out.println("specialty="+d.getSpecialty());
            System.out.println("year exp="+d.getYearsExp());
            System.out.println("description="+d.getDescription());
            System.out.println("picture="+d.getPicture());
            System.out.println("Name=" + dao.getDoctorNameById(d.getId()));
            System.out.println();
        }
        
    }
}
