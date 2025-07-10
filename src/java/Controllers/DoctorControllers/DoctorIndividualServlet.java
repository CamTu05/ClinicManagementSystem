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
        DoctorDAO doctorDAO = new DoctorDAO();
        int id = Integer.parseInt(request.getParameter("doctorId"));
        Vector<Doctor> doctors = doctorDAO.LoadAllDoctors();
        Doctor d = doctorDAO.getDoctorById(id, doctors);
        String name = doctorDAO.getDoctorNameById(id);
        request.setAttribute("name", name);
        request.setAttribute("doctor", d);
        request.setAttribute("doctorDAO", doctorDAO);
        request.setAttribute("feedback", doctorDAO.getFeedbackByDoctorId(id));
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
