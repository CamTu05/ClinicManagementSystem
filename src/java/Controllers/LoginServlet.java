/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.UserDAO;
import Helpers.BCryptUtil;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String i = request.getParameter("input");
        String p = request.getParameter("password");

        User user = UserDAO.INSTANCE.getUserByInput(i);            // chỉ truy vấn DAO một lần
        String storedPassword = user != null ? user.getPasswordHash() : null;

        if (storedPassword != null && BCryptUtil.checkPassword(p, storedPassword)) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            int role = user.getRole(); // hoặc user.getRole(), tùy cấu trúc entity

            switch (role) {
                case 1:  // Admin
                    response.sendRedirect("HomePageServlet");
                    break;
                case 2:  // Bác sĩ
                    response.sendRedirect("DoctorDashboardServlet");
                    break;
                case 3:  // Khách hàng
                    response.sendRedirect("HomePageServlet");
                    break;
                case 4:  // Nhân viên CSKH
                    response.sendRedirect("HomePageServlet");
                    break;

                default: // Các role chưa hỗ trợ
                    response.sendRedirect("AccessDenied.jsp");
                    break;
            }

        } else {
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu chưa đúng!!!");
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
