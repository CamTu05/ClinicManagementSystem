/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Appointment;
import Models.Doctor;
import Models.Service;
import java.sql.Connection;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author admin
 */
public class AppointmentDAO {

    private String status = "ok";
    private Connection con;

    public static AppointmentDAO INSTANCE = new AppointmentDAO();

    public AppointmentDAO() {
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

    public Vector<Appointment> getAppointmentsByPatientId(int patientId) {
        Vector<Appointment> appointments = new Vector<Appointment>();
        String sql = "  select [doctor_id]\n"
                + "      ,[service_id]\n"
                + "      ,[appointment_day]\n"
                + "      ,[appointment_shift]\n"
                + "      ,[status]\n"
                + "      ,[description]\n"
                + "      ,[created_at] from Appointments where patient_id=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, patientId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Doctor doctor = DoctorDAO.INSTANCE.getFullDoctorById(rs.getInt("doctor_id"));
                Appointment a = new Appointment(doctor, rs.getInt("service_id"), rs.getDate("appointment_day"),
                        rs.getString("appointment_shift"),
                        rs.getString("status"),
                        rs.getString("description"),
                        rs.getTimestamp("created_at"));
                appointments.add(a);
            }
        } catch (Exception e) {
        }
        return appointments;

    }

}
