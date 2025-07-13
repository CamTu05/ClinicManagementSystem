/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Specialty;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

/**
 *
 * @author admin
 */
public class SpecialtyDAO extends DBContext {

    private String status = "ok";
    private Connection con;
    private Vector<Specialty> specialties;

    public static SpecialtyDAO INSTANCE = new SpecialtyDAO();

    public SpecialtyDAO() {
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

        public void LoadSpecialty() {
        String sql = "select * from Specialties";
        specialties = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                specialties.add(new Specialty(rs.getInt(1), rs.getString(2)));

            }
        } catch (Exception e) {
            status = "Error at read Speciality " + e.getMessage();
        }

    }

    public String getSpecialtyName(int id) {
        for (Specialty s : specialties) {
            if (s.getId() == id) {
                return s.getSpecialtyName();
            }
        }
        return null;
    }



    
}

 

//class Using{
//    public static void main(String[] args) {
//        SpecialtyDAO.INSTANCE.LoadSpecialty();
//        int n= SpecialtyDAO.INSTANCE.getSpecialty().size();
//                
//        System.out.println(n);
//    }
//}

