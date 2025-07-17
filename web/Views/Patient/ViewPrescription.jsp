<%-- 
    Document   : ChangePassword
    Created on : Jul 13, 2025, 12:24:11 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lịch hẹn của tôi</title>
        <style>
            .simple-table {
                width: 80%;
                border-collapse: collapse;
                margin: 20px auto;
                font-family: Arial, sans-serif;
            }

            .simple-table th,
            .simple-table td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ddd;
            }

            .simple-table th {
                background-color: #0392ce;
                font-weight: bold;
                color: white;
            }

            .simple-table tr:nth-child(even) {
                background-color: #f9f9f9;
            }
        </style>
        <meta charset="UTF-8">
        <!-- responsive meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- For IE -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- master stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <!-- Responsive stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <!-- Extra stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mycss.css">
        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon/favicon-32x32.png" sizes="32x32">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon/favicon-16x16.png" sizes="16x16">

    </head>
    <body>
        <%@ include file="../Common/Header/DefaultHeader.jsp" %>
        <%@ include file="../Common/Navbar/DefaultNavbar.jsp" %>
        <div class="medical-record">
            <div class="record-header">
                <h2><i class="fas fa-file-medical"></i> Kết quả khám bệnh</h2>
                <p>Phòng khám ABC - Hệ thống quản lý y tế</p>
            </div>

            <div class="record-content">
                <!-- Thông tin cơ bản -->
                <div class="info-section">
                    <h3><i class="fas fa-info-circle"></i> Thông tin khám bệnh</h3>
                    <div class="info-grid">
                        <div class="info-label">Bệnh nhân:</div>
                        <div class="info-value">${sessionScope.user.fullname}</div>

                        <div class="info-label">Ngày sinh:</div>
                        <div class="info-value">${sessionScope.user.dob}</div>

                        <div class="info-label">Dịch vụ khám:</div>
                        <div class="info-value">${appointment.service.serviceName}</div>

                        <div class="info-label">Bác sĩ khám:</div>
                        <div class="info-value">BS. ${appointment.doctor.doctor.fullname}</div>

                        <div class="info-label">Ngày khám:</div>
                        <div class="info-value">${appointment.appointmentDay}</div>

                        <div class="info-label">Thời gian tạo kết quả:</div>
                        <div class="info-value">
                            <fmt:formatDate value="${pd.prescription.createdAt}" pattern="dd/MM/yyyy HH:mm:ss"/>
                        </div>
                    </div>
                </div>

                <!-- Ghi chú của bác sĩ -->
                <div class="notes-section">
                    <h3><i class="fas fa-stethoscope"></i> Ghi chú của bác sĩ</h3>
                    <div class="notes-content">
                        <c:choose>
                            <c:when test="${not empty pd.prescription.notes}">
                                ${pd.prescription.notes}
                            </c:when>
                            <c:otherwise>
                                <em>Không có ghi chú đặc biệt</em>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- Đơn thuốc -->
                <div class="info-section">
                    <h3><i class="fas fa-pills"></i> Đơn thuốc được kê</h3>
                    <c:choose>
                        <c:when test="${not empty pd.medicine}">
                            <div class="info-grid">
                                <div class="info-label">Tên thuốc:</div>
                                <div class="info-value">${pd.medicine.name}</div>

                                <div class="info-label">Số lượng:</div>
                                <div class="info-value">${pd.quantity} viên</div>

                                <div class="info-label">Cách dùng:</div>
                                <div class="info-value">${pd.usage}</div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="info-value">
                                <em>Không có thuốc được kê</em>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>


                <!-- Lưu ý cho bệnh nhân -->
                <div class="info-section">
                    <h3><i class="fas fa-exclamation-triangle"></i> Lưu ý quan trọng</h3>
                    <div class="info-value">
                        <ul style="margin-left: 20px;">
                            <li>Uống thuốc đúng liều lượng và thời gian theo chỉ dẫn</li>
                            <li>Không tự ý ngừng thuốc khi chưa hết liệu trình</li>
                            <li>Tái khám theo lịch hẹn của bác sĩ</li>
                            <li>Liên hệ ngay với bác sĩ nếu có triệu chứng bất thường</li>
                            <li>Bảo quản đơn thuốc và kết quả khám để tham khảo</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Nút thao tác -->
            <div class="action-buttons">
                <a href="printMedicalRecord?id=${medicalRecord.id}" class="btn btn-primary">
                    <i class="fas fa-print"></i> In kết quả
                </a>
                <a href="downloadPDF?id=${medicalRecord.id}" class="btn btn-success">
                    <i class="fas fa-download"></i> Tải PDF
                </a>
                <a href="rebookAppointment?doctorId=${appointment.doctor.id}" class="btn btn-secondary">
                    <i class="fas fa-calendar-plus"></i> Đặt lịch tái khám
                </a>
                <a href="viewAppointments" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Quay lại danh sách
                </a>
            </div>
        </div>

        <%@ include file="../Common/Footer/DefaultFooter.jsp" %>
        <!-- main jQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <!-- Wow Script -->
        <script src="${pageContext.request.contextPath}/js/wow.js"></script>
        <!-- bootstrap -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <!-- bx slider -->
        <script src="${pageContext.request.contextPath}/js/jquery.bxslider.min.js"></script>
        <!-- count to -->
        <script src="${pageContext.request.contextPath}/js/jquery.countTo.js"></script>
        <!-- owl carousel -->
        <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
        <!-- validate -->
        <script src="${pageContext.request.contextPath}/js/validation.js"></script>
        <!-- mixit up -->
        <script src="${pageContext.request.contextPath}/js/jquery.mixitup.min.js"></script>
        <!-- easing -->
        <script src="${pageContext.request.contextPath}/js/jquery.easing.min.js"></script>
        <!-- gmap helper -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHzPSV2jshbjI8fqnC_C4L08ffnj5EN3A"></script>
        <!--gmap script-->
        <script src="${pageContext.request.contextPath}/js/gmaps.js"></script>
        <script src="${pageContext.request.contextPath}/js/map-helper.js"></script>
        <!-- fancy box -->
        <script src="${pageContext.request.contextPath}/js/jquery.fancybox.pack.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.appear.js"></script>
        <!-- isotope script-->
        <script src="${pageContext.request.contextPath}/js/isotope.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script> 
        <script src="${pageContext.request.contextPath}/js/jquery.bootstrap-touchspin.js"></script>
        <!-- jQuery timepicker js -->
        <script src="${pageContext.request.contextPath}/assets/timepicker/timePicker.js"></script>
        <!-- Bootstrap select picker js -->
        <script src="${pageContext.request.contextPath}/assets/bootstrap-sl-1.12.1/bootstrap-select.js"></script>                               
        <!-- Bootstrap bootstrap touchspin js -->
        <!-- jQuery ui js -->
        <script src="${pageContext.request.contextPath}/assets/jquery-ui-1.11.4/jquery-ui.js"></script>
        <!-- Language Switche  -->
        <script src="${pageContext.request.contextPath}/assets/language-switcher/jquery.polyglot.language.switcher.js"></script>
        <!-- Html 5 light box script-->
        <script src="${pageContext.request.contextPath}/assets/html5lightbox/html5lightbox.js"></script>


        <!-- revolution slider js -->
        <script src="${pageContext.request.contextPath}/assets/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.video.min.js"></script>

        <!-- thm custom script -->
        <script src="${pageContext.request.contextPath}/js/custom.js"></script>


    </body>
</html>
