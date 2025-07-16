/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Patient;

import DAL.AppointmentBooking;
import Models.Appointment;
import Models.Doctor;
import Models.Patient;
import Models.User;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author BUI TUAN DAT
 */
@WebServlet(name = "BookAppointment", urlPatterns = {"/BookAppointment"})
public class BookAppointment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        JsonObject jsonResponse = new JsonObject();
        
        try {
            // Lấy thông tin từ form
            String serviceId = request.getParameter("service");
            String doctorId = request.getParameter("doctor");
            String dateStr = request.getParameter("date");
            String shift = request.getParameter("shift");
            String description = request.getParameter("description");
            
            // Validate input
            if (serviceId == null || doctorId == null || dateStr == null || shift == null ||
                serviceId.trim().isEmpty() || doctorId.trim().isEmpty() || dateStr.trim().isEmpty() || shift.trim().isEmpty()) {
                jsonResponse.addProperty("success", false);
                jsonResponse.addProperty("message", "Vui lòng điền đầy đủ thông tin");
                response.getWriter().write(jsonResponse.toString());
                return;
            }
            
            // Lấy thông tin user từ session
            User currentUser = (User) session.getAttribute("user");
            
            // Tạo appointment object
            Appointment appointment = new Appointment();
            
            if (currentUser != null) {
                // User đã đăng nhập
                Patient patient = new Patient();
                patient.setId(currentUser.getId());
                appointment.setPatient(patient);
                appointment.setFullname(currentUser.getFullname());
                appointment.setPhone(currentUser.getPhone());
                appointment.setDob(Date.valueOf(currentUser.getDob().toString()));
                appointment.setGender(currentUser.getGender());
                appointment.setAddress(currentUser.getAddress());
            } else {
                // Bệnh nhân không có tài khoản - lấy thông tin từ form
                String fullname = request.getParameter("fullname");
                String phone = request.getParameter("phone");
                String dobStr = request.getParameter("dob");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
                
                if (fullname == null || phone == null || dobStr == null || gender == null ||
                    fullname.trim().isEmpty() || phone.trim().isEmpty() || dobStr.trim().isEmpty() || gender.trim().isEmpty()) {
                    jsonResponse.addProperty("success", false);
                    jsonResponse.addProperty("message", "Vui lòng điền đầy đủ thông tin cá nhân");
                    response.getWriter().write(jsonResponse.toString());
                    return;
                }
                
                appointment.setFullname(fullname);
                appointment.setPhone(phone);
                appointment.setDob(Date.valueOf(dobStr));
                appointment.setGender(gender);
                appointment.setAddress(address);
            }
            
            // Set thông tin appointment
            Doctor doctor = AppointmentBooking.INSTANCE.getDoctorById(Integer.parseInt(doctorId));
            appointment.setDoctor(doctor);
            appointment.setServiceId(Integer.parseInt(serviceId));
            appointment.setAppointmentDay(Date.valueOf(dateStr));
            appointment.setAppointmentShift(shift);
            appointment.setStatus("PENDING");
            appointment.setDescription(description);
            
            // Kiểm tra lại slot còn trống không
            if (!AppointmentBooking.INSTANCE.isShiftAvailable(Integer.parseInt(doctorId), Date.valueOf(dateStr), shift)) {
                jsonResponse.addProperty("success", false);
                jsonResponse.addProperty("message", "Slot đã hết chỗ, vui lòng chọn thời gian khác");
                response.getWriter().write(jsonResponse.toString());
                return;
            }
            
            // Thêm appointment vào database
            boolean success = AppointmentBooking.INSTANCE.addAppointment(appointment);
            
            if (success) {
                jsonResponse.addProperty("success", true);
                jsonResponse.addProperty("message", "Đặt lịch khám thành công!");
            } else {
                jsonResponse.addProperty("success", false);
                jsonResponse.addProperty("message", "Có lỗi xảy ra khi đặt lịch");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Lỗi hệ thống: " + e.getMessage());
        }
        
        response.getWriter().write(jsonResponse.toString());
    }
}
