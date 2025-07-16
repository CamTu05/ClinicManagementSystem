/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Patient;

import Models.*;
import DAL.*;
import DTO.AppointmentDTO;
import DTO.PrescriptionDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;

/**
 *
 * @author admin
 */
public class PatientInformationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int patientId = Integer.parseInt(request.getParameter("patientId"));
        Patient p = PatientDAO.INSTANCE.getPatientById(patientId);
        String patientName = UserDAO.INSTANCE.getFullNameById(patientId);
        String gender = UserDAO.INSTANCE.getUserById(patientId).getGender();
        User user = UserDAO.INSTANCE.getUserById(patientId);
        int age = UserDAO.INSTANCE.getAgeByUser(UserDAO.INSTANCE.getUserById(patientId));
        Vector<AppointmentDTO> appointmentDTOs = AppointmentDAO.INSTANCE.loadAppointmentDTOByPatientId(patientId, "CONFIRMED");
        Vector<Appointment> appointments = AppointmentDAO.INSTANCE.getAppointmentsByPatientId(patientId, "COMPLETED");
        PrescriptionDTO prescriptionDTO = PrescriptionDAO.INSTANCE.loadLatestPrescriptionByPatientId(patientId);
        
        request.setAttribute("DoctorDAO", DoctorDAO.INSTANCE);
        request.setAttribute("user", user);
        request.setAttribute("gender", gender);
        request.setAttribute("age", age);
        request.setAttribute("patientName", patientName);
        request.setAttribute("patient", p);
        request.setAttribute("appointmentDTOs", appointmentDTOs);
        request.setAttribute("appointments", appointments);
        request.setAttribute("prescriptionDTO", prescriptionDTO);
        request.getRequestDispatcher("Views/Doctor/PatientView.jsp").forward(request, response);
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
