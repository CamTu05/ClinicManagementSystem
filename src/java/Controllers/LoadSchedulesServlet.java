/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAL.DoctorDAO;
import DAL.SchedulesDAO;
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
public class LoadSchedulesServlet extends HttpServlet {
   


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        Integer idTable = null;
        if (idParam != null) {
            try {
                idTable = Integer.parseInt(idParam);
            } catch (NumberFormatException e) {
                idTable = null;
            }
        }

        String typeParam = request.getParameter("type");
        Integer typeDay = Integer.parseInt(typeParam);

        SchedulesDAO.INSTANCE.LoadSchedules();
        DoctorDAO.INSTANCE.LoadDoctor();
        SpecialtyDAO.INSTANCE.LoadSpecialty();
        UserDAO.INSTANCE.LoadUser();
        HttpSession session = request.getSession();

        session.setAttribute("idTable",idTable );
        session.setAttribute("typeDay",typeDay );

        session.setAttribute("daoSchedules", SchedulesDAO.INSTANCE);
        session.setAttribute("daoDoctor", DoctorDAO.INSTANCE);
        session.setAttribute("daoSpecialty", SpecialtyDAO.INSTANCE);
        session.setAttribute("daoUser", UserDAO.INSTANCE);


        request.getRequestDispatcher("/Views/Common/OtherItems/TimeTable.jsp").forward(request, response);
        
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
