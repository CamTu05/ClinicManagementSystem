package Controllers.Patient;

import DAL.AppointmentBooking;
import Models.Schedule;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Vector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DoctorSchedule", urlPatterns = {"/DoctorSchedule"})
public class DoctorSchedule extends HttpServlet {

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
            Vector<Schedule> schedules = AppointmentBooking.INSTANCE.getDoctorSchedules(Integer.parseInt(doctorId));
            
            // Tính toán 7 ngày tiếp theo
            LocalDate today = LocalDate.now();
            JsonArray availableDates = new JsonArray();
            
            for (int i = 0; i < 7; i++) {
                LocalDate currentDate = today.plusDays(i);
                int dayOfWeek = currentDate.getDayOfWeek().getValue() % 7; // Chuyển từ 1-7 sang 0-6
                
                // Kiểm tra xem ngày này có trong lịch làm việc không
                boolean hasSchedule = false;
                for (Schedule schedule : schedules) {
                    if (schedule.getWeekday() == dayOfWeek) {
                        hasSchedule = true;
                        break;
                    }
                }
                
                if (hasSchedule) {
                    JsonObject dateObj = new JsonObject();
                    dateObj.addProperty("date", currentDate.toString());
                    dateObj.addProperty("displayName", formatDateDisplay(currentDate));
                    availableDates.add(dateObj);
                }
            }
            
            response.getWriter().write(availableDates.toString());
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("[]");
        }
    }
    
    private String formatDateDisplay(LocalDate date) {
        String[] dayNames = {"Chủ nhật", "Thứ hai", "Thứ ba", "Thứ tư", "Thứ năm", "Thứ sáu", "Thứ bảy"};
        int dayOfWeek = date.getDayOfWeek().getValue() % 7;
        return dayNames[dayOfWeek] + " - " + date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }
}
