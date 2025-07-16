/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Patient;

import DAL.AppointmentBooking;
import Models.Service;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
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
@WebServlet(name = "LoadServices", urlPatterns = {"/LoadServices"})
public class LoadServices extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        try {
            // Sử dụng hàm getAllServices() từ AppointmentBooking
            Vector<Service> services = AppointmentBooking.INSTANCE.getAllServices();
            JsonArray jsonArray = new JsonArray();
            
            for (Service service : services) {
                JsonObject jsonObj = new JsonObject();
                jsonObj.addProperty("id", service.getId());
                jsonObj.addProperty("serviceName", service.getServiceName());
                jsonObj.addProperty("description", service.getDescription());
                if (service.getSpecialty() != null) {
                    jsonObj.addProperty("specialtyName", service.getSpecialty().getSpecialtyName());
                }
                jsonArray.add(jsonObj);
            }
            
            response.getWriter().write(jsonArray.toString());
            
        } catch (Exception e) {
            e.printStackTrace();
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("[]");
        }
    }
}
