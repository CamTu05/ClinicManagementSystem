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
        request.setAttribute("DoctorDAO", doctorDAO);
        String specialty = request.getParameter("btnFilter");
        if (specialty != null && !specialty.isEmpty()){
            if(specialty.equals("Toàn Bộ")){
                doctorList = doctorDAO.LoadAllDoctors();
            }else if (specialty.equals("Nội Tổng Quát")) {
                doctorList = doctorDAO.LoadDoctorsBySpecialty(1);
            }else if (specialty.equals("Tai Mũi Họng")) {
                doctorList = doctorDAO.LoadDoctorsBySpecialty(2);
            }else if (specialty.equals("Răng Hàm Mặt")) {
                doctorList = doctorDAO.LoadDoctorsBySpecialty(3);
            }else if (specialty.equals("Sản Phụ Khoa")) {
                doctorList = doctorDAO.LoadDoctorsBySpecialty(4); 
            }
        }
        request.setAttribute("doctorList", doctorList);
        request.getRequestDispatcher("/Views/DoctorList.jsp").forward(request, response);
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
