package Controllers.Patient;

import DAL.AppointmentBooking;
import DAL.UserDAO;
import Models.Appointment;
import Models.Doctor;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CreateAppointment")
public class CreateAppointmentServlet extends HttpServlet {

    private final AppointmentBooking appointmentBooking = AppointmentBooking.INSTANCE;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Lấy thông tin từ form
            String serviceIdStr = request.getParameter("service");
            String doctorIdStr = request.getParameter("doctor");
            String dateStr = request.getParameter("date");
            String shift = request.getParameter("shift");
            String description = request.getParameter("description");

            // Validate dữ liệu đầu vào
            if (serviceIdStr == null || doctorIdStr == null || dateStr == null || shift == null
                    || serviceIdStr.trim().isEmpty() || doctorIdStr.trim().isEmpty()
                    || dateStr.trim().isEmpty() || shift.trim().isEmpty()) {

                // Set error message và forward
                request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin bắt buộc");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
                return;
            }

            // Parse dữ liệu
            int serviceId, doctorId;
            try {
                serviceId = Integer.parseInt(serviceIdStr);
                doctorId = Integer.parseInt(doctorIdStr);
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Dữ liệu không hợp lệ");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
                return;
            }

            // Parse ngày
            Date appointmentDate;
            try {
                appointmentDate = Date.valueOf(dateStr);
            } catch (IllegalArgumentException e) {
                request.setAttribute("errorMessage", "Ngày không hợp lệ");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
                return;
            }

            // Kiểm tra ngày không được trong quá khứ
            if (appointmentDate.before(new Date(System.currentTimeMillis()))) {
                request.setAttribute("errorMessage", "Không thể đặt lịch cho ngày đã qua");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
                return;
            }

            // Lấy thông tin user từ session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            if (user == null) {
                request.setAttribute("errorMessage", "Vui lòng đăng nhập để đặt lịch");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
                return;
            }

            // Kiểm tra bác sĩ có tồn tại không
            Doctor doctor = appointmentBooking.getDoctorById(doctorId);
            if (doctor == null) {
                request.setAttribute("errorMessage", "Bác sĩ không tồn tại");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
                return;
            }

            // Kiểm tra dịch vụ có tồn tại không
            if (appointmentBooking.getServiceById(serviceId) == null) {
                request.setAttribute("errorMessage", "Dịch vụ không tồn tại");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
                return;
            }

            // Kiểm tra bác sĩ có làm việc vào ngày đó không
            Calendar cal = Calendar.getInstance();
            cal.setTime(appointmentDate);
            int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK) - 1; // Chuyển về 0-6 (0 = Chủ nhật)

            if (!appointmentBooking.isDoctorWorkingOnDay(doctorId, dayOfWeek)) {
                request.setAttribute("errorMessage", "Bác sĩ không làm việc vào ngày này");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
                return;
            }

            // Kiểm tra bác sĩ có làm việc vào ca đó không
            if (!appointmentBooking.isDoctorWorkingOnShift(doctorId, dayOfWeek, shift)) {
                request.setAttribute("errorMessage", "Bác sĩ không làm việc vào ca này");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
                return;
            }

            // Kiểm tra ca có còn slot trống không
            if (!appointmentBooking.isShiftAvailable(doctorId, appointmentDate, shift)) {
                request.setAttribute("errorMessage", "Ca khám đã hết chỗ. Vui lòng chọn ca khác");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
                return;
            }

            // Tạo appointment object
            Appointment appointment = new Appointment();
            appointment.setUser(user); // Set user để lấy user.getId() cho patient_id
            appointment.setFullname(user.getFullname()); // Lấy tên từ user
            appointment.setPhone(user.getPhone()); // Lấy phone từ user
            appointment.setDob(user.getDob()); // Lấy ngày sinh từ user
            appointment.setGender(user.getGender()); // Lấy giới tính từ user
            appointment.setAddress(user.getAddress()); // Lấy địa chỉ từ user
            appointment.setDoctor(doctor);
            appointment.setServiceId(serviceId);
            appointment.setAppointmentDay(appointmentDate);
            appointment.setAppointmentShift(shift);
            appointment.setStatus("Pending"); // Trạng thái chờ xử lý
            appointment.setDescription(description != null ? description.trim() : "");

            // Lưu appointment vào database
            boolean success = appointmentBooking.addAppointment(appointment);

            if (success) {
                // Set success message và forward
                request.setAttribute("successMessage", "Đặt lịch khám thành công! Chúng tôi sẽ liên hệ với bạn sớm nhất.");
                request.setAttribute("messageType", "success");
                
                // Có thể set thêm thông tin appointment để hiển thị
                request.setAttribute("appointmentInfo", appointment);
                
                request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
            } else {
                // Set error message và forward
                request.setAttribute("errorMessage", "Không thể đặt lịch khám. Vui lòng thử lại sau");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Set error message và forward
            request.setAttribute("errorMessage", "Lỗi hệ thống: " + e.getMessage());
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method not supported");
    }
}
