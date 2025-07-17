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
        <table class="simple-table">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Dịch vụ</th> 
                    <th>Bác sĩ</th>
                    <th>Ngày khám</th>
                    <th>Buổi khám</th>
                    <th>Mô tả</th>
                    <th>Được tạo vào</th>
                    <th>Trạng thái</th>
                    <th>Xem hồ sơ</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="a" items="${appointments}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${a.service.serviceName}</td>
                        <td>${a.doctor.doctor.fullname}</td>
                        <td>${a.appointmentDay}</td>
                        <td>${a.appointmentShift}</td>
                        <td>${a.description}</td>
                        <td>${a.createdAt}</td>
                        <td>
                            <c:choose>
                                <c:when test="${a.status == 'COMPLETED'}">
                                    <span class="status-completed">Hoàn thành</span>
                                </c:when>
                                <c:when test="${a.status == 'CONFIRMED'}">
                                    <span class="status-pending">Chờ khám</span>
                                </c:when>
                                <c:when test="${a.status == 'PENDING'}">
                                    <span class="status-pending">Chờ khám</span>
                                </c:when>
                                <c:when test="${a.status == 'CANCELLED'}">
                                    <span class="status-cancelled">Đã hủy</span>
                                </c:when>
                            </c:choose>
                        </td>
                        <td class="action-cell">
                            <c:if test="${a.status == 'COMPLETED'}">
                                <a href="ViewPrescriptionServlet?appointmentId=${a.id}" 
                                   class="btn btn-primary btn-sm">
                                    <i class="fa fa-file-medical"></i> Xem hồ sơ
                                </a>
                            </c:if>
                            <c:if test="${a.status != 'COMPLETED'}">
                                <span class="text-muted">Chưa có</span>
                            </c:if>
                        </td>
                    </tr> 
                </c:forEach>
            </tbody>
        </table>



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
