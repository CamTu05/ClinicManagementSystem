/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import DTO.AppointmentDTO;
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
            a.appointment_id            AS appointment_id,
            a.doctor_id                 AS doctor_id,
            a.patient_id                AS patient_id,
            pu.fullname                 AS patient_name,
            FORMAT(pu.dob,'dd/MM/yyyy') AS patient_dob,
            srv.service_name            AS service,
            FORMAT(a.appointment_day,'dd/MM/yyyy') AS date,
            a.appointment_shift         AS shift,
            a.status                    AS status
        FROM   Appointments a
        LEFT JOIN Users    pu  ON pu.user_id   = a.patient_id
        JOIN   Services   srv  ON srv.service_id = a.service_id
        ORDER  BY a.appointment_day, a.appointment_shift;
        """;

        Vector<AppointmentDTO> appointments = new Vector<>();

        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                AppointmentDTO dto = new AppointmentDTO();

                dto.setAppointmentId(rs.getInt("appointment_id"));
                int doctorId = rs.getInt("doctor_id");
                dto.setDoctor(DoctorDAO.INSTANCE.getDoctorById(doctorId));

                int patientId = rs.getInt("patient_id");
                if (patientId != 0) {                       // có tài khoản
                    dto.setPatient(PatientDAO.INSTANCE.getPatientById(patientId));
                }
                dto.setPatientName(rs.getString("patient_name"));
                dto.setPatientDob(rs.getString("patient_dob"));
                dto.setService(rs.getString("service"));
                dto.setDate(rs.getString("date"));
                dto.setShift(rs.getString("shift"));        // dùng shift thay cho time
                dto.setStatus(rs.getString("status"));

                appointments.add(dto);
            }
            return appointments;

        } catch (SQLException e) {
            System.out.println("Error reading Appointments: " + e.getMessage());
            status = "Error reading Appointments: " + e.getMessage();
        }
        return new Vector<>();
    }

    public AppointmentDTO loadAppointmentDTOById(int appointmentId) {

        String sql = """
        SELECT
            a.appointment_id            AS appointment_id,
            a.doctor_id                 AS doctor_id,
            a.patient_id                AS patient_id,
            pu.fullname                 AS patient_name,
            FORMAT(pu.dob,'dd/MM/yyyy') AS patient_dob,
            srv.service_name            AS service,
            FORMAT(a.appointment_day,'dd/MM/yyyy') AS date,
            a.appointment_shift         AS shift,
            a.status                    AS status
        FROM   Appointments a
        LEFT JOIN Users    pu  ON pu.user_id   = a.patient_id
        JOIN   Services   srv  ON srv.service_id = a.service_id
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
                    if (patientId != 0) {
                        dto.setPatient(PatientDAO.INSTANCE.getPatientById(patientId));
                    }
                    dto.setPatientName(rs.getString("patient_name"));
                    dto.setPatientDob(rs.getString("patient_dob"));
                    dto.setService(rs.getString("service"));
                    dto.setDate(rs.getString("date"));
                    dto.setShift(rs.getString("shift"));
                    dto.setStatus(rs.getString("status"));

                    return dto;
                }
            }

        } catch (SQLException e) {
            System.out.println("Error reading Appointment by ID: " + e.getMessage());
            status = "Error reading Appointment by ID: " + e.getMessage();
        }
        return null;
    }

    public Vector<Appointment> getAppointmentsByPatientId(int patientId, String statusFilter) {

        StringBuilder sql = new StringBuilder("""
        SELECT
            a.appointment_id,
            a.patient_id,
            a.fullname,
            a.phone,
            a.dob,
            a.gender,
            a.address,
            a.doctor_id,
            a.service_id,
            a.appointment_day,
            a.appointment_shift,
            a.status,
            a.description,
            a.created_at
        FROM   Appointments a
        WHERE  a.patient_id = ?
    """);

        if (statusFilter != null && !statusFilter.isBlank()) {
            sql.append(" AND a.status = ? ");
        }
        sql.append(" ORDER BY a.appointment_day DESC, a.appointment_shift;");

        Vector<Appointment> list = new Vector<>();

        try (PreparedStatement ps = con.prepareStatement(sql.toString())) {

            ps.setInt(1, patientId);
            if (statusFilter != null && !statusFilter.isBlank()) {
                ps.setString(2, statusFilter.trim());
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Appointment ap = new Appointment();

                    ap.setId(rs.getInt("appointment_id"));
                    ap.setPatient(PatientDAO.INSTANCE.getPatientById(patientId));

                    ap.setFullname(rs.getString("fullname"));
                    ap.setPhone(rs.getString("phone"));
                    ap.setDob(rs.getDate("dob"));
                    ap.setGender(rs.getString("gender"));
                    ap.setAddress(rs.getString("address"));

                    int doctorId = rs.getInt("doctor_id");
                    ap.setDoctor(DoctorDAO.INSTANCE.getDoctorById(doctorId));

                    ap.setServiceId(rs.getInt("service_id"));
                    ap.setAppointmentDay(rs.getDate("appointment_day"));
                    ap.setAppointmentShift(rs.getString("appointment_shift"));
                    ap.setStatus(rs.getString("status"));
                    ap.setDescription(rs.getString("description"));
                    ap.setCreatedAt(rs.getTimestamp("created_at"));

                    list.add(ap);
                }
            }

        } catch (SQLException e) {
            System.out.println("Error loading appointments by patientId: " + e.getMessage());
            status = "Error loading appointments by patientId: " + e.getMessage();
        }
        return list;
    }

    public Vector<AppointmentDTO> loadAppointmentDTOByDoctorId(int doctorId, String statusFilter) {

        StringBuilder sql = new StringBuilder("""
        SELECT
            a.appointment_id                     AS appointment_id,
            a.doctor_id                          AS doctor_id,
            a.patient_id                         AS patient_id,
            pu.fullname                          AS patient_name,
            FORMAT(pu.dob, 'dd/MM/yyyy')         AS patient_dob,
            srv.service_name                     AS service,
            FORMAT(a.appointment_day,'dd/MM/yyyy') AS date,
            a.appointment_shift                  AS shift,
            a.status                             AS status
        FROM   Appointments a
        LEFT JOIN Users    pu  ON pu.user_id   = a.patient_id
        JOIN   Services   srv  ON srv.service_id = a.service_id
        WHERE  a.doctor_id = ?
    """);

        if (statusFilter != null && !statusFilter.isBlank()) {
            sql.append(" AND a.status = ? ");
        }
        sql.append(" ORDER BY a.appointment_day, a.appointment_shift;");

        Vector<AppointmentDTO> list = new Vector<>();

        try (PreparedStatement ps = con.prepareStatement(sql.toString())) {

            ps.setInt(1, doctorId);
            if (statusFilter != null && !statusFilter.isBlank()) {
                ps.setString(2, statusFilter.trim());
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    AppointmentDTO dto = new AppointmentDTO();
                    dto.setAppointmentId(rs.getInt("appointment_id"));

                    int docId = rs.getInt("doctor_id");
                    dto.setDoctor(DoctorDAO.INSTANCE.getDoctorById(docId));

                    int patientId = rs.getInt("patient_id");
                    // Bệnh nhân có thể NULL (đặt hẹn không tài khoản)
                    if (patientId != 0) {
                        dto.setPatient(PatientDAO.INSTANCE.getPatientById(patientId));
                    }

                    dto.setPatientName(rs.getString("patient_name"));
                    dto.setPatientDob(rs.getString("patient_dob"));
                    dto.setService(rs.getString("service"));
                    dto.setDate(rs.getString("date"));
                    dto.setShift(rs.getString("shift"));   // Setter mới thay cho time
                    dto.setStatus(rs.getString("status"));

                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error loading appointments: " + e.getMessage());
            status = "Error loading appointments: " + e.getMessage();
        }
        return list;
    }

    public Vector<AppointmentDTO> loadAppointmentDTOByPatientId(int patientId, String statusFilter) {

        StringBuilder sql = new StringBuilder("""
        SELECT
            a.appointment_id                     AS appointment_id,
            a.doctor_id                          AS doctor_id,
            a.patient_id                         AS patient_id,
            du.fullname                          AS doctor_name,
            srv.service_name                     AS service,
            FORMAT(a.appointment_day,'dd/MM/yyyy') AS date,
            a.appointment_shift                  AS shift,
            a.status                             AS status
        FROM   Appointments a
        JOIN   Users    du  ON du.user_id   = a.doctor_id
        JOIN   Services srv ON srv.service_id = a.service_id
        WHERE  a.patient_id = ?
    """);

        if (statusFilter != null && !statusFilter.isBlank()) {
            sql.append(" AND a.status = ? ");
        }
        sql.append(" ORDER BY a.appointment_day, a.appointment_shift;");

        Vector<AppointmentDTO> list = new Vector<>();

        try (PreparedStatement ps = con.prepareStatement(sql.toString())) {

            ps.setInt(1, patientId);
            if (statusFilter != null && !statusFilter.isBlank()) {
                ps.setString(2, statusFilter.trim());
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    AppointmentDTO dto = new AppointmentDTO();

                    dto.setAppointmentId(rs.getInt("appointment_id"));

                    int docId = rs.getInt("doctor_id");
                    dto.setDoctor(DoctorDAO.INSTANCE.getDoctorById(docId));

                    dto.setPatient(PatientDAO.INSTANCE.getPatientById(patientId));
                    String name = UserDAO.INSTANCE.getFullNameById(dto.getPatient().getId());
                    dto.setPatientName(name);

                    dto.setService(rs.getString("service"));
                    dto.setDate(rs.getString("date"));
                    dto.setShift(rs.getString("shift"));
                    dto.setStatus(rs.getString("status"));

                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error loading appointments by patient: " + e.getMessage());
            status = "Error loading appointments by patient: " + e.getMessage();
        }
        return list;
    }

    public Vector<Appointment> getAppointmentsByPatientId(int patientId) {
        Vector<Appointment> appointments = new Vector<Appointment>();
        String sql = "  select [appointment_id], [doctor_id]\n"
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
                Service service = ServicesDAO.INSTANCE.getServiceById(rs.getInt("service_id"));
                Appointment a = new Appointment(rs.getInt("appointment_id"),
                        doctor, service, rs.getDate("appointment_day"),
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

    public Appointment getAppointmentById(int appointmentId) {
        String sql = "select * from Appointment where appointment_id = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, appointmentId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Patient p = PatientDAO.INSTANCE.getPatientById(rs.getInt("patient_id"));
                Doctor d = DoctorDAO.INSTANCE.getDoctorById(rs.getInt("doctor_id"));
                Appointment a = new Appointment(rs.getInt("appoinment_id"),
                        p,
                        rs.getString("fullname"),
                        rs.getString("phone"),
                        rs.getDate("dob"),
                        rs.getString("gender"),
                        rs.getString("address"),
                        d,
                        rs.getInt("service_id"),
                        rs.getDate("appointment_day"),
                        rs.getString("appointment_shift"),
                        rs.getString("status"),
                        rs.getString("description"),
                        rs.getTimestamp("created_at"));
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        Vector<Appointment> a = new Vector<Appointment>();
        a = AppointmentDAO.INSTANCE.getAppointmentsByPatientId(21);
        System.out.println(a);
    }
}
