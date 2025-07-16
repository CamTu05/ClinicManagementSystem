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
    
    // Prevent caching
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    
    String serviceId = request.getParameter("serviceId");
    
    try {
        System.out.println("=== PROCESSING SERVICE REQUEST ===");
        System.out.println("Service ID: " + serviceId);
        System.out.println("Timestamp: " + System.currentTimeMillis());
        
        if (serviceId == null || serviceId.trim().isEmpty()) {
            response.getWriter().write("[]");
            return;
        }
        
        Vector<Doctor> doctors = AppointmentBooking.INSTANCE.getDoctorsByServiceId(Integer.parseInt(serviceId));
        JsonArray jsonArray = new JsonArray();
        
        System.out.println("Found " + doctors.size() + " doctors for service " + serviceId);
        
        for (Doctor doctor : doctors) {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("id", doctor.getId());
            
            String doctorName = "Unknown";
            if (doctor.getDoctor() != null) {
                doctorName = doctor.getDoctor().getFullname();
            } else {
                doctorName = doctor.getDoctorName();
            }
            
            if (doctorName == null || doctorName.equals("Unknown")) {
                doctorName = "Bác sĩ " + doctor.getId();
            }
            
            jsonObj.addProperty("fullname", doctorName);
            jsonArray.add(jsonObj);
        }
        
        String finalJson = jsonArray.toString();
        System.out.println("Final JSON for service " + serviceId + ": " + finalJson);
        response.getWriter().write(finalJson);
        
    } catch (Exception e) {
        e.printStackTrace();
        response.getWriter().write("[]");
    }
}

}
