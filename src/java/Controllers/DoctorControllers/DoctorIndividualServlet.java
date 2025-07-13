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
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.sql.SQLException;
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

        try {
            Vector<FeedbackInfor> feedbacks = FeedbackDAO.INSTANCE.getFeedbackInfoByDoctor(Integer.parseInt(doctorIdStr));
            DoctorInformation doctor = DoctorDAO.INSTANCE.getDoctorInformationById(doctorIdStr);

            request.setAttribute("feedbacks", feedbacks);
            request.setAttribute("doctorId", doctorIdStr);
            request.setAttribute("d", doctor);

        } catch (SQLException ex) {
            Logger.getLogger(DoctorIndividualServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.getRequestDispatcher("/Views/IndividualDoctors.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String doctorIdStr = request.getParameter("DoctorId");
        String submit = request.getParameter("btnSubmit");

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            request.setAttribute("message", "Bạn cần đăng nhập để tiếp tục.");
            request.getRequestDispatcher("/Views/Login.jsp").forward(request, response);
            return;
        }

        if (submit != null && !submit.isEmpty()) {
            int doctorId = Integer.parseInt(doctorIdStr);
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");
            Patient patient = PatientDAO.INSTANCE.getPatientById(user.getId());
            Doctor doctor = DoctorDAO.INSTANCE.getDoctorById(doctorId, DoctorDAO.INSTANCE.LoadAllDoctors());
            Feedback feedback = new Feedback(null, patient, doctor, rating, comment, new Timestamp(System.currentTimeMillis()));
            FeedbackDAO.INSTANCE.addFeedback(feedback);
        }

        // Reload feedbacks after submitting
        try {
            Vector<FeedbackInfor> feedbacks = FeedbackDAO.INSTANCE.getFeedbackInfoByDoctor(Integer.parseInt(doctorIdStr));
            DoctorInformation doctor = DoctorDAO.INSTANCE.getDoctorInformationById(doctorIdStr);

            request.setAttribute("feedbacks", feedbacks);
            request.setAttribute("doctorId", doctorIdStr);
            request.setAttribute("d", doctor);
        } catch (SQLException ex) {
            Logger.getLogger(DoctorIndividualServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("/Views/IndividualDoctors.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
