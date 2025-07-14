/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.DoctorControllers;

import DAL.DoctorDAO;
import DAL.ScheduleDAO;
import Models.Schedule;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class DoctorScheduleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<LocalTime, Map<Integer, StringBuilder>> table = new LinkedHashMap<>();

        for (Schedule slot : ScheduleDAO.INSTANCE.loadSchedules()) {

            int id = slot.getDoctor().getId();
            String name = DoctorDAO.INSTANCE.getDoctorNameById(id);

            String html = "<a href=\""
                    + request.getContextPath()
                    + "/DoctorIndividualServlet?doctorId=" + id + "\" "
                    + "class=\"doctor\">Dr&nbsp;" + name + "</a>";

            table.computeIfAbsent(slot.getStartTime(), t -> new HashMap<>())
                    .computeIfAbsent(slot.getWeekday(), w -> new StringBuilder())
                    .append(html).append("<br/>");
        }

        request.setAttribute("scheduleTable", table);
        request.getRequestDispatcher("/Views/DoctorSchedule.jsp").forward(request, response);
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
