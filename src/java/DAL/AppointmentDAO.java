/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import DTO.AppointmentDTO;
import DTO.DoctorInformation;
import Models.*;
import java.sql.*;
import java.util.Vector;

public class AppointmentDAO {

    private Vector<Appointment> appointments;
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

    public Vector<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(Vector<Appointment> appointments) {
        this.appointments = appointments;
    }

    public Vector<AppointmentDTO> loadAppointmentDTOs() {

        String sql = """
        SELECT
            a.appointment_id                       AS appointment_id,
            a.doctor_id                            AS doctor_id,
            a.patient_id                           AS patient_id,
            pu.fullname                            AS patient_name,
            srv.service_name                       AS service,
            FORMAT(a.appointment_time,'dd/MM/yyyy') AS date,
            FORMAT(a.appointment_time,'HH:mm')      AS time,
            a.status                               AS status
        FROM   Appointments a
        JOIN   Users    pu  ON pu.user_id   = a.patient_id
        JOIN   Services srv ON srv.service_id = a.service_id
        ORDER  BY a.appointment_time;
        """;

        Vector<AppointmentDTO> appointments = new Vector<>();

        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                AppointmentDTO dto = new AppointmentDTO();

                dto.setAppointmentId(rs.getInt("appointment_id"));
                int doctorId = rs.getInt("doctor_id");
                dto.setDoctor(DoctorDAO.INSTANCE.getDoctorById(doctorId));
                int patientId = rs.getInt("patient_id");
                dto.setPatient(PatientDAO.INSTANCE.getPatientById(patientId));
                dto.setPatientName(rs.getString("patient_name"));
                dto.setService(rs.getString("service"));
                dto.setDate(rs.getString("date"));
                dto.setTime(rs.getString("time"));
                dto.setStatus(rs.getString("status"));

                appointments.add(dto);
            }
            return appointments;

        } catch (SQLException e) {
            System.out.println("Error at reading Appointments: " + e.getMessage());
            status = "Error at reading Appointments: " + e.getMessage();
        }
        return new Vector<>();
    }

    public AppointmentDTO loadAppointmentDTOById(int appointmentId) {

        String sql = """
        SELECT
            a.appointment_id                       AS appointment_id,
            a.doctor_id                            AS doctor_id,
            a.patient_id                           AS patient_id,
            pu.fullname                            AS patient_name,
            srv.service_name                       AS service,
            FORMAT(a.appointment_time,'dd/MM/yyyy') AS date,
            FORMAT(a.appointment_time,'HH:mm')      AS time,
            a.status                               AS status
        FROM   Appointments a
        JOIN   Users    pu  ON pu.user_id   = a.patient_id
        JOIN   Services srv ON srv.service_id = a.service_id
        WHERE  a.appointment_id = ?;
        """;

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, appointmentId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    AppointmentDTO dto = new AppointmentDTO();

                    dto.setAppointmentId(rs.getInt("appointment_id"));
                    int doctorId = rs.getInt("doctor_id");
                    dto.setDoctor(DoctorDAO.INSTANCE.getDoctorById(doctorId));
                    int patientId = rs.getInt("patient_id");
                    dto.setPatient(PatientDAO.INSTANCE.getPatientById(patientId));
                    dto.setPatientName(rs.getString("patient_name"));
                    dto.setService(rs.getString("service"));
                    dto.setDate(rs.getString("date"));
                    dto.setTime(rs.getString("time"));
                    dto.setStatus(rs.getString("status"));

                    return dto;
                }
            }

        } catch (SQLException e) {
            System.out.println("Error at reading Appointment by ID: " + e.getMessage());
            status = "Error at reading Appointment by ID: " + e.getMessage();
        }
        return null;
    }

    public Vector<AppointmentDTO> loadAppointmentDTOByDoctorId(int doctorId, String statusFilter) {

        StringBuilder sql = new StringBuilder("""
        SELECT
            a.appointment_id                          AS appointment_id,
            a.doctor_id                               AS doctor_id,
            a.patient_id                              AS patient_id,
            pu.fullname                               AS patient_name,
            FORMAT(pu.dob,'dd/MM/yyyy')               AS patient_dob,
            srv.service_name                          AS service,
            FORMAT(a.appointment_time,'dd/MM/yyyy')   AS date,
            FORMAT(a.appointment_time,'HH:mm')        AS time,
            a.status                                  AS status
        FROM   Appointments a
        JOIN   Users      pu  ON pu.user_id   = a.patient_id
        JOIN   Services   srv ON srv.service_id = a.service_id
        WHERE  a.doctor_id = ?
        """);

        if (statusFilter != null && !statusFilter.isBlank()) {
            sql.append(" AND a.status = ? ");
        }
        sql.append(" ORDER BY a.appointment_time;");

        Vector<AppointmentDTO> list = new Vector<>();

        try (PreparedStatement ps = con.prepareStatement(sql.toString())) {

            ps.setInt(1, doctorId);
            if (statusFilter != null && !statusFilter.isBlank()) {
                ps.setString(2, statusFilter);   // gán tham số trạng thái
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    AppointmentDTO dto = new AppointmentDTO();
                    dto.setAppointmentId(rs.getInt("appointment_id"));
                    int doctorId1 = rs.getInt("doctor_id");
                    dto.setDoctor(DoctorDAO.INSTANCE.getDoctorById(doctorId1));
                    int patientId = rs.getInt("patient_id");
                    dto.setPatient(PatientDAO.INSTANCE.getPatientById(patientId));
                    dto.setPatientName(rs.getString("patient_name"));
                    dto.setPatientDob(rs.getString("patient_dob"));
                    dto.setService(rs.getString("service"));
                    dto.setDate(rs.getString("date"));
                    dto.setTime(rs.getString("time"));
                    dto.setStatus(rs.getString("status"));
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error at reading Appointments by DoctorId: " + e.getMessage());
            status = "Error at reading Appointments by DoctorId: " + e.getMessage();
        }
        return list;
    }

    public static void main(String[] args) {
        Vector<AppointmentDTO> appointmentDTOs = AppointmentDAO.INSTANCE.loadAppointmentDTOs();
        Vector<AppointmentDTO> appointmentDTOs1 = AppointmentDAO.INSTANCE.loadAppointmentDTOByDoctorId(21, "PENDING");

        for (AppointmentDTO a : appointmentDTOs1) {
            System.out.println(a.toString());
        }

    }
}
