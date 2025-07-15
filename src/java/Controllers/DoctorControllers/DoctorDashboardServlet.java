/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.DoctorControllers;

import DAL.DoctorDAO;
import DAL.ScheduleDAO;
import Models.Doctor;
import Models.Schedule;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalTime;
import java.util.Vector;

/**
 *
 * @author Admin
 */
public class DoctorDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        User user = (User) ses.getAttribute("user");
        Doctor doctor = DoctorDAO.INSTANCE.getDoctorById(user.getId());
        Vector<Schedule> schedules = ScheduleDAO.INSTANCE.loadScheduleByDoctorId(user.getId());
        request.setAttribute("schedules", schedules);
        request.setAttribute("doctor", doctor);
        request.setAttribute("DoctorDAO", DoctorDAO.INSTANCE);

        String action = request.getParameter("action");
        if (action != null && !action.isEmpty()) {

            if (action.startsWith("delete_")) {
                int id = Integer.parseInt(action.substring("delete_".length()));
                ScheduleDAO.INSTANCE.deleteScheduleById(id);

            } else if (action.startsWith("insert")) {
                int doctorId = doctor.getId();
                int weekday = Integer.parseInt(request.getParameter("newWeekday"));
                String caStr = request.getParameter("newShift");

                LocalTime startTime, endTime;
                if ("MORNING".equals(caStr)) {
                    startTime = LocalTime.of(8, 0);
                    endTime = LocalTime.of(12, 0);
                } else {
                    startTime = LocalTime.of(13, 0);
                    endTime = LocalTime.of(17, 0);
                }
                ScheduleDAO.INSTANCE.addSchedule(doctorId, weekday, startTime, endTime);

            } else if (action.startsWith("update")) {
                int doctorId = doctor.getId();
                int weekday = Integer.parseInt(request.getParameter("newWeekday"));
                String caStr = request.getParameter("newShift");

                LocalTime startTime, endTime;
                if ("MORNING".equals(caStr)) {
                    startTime = LocalTime.of(8, 0);
                    endTime = LocalTime.of(12, 0);
                } else {
                    startTime = LocalTime.of(13, 0);
                    endTime = LocalTime.of(17, 0);
                }
                ScheduleDAO.INSTANCE.updateSchedule(doctorId, weekday, startTime, endTime);
            }
        }
        schedules = ScheduleDAO.INSTANCE.loadScheduleByDoctorId(user.getId());
        request.setAttribute("DoctorDAO", DoctorDAO.INSTANCE);
        request.setAttribute("schedules", schedules);
        request.getRequestDispatcher("/Views/Doctor/DoctorDashboard.jsp").forward(request, response);
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
