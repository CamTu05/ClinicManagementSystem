/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Appointment;
import Models.Doctor;
import Models.Service;
import Models.Specialty;
import Models.User;
import java.sql.Connection;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;

/**
 *
 * @author admin
 */
public class AppointmentBooking{

    private String status = "ok";
    private Connection con;

    public static AppointmentBooking INSTANCE = new AppointmentBooking();

    public AppointmentBooking() {
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
                Doctor doctor = DoctorDAO.INSTANCE.getDoctorById(rs.getInt("doctor_id"));
                Appointment a = new Appointment(doctor, rs.getInt("service_id"), rs.getDate("appointment_day"),
                        rs.getString("appointment_shift"),
                        rs.getString("status"),
                        rs.getString("description"),
                        rs.getTimestamp("created_at"));
                appointments.add(a);
            }
        } catch (Exception e) {
            status = "Error at getAppointmentsByPatientId " + e.getMessage();
        }
        return appointments;
    }

    // Lấy danh sách tất cả dịch vụ
    public Vector<Service> getAllServices() {
        Vector<Service> services = new Vector<Service>();
        String sql = "SELECT service_id, service_name, price, description, specialty_id FROM Services";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Specialty specialty = getSpecialtyById(rs.getInt("specialty_id"));
                Service service = new Service(
                    rs.getInt("service_id"),
                    rs.getString("service_name"),
                    rs.getDouble("price"),
                    rs.getString("description"),
                    specialty
                );
                services.add(service);
            }
        } catch (Exception e) {
            status = "Error at getAllServices " + e.getMessage();
        }
        return services;
    }

    // Lấy danh sách bác sĩ theo dịch vụ
   // Trong AppointmentBooking.getDoctorsByServiceId()
