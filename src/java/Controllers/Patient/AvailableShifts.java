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
@WebServlet(name = "AvailableShifts", urlPatterns = {"/AvailableShifts"})
public class AvailableShifts extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        String doctorId = request.getParameter("doctorId");
        String dateStr = request.getParameter("date");
        
        try {
            if (doctorId == null || dateStr == null || doctorId.trim().isEmpty() || dateStr.trim().isEmpty()) {
                response.getWriter().write("[]");
                return;
            }
            
            LocalDate selectedDate = LocalDate.parse(dateStr);
            int dayOfWeek = selectedDate.getDayOfWeek().getValue() % 7;
            
            // Lấy ca làm việc của bác sĩ trong ngày
            Vector<String> workingShifts = AppointmentBooking.INSTANCE.getWorkingShifts(Integer.parseInt(doctorId), dayOfWeek);
            
            JsonArray availableShifts = new JsonArray();
            Date sqlDate = Date.valueOf(selectedDate);
            
            for (String shift : workingShifts) {
                // Kiểm tra xem ca này còn slot trống không
                if (AppointmentBooking.INSTANCE.isShiftAvailable(Integer.parseInt(doctorId), sqlDate, shift)) {
                    availableShifts.add(shift);
                }
            }
            
            response.getWriter().write(availableShifts.toString());
            
        } catch (Exception e) {
            e.printStackTrace();
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("[]");
        }
    }
}
