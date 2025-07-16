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
import java.util.Vector;

/**
 *
 * @author Admin
 */
public class DoctorListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Vector<Doctor> doctorList = DoctorDAO.INSTANCE.LoadAllDoctors();
        Vector<Specialty> specialties = SpecialtyDAO.INSTANCE.LoadAllSpecialtys();

        request.setAttribute("doctorList", doctorList);
        request.setAttribute("DoctorDAO", DoctorDAO.INSTANCE);
        request.setAttribute("specialties", specialties); 
        
        String specialty = request.getParameter("btnFilter");
        
        if (specialty != null && !specialty.isEmpty()) {
            if (specialty.equals("Toàn Bộ")) {
                doctorList = DoctorDAO.INSTANCE.LoadAllDoctors();
            } else {
                for (Specialty s : specialties) {
                    if (s.getSpecialtyName().equals(specialty)) {
                        doctorList = DoctorDAO.INSTANCE.LoadDoctorsBySpecialty(s.getId());
                        break;
                    }
                }
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
