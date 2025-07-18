/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DoctorDAO;
import DAL.ScheduleDAO;
import DAL.SpecialtyDAO;
import DAL.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author SONHA
 */
public class LoadSpecialtyServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SpecialtyDAO.INSTANCE.LoadSpecialty();
        ScheduleDAO.INSTANCE.LoadSchedules();
        DoctorDAO.INSTANCE.LoadDoctor();
        SpecialtyDAO.INSTANCE.LoadSpecialty();
        UserDAO.INSTANCE.LoadUser();
        HttpSession session = request.getSession();
        
        session.setAttribute("daoSchedules", ScheduleDAO.INSTANCE);
        session.setAttribute("daoDoctor", DoctorDAO.INSTANCE);
        session.setAttribute("daoSpecialty", SpecialtyDAO.INSTANCE);
        session.setAttribute("daoUser", UserDAO.INSTANCE);
        session.setAttribute("daoSpecialty", SpecialtyDAO.INSTANCE);
        request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

