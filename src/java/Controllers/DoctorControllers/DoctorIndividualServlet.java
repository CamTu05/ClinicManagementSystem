/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.DoctorControllers;

import Models.TempModels.DoctorInformation;
import DAL.*;
import Models.*;
import Models.TempModels.FeedbackInfor;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.Stack;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DoctorIndividualServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String doctorIdStr = request.getParameter("doctorId");
        
        Vector<FeedbackInfor> feedbacks = new Vector<>();
        try {
            feedbacks = FeedbackDAO.INSTANCE.getFeedbackInfoByDoctor(Integer.parseInt(doctorIdStr));
        } catch (SQLException ex) {
            Logger.getLogger(DoctorIndividualServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        DoctorInformation doctors;
        try {
            doctors = DoctorDAO.INSTANCE.getDoctorInformationById(doctorIdStr);
        } catch (SQLException ex) {
            return;
        }

        request.setAttribute("feedbacks", feedbacks);
        request.setAttribute("doctorId", doctorIdStr);
        request.setAttribute("d", doctors);
        request.getRequestDispatcher("/Views/IndividualDoctors.jsp").forward(request, response);
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
