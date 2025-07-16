package Controllers.Patient;

import DAL.AppointmentBooking;
import Models.Doctor;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.util.Vector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DoctorByService", urlPatterns = {"/DoctorByService"})
public class DoctorByService extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        String serviceId = request.getParameter("serviceId");
        
        try {
            if (serviceId == null || serviceId.trim().isEmpty()) {
                response.getWriter().write("[]");
                return;
            }
            
            Vector<Doctor> doctors = AppointmentBooking.INSTANCE.getDoctorsByServiceId(Integer.parseInt(serviceId));
            JsonArray jsonArray = new JsonArray();
            
            for (Doctor doctor : doctors) {
                JsonObject jsonObj = new JsonObject();
                jsonObj.addProperty("id", doctor.getId());
                
                // Debug: In ra thông tin doctor
                System.out.println("Doctor ID: " + doctor.getId());
                System.out.println("Doctor object: " + doctor.getDoctor());
                
                // Lấy tên từ User object trong Doctor
                String doctorName = "Unknown";
                if (doctor.getDoctor() != null) {
                    doctorName = doctor.getDoctor().getFullname();
                    System.out.println("Doctor name from User: " + doctorName);
                } else {
                    // Nếu không có User object, thử lấy từ method getDoctorName()
                    doctorName = doctor.getDoctorName();
                    System.out.println("Doctor name from method: " + doctorName);
                }
                
                // Nếu vẫn null hoặc "Unknown", thử tên mặc định
                if (doctorName == null || doctorName.equals("Unknown")) {
                    doctorName = "Bác sĩ " + doctor.getId();
                }
                
                jsonObj.addProperty("fullname", doctorName);
                jsonArray.add(jsonObj);
            }
            
            System.out.println("Final JSON: " + jsonArray.toString());
            response.getWriter().write(jsonArray.toString());
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("[]");
        }
    }
}
