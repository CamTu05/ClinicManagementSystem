/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.DoctorControllers;

import DAL.DoctorDAO;
import Models.*;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;

/**
 *
 * @author Admin
 */
public class DoctorListServlet extends HttpServlet {
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DoctorDAO doctorDAO = new DoctorDAO();
        Vector<Doctor> doctorList = doctorDAO.LoadAllDoctors();
        request.setAttribute("doctorList", doctorList); 
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/DoctorList.jsp");
        dispatcher.forward(request, response);
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
