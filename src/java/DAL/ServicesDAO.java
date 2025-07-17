/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Service;
import Models.Specialty;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class ServicesDAO {

    private String status = "ok";
    private Connection con;
    private Vector<Service> ser;
    public static ServicesDAO INSTANCE = new ServicesDAO();

    public ServicesDAO() {
        if (INSTANCE == null) {
            INSTANCE = this;
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }

    public Vector<Service> getService() {
        return ser;
    }

    public void setService(Vector<Service> ser) {
        this.ser = ser;
    }



    

    public void LoadServices() {
        String sql = "select * from Services";
        ser = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();             // can get by fi or by oder number 
            while (rs.next()) {
                Service s = new Service();
                s.setId(rs.getInt(1));
                s.setServiceName(rs.getString(2));
                s.setPrice(rs.getDouble(3));
                s.setDescription(rs.getString(4));
                
                int specialtyId = rs.getInt("specialty_id");
                Specialty specialty = SpecialtyDAO.INSTANCE.getSpecialtyById(specialtyId);
                
                s.setSpecialty(specialty);

                ser.add(s);
            }
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }

    }

    public Service getServicesById(int id) {
        for (Service s : ser) {
            if (s.getId() == id) {
                return s;
            }
        }
        return null;
    }

    public String getStatus() {

        return status;
    }
    
    public Service getServiceById(int serviceId) {
        String sql = "select * from Services where service_id = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, serviceId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Specialty spec = SpecialtyDAO.INSTANCE.getSpecialtyById(rs.getInt("specialty_id"));
                Service s = new Service(rs.getInt("service_id"),
                rs.getString("service_name"), 
                rs.getDouble("price"),
                rs.getString("description"),
                spec);
                return s;
            }
        } catch (Exception e) {
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
