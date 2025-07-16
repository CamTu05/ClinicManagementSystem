/*
* Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
* Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
*/
package Controllers;

import DAL.SpecialtyDAO;
import DAL.AppointmentBooking;
import Models.Service;
import java.io.IOException;
import java.util.Vector;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
*
* @author SONHA
*/
public class LoadSpecialtyServlet extends HttpServlet {

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

try {
// Load specialty data
SpecialtyDAO.INSTANCE.LoadSpecialty();

// Load services data để cung cấp cho form đặt lịch
Vector<Service> services = AppointmentBooking.INSTANCE.getAllServices();

// Set attributes cho JSP
HttpSession session = request.getSession();
session.setAttribute("daoSpecialty", SpecialtyDAO.INSTANCE);
session.setAttribute("services", services);

// Forward to homepage
request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);

} catch (Exception e) {
e.printStackTrace();
}
}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
doGet(request, response);
}

@Override
public String getServletInfo() {
return "Load specialty and services data for homepage";
}
}