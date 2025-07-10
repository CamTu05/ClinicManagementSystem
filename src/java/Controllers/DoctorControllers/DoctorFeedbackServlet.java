/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.DoctorControllers;

import DAL.DoctorDAO;
import Models.Doctor;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author Admin
 */
public class DoctorFeedbackServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DoctorDAO doctorDAO = new DoctorDAO();
        Vector<Doctor> doctors = doctorDAO.LoadAllDoctors();
        List<String> doctorName = new ArrayList<>();
        for (Doctor d : doctors){
            doctorName.add(doctorDAO.getDoctorNameById(d.getId()));
        }
        request.setAttribute("doctorList", doctors);
        request.setAttribute("doctorDAO", doctorDAO);
        request.setAttribute("doctorName", doctorName);
        
        request.getRequestDispatcher("/Views/Doctors/Feedback.jsp" ).forward(request, response);
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
