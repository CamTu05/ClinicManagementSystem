/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.DoctorControllers;

import DAL.DoctorDAO;
import Models.Doctor;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;

/**
 *
 * @author Admin
 */
public class DoctorIndividualServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("doctorId"));
        Vector<Doctor> doctors = DoctorDAO.INSTANCE.LoadAllDoctors();
        Doctor d = DoctorDAO.INSTANCE.getDoctorById(id, doctors);
        String name = DoctorDAO.INSTANCE.getDoctorNameById(id);
        request.setAttribute("name", name);
        request.setAttribute("doctor", d);
        request.setAttribute("doctorDAO", DoctorDAO.INSTANCE);
        request.setAttribute("feedback", DoctorDAO.INSTANCE.getFeedbackByDoctorId(id));
        request.getRequestDispatcher("/Views/IndividualDoctors.jsp" ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
