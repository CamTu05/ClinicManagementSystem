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
import java.time.LocalTime;
import java.util.Vector;
import java.sql.Time;

/**
 *
 * @author Admin
 */
public class MyDoctorSchedule extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession ses = req.getSession();
        User user = (User) ses.getAttribute("user");
        Doctor doctor = DoctorDAO.INSTANCE.getDoctorById(user.getId());
        
        Vector<Schedule> schedules = ScheduleDAO.INSTANCE.loadScheduleByDoctorId(user.getId());

        req.setAttribute("DoctorDAO", DoctorDAO.INSTANCE);
        req.setAttribute("doctor", doctor);
        req.setAttribute("schedules", schedules);
        req.getRequestDispatcher("/Views/Doctor/MyDoctorSchedule.jsp")
                .forward(req, resp);
    }

    /* ----- POST: ghi + PRG ----- */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession ses = req.getSession();
        User user = (User) ses.getAttribute("user");
        Doctor doctor = DoctorDAO.INSTANCE.getDoctorById(user.getId());

        String action = req.getParameter("action");
        if (action != null && !action.isEmpty()) {

            /* XÓA */
            if (action.startsWith("delete_")) {
                int id = Integer.parseInt(action.substring("delete_".length()));
                ScheduleDAO.INSTANCE.deleteScheduleById(id);
            } /* CẬP NHẬT */ else if (action.startsWith("update_")) {
                int id = Integer.parseInt(action.substring("update_".length()));
                int weekday = Integer.parseInt(req.getParameter("weekday_" + id));
                String shift = req.getParameter("shift_" + id);

                LocalTime[] t = toRange(shift);  // [start,end]
                ScheduleDAO.INSTANCE.updateSchedule(id, weekday, t[0], t[1]);
            } /* THÊM MỚI */ else if ("insert".equals(action)) {
                int weekday = Integer.parseInt(req.getParameter("newWeekday"));
                String shift = req.getParameter("newShift");

                LocalTime[] t = toRange(shift);
                ScheduleDAO.INSTANCE.addSchedule(doctor.getId(), weekday, t[0], t[1]);
            }
        }

        /* PRG: redirect để tránh gửi lại khi F5 */
        resp.sendRedirect(req.getContextPath() + "/MyDoctorSchedule");
    }

    /* Trả mảng [start,end] theo ca */
    private LocalTime[] toRange(String shift) {
        return "AFTERNOON".equals(shift)
                ? new LocalTime[]{LocalTime.of(13, 0), LocalTime.of(17, 0)}
                : new LocalTime[]{LocalTime.of(8, 0), LocalTime.of(12, 0)};
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
