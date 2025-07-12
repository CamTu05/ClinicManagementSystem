/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Specialty;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class SpecialtyDAO {

    private String status = "ok";
    private Connection con;
    private Vector<Specialty> spec;
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

    public Vector<Specialty> getSpecialty() {
        return spec;
    }

    public void setSpecialty(Vector<Specialty> spec) {
        this.spec = spec;
    }

    public void LoadSpecialty() {
        String sql = "select * from Specialties";
        spec = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                spec.add(new Specialty(rs.getInt(1), rs.getString(2)));

            }
        } catch (Exception e) {
            status = "Error at read Speciality " + e.getMessage();
        }

    }

    public String getSpecialtyName(int id) {
        for (Specialty s : spec) {
            if (s.getId() == id) {
                return s.getSpecialtyName();
            }
        }
        return null;
    }

    public Specialty getSpecialtyById(int id) {
        for (Specialty s : spec) {
            if (s.getId() == id) {
                return s;
            }
        }
        return null;
    }

    public String getStatus() {

        return status;
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
