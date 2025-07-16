/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Patient;

import DAL.AppointmentBooking;
import com.google.gson.JsonArray;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Vector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author BUI TUAN DAT
 */
@WebServlet(name = "AvailableDates", urlPatterns = {"/AvailableDates"})
public class AvailableDates extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        String doctorId = request.getParameter("doctorId");
        
        try {
            if (doctorId == null || doctorId.trim().isEmpty()) {
                response.getWriter().write("[]");
                return;
            }
            
            // Lấy lịch làm việc của bác sĩ
            Vector<Integer> workingDays = AppointmentBooking.INSTANCE.getWorkingDays(Integer.parseInt(doctorId));
            
            JsonArray availableDates = new JsonArray();
            LocalDate today = LocalDate.now();
            
            // Kiểm tra 14 ngày tiếp theo
            for (int i = 0; i < 14; i++) {
                LocalDate checkDate = today.plusDays(i);
                int dayOfWeek = checkDate.getDayOfWeek().getValue() % 7; // Chuyển từ 1-7 sang 0-6
                
                // Kiểm tra xem ngày này bác sĩ có làm việc không
                if (workingDays.contains(dayOfWeek)) {
                    // Kiểm tra xem ngày này có còn slot trống không
                    if (AppointmentBooking.INSTANCE.hasAvailableSlot(Integer.parseInt(doctorId), Date.valueOf(checkDate))) {
                        availableDates.add(checkDate.toString());
                    }
                }
            }
            
            response.getWriter().write(availableDates.toString());
            
        } catch (Exception e) {
            e.printStackTrace();
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("[]");
        }
    }
}
