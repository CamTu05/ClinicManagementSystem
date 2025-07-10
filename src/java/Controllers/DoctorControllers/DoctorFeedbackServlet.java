/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.DoctorControllers;

import DAL.DoctorDAO;
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
        DoctorDAO doctorDAO = new DoctorDAO();
        Vector<Doctor> doctors = doctorDAO.LoadAllDoctors();
        List<String> doctorName = new ArrayList<>();
        for (Doctor d : doctors) {
            doctorName.add(doctorDAO.getDoctorNameById(d.getId()));
        }
        request.setAttribute("doctorList", doctors);
        request.setAttribute("doctorDAO", doctorDAO);
        request.setAttribute("doctorName", doctorName);
        
        request.getRequestDispatcher("/Views/Doctors/Feedback.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DoctorDAO doctorDAO = new DoctorDAO();
        Vector<Doctor> doctors = doctorDAO.LoadAllDoctors(); // Lấy danh sách bác sĩ từ database

        // Lấy session nếu có
        HttpSession session = request.getSession(false);

        // Kiểm tra doctorId từ request và chuyển đổi sang số nguyên
        String doctorIdStr = request.getParameter("doctorId");
        int doctorId = -1;
        if (doctorIdStr != null && !doctorIdStr.isEmpty()) {
            try {
                doctorId = Integer.parseInt(doctorIdStr);
                response.getWriter().println(doctorId);
            } catch (NumberFormatException e) {
                response.getWriter().println("Invalid doctor ID.");
                return; // Ngừng xử lý nếu doctorId không hợp lệ
            }
        }

        // Lấy bác sĩ từ doctorId
        Doctor d = doctorDAO.getDoctorById(doctorId, doctors);
        if (d == null) {
            response.getWriter().println("Doctor not found.");
            return; // Ngừng xử lý nếu không tìm thấy bác sĩ
        }

        // Kiểm tra rating và chuyển đổi
        int rating = -1; // Giá trị mặc định cho rating
        String ratingStr = request.getParameter("rating");
        if (ratingStr != null && !ratingStr.isEmpty()) {
            try {
                rating = Integer.parseInt(ratingStr);
            } catch (NumberFormatException e) {
                response.getWriter().println("Invalid rating.");
                return; // Ngừng xử lý nếu rating không hợp lệ
            }
        }

        // Lấy comment từ form
        String comment = request.getParameter("feedback");
        if (comment == null || comment.trim().isEmpty()) {
            response.getWriter().println("Feedback comment is required.");
            return; // Ngừng xử lý nếu comment trống
        }

        // Tạo timestamp cho thời gian hiện tại
        Timestamp createdAt = new Timestamp(System.currentTimeMillis());

        // Khởi tạo đối tượng Feedback
        Feedback feedback = new Feedback();

        // Kiểm tra session và lấy thông tin người dùng
        if (session != null) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                int userId = user.getId();
                Patient p = doctorDAO.getPatientById(userId);
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
        boolean isAdded = doctorDAO.addFeedback(feedback);
        if (isAdded) {
            response.getWriter().println("Feedback submitted successfully.");
        } else {
            response.getWriter().println("Failed to submit feedback.");
        }
        request.getRequestDispatcher("/DoctorFeedbackServlet" ).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
