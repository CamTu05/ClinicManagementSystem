/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.DoctorControllers;

import DAL.*;
import Models.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
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
        Vector<Doctor> doctors = DoctorDAO.INSTANCE.LoadAllDoctors();
        List<String> doctorName = new ArrayList<>();
        for (Doctor d : doctors) {
            doctorName.add(DoctorDAO.INSTANCE.getDoctorNameById(d.getId()));
        }
        request.setAttribute("doctorList", doctors);
        request.setAttribute("doctorDAO", DoctorDAO.INSTANCE);
        request.setAttribute("doctorName", doctorName);
        
        request.getRequestDispatcher("/Views/Doctors/Feedback.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Vector<Doctor> doctors = DoctorDAO.INSTANCE.LoadAllDoctors(); // Lấy danh sách bác sĩ từ database
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("feedback");
        Doctor d = DoctorDAO.INSTANCE.getDoctorById(doctorId, doctors);

        // Lấy session nếu có
        HttpSession session = request.getSession(false);

        // Tạo timestamp cho thời gian hiện tại
        Timestamp createdAt = new Timestamp(System.currentTimeMillis());

        // Khởi tạo đối tượng Feedback
        Feedback feedback = new Feedback();

        // Kiểm tra session và lấy thông tin người dùng
        if (session != null) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                int userId = user.getId();
                Patient p = PatientDAO.INSTANCE.getPatientById(userId);
                if (p != null) {
                    // Tạo đối tượng Feedback với thông tin người dùng, bác sĩ, và các tham số khác
                    feedback = new Feedback(userId, p, d, rating, comment, createdAt);
                } else {
                    response.getWriter().println("Patient information not found.");
                    return;
                }
            } else {
                response.getWriter().println("User is not logged in.");
                return; // Ngừng xử lý nếu không có user trong session
            }
        } else {
            response.getWriter().println("Session expired or not found.");
            return; // Ngừng xử lý nếu session không tồn tại
        }

        // Thêm feedback vào database
        FeedbackDAO.INSTANCE.addFeedback(feedback);
        request.getRequestDispatcher("/Views/Doctors/Feedback.jsp" ).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
