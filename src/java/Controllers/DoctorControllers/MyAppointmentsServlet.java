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

        String filterStatus = request.getParameter("filter");
        String statusFilter;

        if (filterStatus == null || filterStatus.isBlank() || filterStatus.equals("All")) {
            statusFilter = null;
            filterStatus = "All";
        } else {
            switch (filterStatus) {
                case "upcoming" ->
                    statusFilter = "CONFIRMED";
                case "pending" ->
                    statusFilter = "PENDING";
                case "finished" ->
                    statusFilter = "COMPLETED";
                case "cancelled" ->
                    statusFilter = "CANCELLED";
                default -> {
                    statusFilter = null;
                    filterStatus = "All";
                }
            }
        }

        Vector<AppointmentDTO> appointmentDTOs = AppointmentDAO.INSTANCE.loadAppointmentDTOByDoctorId(doctor.getId(), statusFilter); 
        request.setAttribute("doctor", doctor);
        request.setAttribute("currentFilter", filterStatus);
        request.setAttribute("appointmentDTOs", appointmentDTOs);
        request.getRequestDispatcher("Views/Doctor/MyAppointments.jsp")
                .forward(request, response);
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