public Vector<Doctor> getDoctorsByServiceId(int serviceId) {
    Vector<Doctor> doctors = new Vector<Doctor>();
    String sql = "SELECT d.doctor_id, d.specialty_id, d.years_experience, d.description, d.picture " +
                 "FROM Doctors d " +
                 "JOIN Services s ON d.specialty_id = s.specialty_id " +
                 "WHERE s.service_id = ?";
    try {
        PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1, serviceId);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Specialty specialty = getSpecialtyById(rs.getInt("specialty_id"));
            
            // Load User object
            User user = UserDAO.INSTANCE.findUserById(rs.getInt("doctor_id"));
            
            Doctor doctor = new Doctor(
                user, // Truyền User object vào constructor
                specialty,
                rs.getInt("years_experience"),
                rs.getString("description"),
                rs.getString("picture")
            );
            doctor.setId(rs.getInt("doctor_id"));
            doctors.add(doctor);
        }
    } catch (Exception e) {
        status = "Error at getDoctorsByServiceId " + e.getMessage();
    }
    return doctors;
}


    // Lấy các ngày trong tuần mà bác sĩ làm việc
    public Vector<Integer> getWorkingDays(int doctorId) {
        Vector<Integer> workingDays = new Vector<Integer>();
        String sql = "SELECT DISTINCT weekday FROM Schedules WHERE doctor_id = ? ORDER BY weekday";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, doctorId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                workingDays.add(rs.getInt("weekday"));
            }
        } catch (Exception e) {
            status = "Error at getWorkingDays " + e.getMessage();
        }
        return workingDays;
    }

    // Kiểm tra xem bác sĩ có slot trống trong ngày không
    public boolean hasAvailableSlot(int doctorId, Date date) {
        String sql = "SELECT COUNT(*) as count FROM Appointments WHERE doctor_id = ? AND appointment_day = ? AND status != 'CANCELLED'";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, doctorId);
            st.setDate(2, date);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                // Giả sử mỗi bác sĩ chỉ nhận tối đa 20 lịch hẹn/ngày (10 sáng + 10 chiều)
                return count < 20;
            }
        } catch (Exception e) {
            status = "Error at hasAvailableSlot " + e.getMessage();
        }
        return false;
    }

    // Lấy các ca làm việc của bác sĩ trong một ngày cụ thể
    public Vector<String> getWorkingShifts(int doctorId, int dayOfWeek) {
        Vector<String> workingShifts = new Vector<String>();
        String sql = "SELECT start_time, end_time FROM Schedules WHERE doctor_id = ? AND weekday = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, doctorId);
            st.setInt(2, dayOfWeek);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String startTime = rs.getTime("start_time").toString();
                String endTime = rs.getTime("end_time").toString();
                
                // Chuyển đổi thời gian thành ca làm việc
                if (startTime.compareTo("12:00:00") < 0) {
                    if (!workingShifts.contains("Sáng")) {
                        workingShifts.add("Sáng");
                    }
                } else {
                    if (!workingShifts.contains("Chiều")) {
                        workingShifts.add("Chiều");
                    }
                }
            }
        } catch (Exception e) {
            status = "Error at getWorkingShifts " + e.getMessage();
        }
        return workingShifts;
    }

    // Kiểm tra xem buổi khám có còn slot trống không
    public boolean isShiftAvailable(int doctorId, Date date, String shift) {
        String sql = "SELECT COUNT(*) as count FROM Appointments WHERE doctor_id = ? AND appointment_day = ? AND appointment_shift = ? AND status != 'CANCELLED'";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, doctorId);
            st.setDate(2, date);
            st.setString(3, shift);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                // Giả sử mỗi buổi chỉ nhận tối đa 10 lịch hẹn
                return count < 10;
            }
        } catch (Exception e) {
            status = "Error at isShiftAvailable " + e.getMessage();
        }
        return false;
    }

    // Kiểm tra bác sĩ có làm việc vào ca cụ thể không
    public boolean isDoctorWorkingOnShift(int doctorId, int dayOfWeek, String shift) {
        String sql = "SELECT start_time, end_time FROM Schedules WHERE doctor_id = ? AND weekday = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, doctorId);
            st.setInt(2, dayOfWeek);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String startTime = rs.getTime("start_time").toString();
                
                // Kiểm tra ca làm việc
                if (shift.equals("Sáng") && startTime.compareTo("12:00:00") < 0) {
                    return true;
                } else if (shift.equals("Chiều") && startTime.compareTo("12:00:00") >= 0) {
                    return true;
                }
            }
        } catch (Exception e) {
            status = "Error at isDoctorWorkingOnShift " + e.getMessage();
        }
        return false;
    }

    // Thêm lịch hẹn mới
    public boolean addAppointment(Appointment appointment) {
        String sql = "INSERT INTO Appointments (patient_id, fullname, phone, dob, gender, address, doctor_id, service_id, appointment_day, appointment_shift, status, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            if (appointment.getPatient() != null) {
                st.setInt(1, appointment.getPatient().getId());
            } else {
                st.setNull(1, java.sql.Types.INTEGER);
            }
            st.setString(2, appointment.getFullname());
            st.setString(3, appointment.getPhone());
            st.setDate(4, appointment.getDob());
            st.setString(5, appointment.getGender());
            st.setString(6, appointment.getAddress());
            st.setInt(7, appointment.getDoctor().getId());
            st.setInt(8, appointment.getServiceId());
            st.setDate(9, appointment.getAppointmentDay());
            st.setString(10, appointment.getAppointmentShift());
            st.setString(11, appointment.getStatus());
            st.setString(12, appointment.getDescription());
            
            int result = st.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            status = "Error at addAppointment " + e.getMessage();
        }
        return false;
    }

    // Lấy dịch vụ theo ID
    public Service getServiceById(int serviceId) {
        String sql = "SELECT service_id, service_name, price, description, specialty_id FROM Services WHERE service_id = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, serviceId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Specialty specialty = getSpecialtyById(rs.getInt("specialty_id"));
                Service service = new Service(
                    rs.getInt("service_id"),
                    rs.getString("service_name"),
                    rs.getDouble("price"),
                    rs.getString("description"),
                    specialty
                );
                return service;
            }
        } catch (Exception e) {
            status = "Error at getServiceById " + e.getMessage();
        }
        return null;
    }

    // Lấy thông tin bác sĩ theo ID
    public Doctor getDoctorById(int doctorId) {
        String sql = "SELECT doctor_id, specialty_id, years_experience, description, picture FROM Doctors WHERE doctor_id = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, doctorId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Specialty specialty = getSpecialtyById(rs.getInt("specialty_id"));
                Doctor doctor = new Doctor(
                    rs.getInt("doctor_id"),
                    specialty,
                    rs.getInt("years_experience"),
                    rs.getString("description"),
                    rs.getString("picture")
                );
                return doctor;
            }
        } catch (Exception e) {
            status = "Error at getDoctorById " + e.getMessage();
        }
        return null;
    }

    // Lấy chuyên khoa theo ID
    public Specialty getSpecialtyById(int specialtyId) {
        String sql = "SELECT specialty_id, specialty_name FROM Specialties WHERE specialty_id = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, specialtyId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Specialty specialty = new Specialty(
                    rs.getInt("specialty_id"),
                    rs.getString("specialty_name")
                );
                return specialty;
            }
        } catch (Exception e) {
            status = "Error at getSpecialtyById " + e.getMessage();
        }
        return null;
    }

    // Đếm số lượng lịch hẹn của bác sĩ trong ngày
    public int countAppointmentsByDoctorAndDate(int doctorId, Date date) {
        String sql = "SELECT COUNT(*) as count FROM Appointments WHERE doctor_id = ? AND appointment_day = ? AND status != 'CANCELLED'";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, doctorId);
            st.setDate(2, date);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (Exception e) {
            status = "Error at countAppointmentsByDoctorAndDate " + e.getMessage();
        }
        return 0;
    }

    // Kiểm tra bác sĩ có làm việc vào ngày cụ thể không
    public boolean isDoctorWorkingOnDay(int doctorId, int dayOfWeek) {
        String sql = "SELECT COUNT(*) as count FROM Schedules WHERE doctor_id = ? AND weekday = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, doctorId);
            st.setInt(2, dayOfWeek);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("count") > 0;
            }
        } catch (Exception e) {
            status = "Error at isDoctorWorkingOnDay " + e.getMessage();
        }
        return false;
    }
}

