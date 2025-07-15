/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.DoctorControllers;

import DAL.AppointmentDAO;
import DAL.DoctorDAO;
import DTO.AppointmentDTO;
import Models.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;

/**
 *
 * @author Admin
 */
public class MyAppointmentsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        User user = (User) ses.getAttribute("user");
        Doctor doctor = DoctorDAO.INSTANCE.getDoctorById(user.getId());
        Vector<AppointmentDTO> appointmentDTOs = AppointmentDAO.INSTANCE.loadAppointmentDTOByDoctorId(doctor.getId(), null);

        String filter = request.getParameter("filter");   
        String status;                             

        if (filter == null || filter.isBlank() || filter.equals("All")) {
            status = null;      
            filter = "All";      
        } else {
            switch (filter) {
                case "upcoming":
                    status = "CONFIRMED";
                    break;
                case "pending":
                    status = "PENDING";
                    break;
                case "finished":
                    status = "COMPLETED";
                    break;
                case "cancelled":
                    status = "CANCELLED";
                    break;
                default:
                    status = null; 
                    filter = "All";
            }
        }

        appointmentDTOs = AppointmentDAO.INSTANCE.loadAppointmentDTOByDoctorId(doctor.getId(), status);
        request.setAttribute("doctor", doctor);
        request.setAttribute("currentFilter", filter);
        request.setAttribute("appointmentDTOs", appointmentDTOs);
        request.getRequestDispatcher("Views/Doctor/MyAppointments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String btnFilter = request.getParameter("btnFilter");

        String redirectURL = request.getContextPath() + "/MyAppointmentsServlet"
                + (btnFilter == null ? "" : "?filter=" + btnFilter);

        response.sendRedirect(redirectURL);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
