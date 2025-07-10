/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author admin
 */
import Models.Doctor;
import Models.Specialty;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class DoctorDAO extends DBContext {

    private String status = "ok";
    private Connection con;
    private Vector<Doctor> doc;
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

    public Vector<Doctor> getDoctor() {
        return doc;
    }

    public void setDoctor(Vector<Doctor> doc) {
        this.doc = doc;
    }

    public void LoadDoctor() {
        String sql = "select * from Doctors";
        doc = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();             // can get by fi or by oder number 
            while (rs.next()) {
                Doctor d = new Doctor();
                d.setId(rs.getInt(1));
                
                int specialtyId = rs.getInt("specialty_id");
                Specialty specialty = SpecialtyDAO.INSTANCE.getSpecialtyById(specialtyId);                
                d.setSpecialty(specialty);

                d.setYearsExp(rs.getInt(3));
                d.setDescription(rs.getString(4));

                doc.add(d);
            }
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }

    }

    public Doctor getDoctorById(int id) {
        for (Doctor d : doc) {
            if (d.getId() == id) {
                return d;
            }
        }
        return null;
    }

    public String getStatus() {

        return status;
    }
}
