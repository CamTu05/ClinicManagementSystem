<%-- 
    Document   : DoctorList
    Created on : Jul 9, 2025, 10:23:07 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Doctors || Hospitals || Responsive HTML 5 Template</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Inter:wght@400;600&display=swap" rel="stylesheet">

        <!-- responsive meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- For IE -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- master stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <!-- Responsive stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon/favicon-32x32.png" sizes="32x32">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon/favicon-16x16.png" sizes="16x16">

        <style>
            .schedule {
                overflow-x: auto;
                background: #fff;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-family: 'Inter', 'Segoe UI', 'Roboto', sans-serif;
                font-size: 14px;
                margin-bottom: 40px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            }

            .schedule table {
                width: 100%;
                border-collapse: collapse;
                min-width: 700px;
            }

            .schedule th,
            .schedule td {
                border: 1px solid #e3e6ea;
                padding: 8px 6px;
                text-align: center;
                vertical-align: middle;
            }

            .schedule thead th {
                background: #007bff;
                color: white;
                font-weight: 600;
                font-size: 14px;
                white-space: nowrap;
            }

            .schedule td.time {
                background: #f8f9fa;
                font-weight: bold;
                width: 70px;
            }

            .schedule .shift-title {
                background: #eef4ff;
                color: #004085;
                font-weight: 600;
                text-align: left;
                padding: 10px 8px;
                font-size: 15px;
                border-top: 2px solid #007bff;
            }

            .schedule th,
            .schedule td,
            .schedule .doctor,
            .schedule .shift-title {
                font-family: 'Inter', 'Segoe UI', 'Roboto', sans-serif;
            }

            .doctor {
                display: inline-block;
                background: #e7f1ff;
                color: #004085;
                border-radius: 4px;
                padding: 2px 6px;
                margin: 2px 0;
                font-size: 13px;
                white-space: nowrap;
            }

            .morning .doctor {
                background: #d1ecf1;
                color: #0c5460;
            }

            .afternoon .doctor {
                background: #fff3cd;
                color: #856404;
            }

            /* Responsive tweak */
            @media (max-width: 768px) {
                .schedule table {
                    font-size: 12px;
                    min-width: 600px;
                }

                .doctor {
                    font-size: 12px;
                }
            }
        </style>
        <!-- Fixing Internet Explorer-->
        <!--[if lt IE 9]>
            <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
            <script src="js/html5shiv.js"></script>
        <![endif]-->
    </head>
    <body>
        <div>
            <%@ include file="Common/Header/DefaultHeader.jsp" %>
            <%@ include file="Common/Navbar/DefaultNavbar.jsp" %>
        </div>

        <!--Start breadcrumb area-->  
        <section class="breadcrumb-area" style="background-image: url('${pageContext.request.contextPath}/images/resources/breadcrumb-bg.jpg');">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="breadcrumbs">
                            <h1>Our Doctors</h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="breadcrumb-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="left pull-left">
                                <ul>
                                    <li><a href="index.html">Home</a></li>
                                    <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                                    <li class="active">Doctors</li>
                                </ul>
                            </div>
                            <div class="right pull-right">
                                <a href="#">
                                    <span><i class="fa fa-share-alt" aria-hidden="true"></i>Share</span> 
                                </a>   
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End breadcrumb area-->
        <br/>

        <section class="doctor-schedule-section">
            <div class="container">
                <!-- Tiêu đề -->
                <div class="section-header text-center mb-4">
                    <h2 class="section-title">🗓️ Lịch làm việc bác sĩ</h2>
                    <p class="section-subtitle">Tuần 15 – 21 Tháng 7, 2025</p>
                </div>

                <div class="row">

                    <!-- Cột phải: bảng lịch -->
                    <div class="">
                        <div class="schedule shadow-sm rounded bg-white p-3 mb-4">
                            <table class="table table-bordered text-center">
                                <thead class="thead-dark">
                                    <tr>
                                        <th rowspan="2">Giờ</th>
                                        <th colspan="7">Thứ trong tuần</th>
                                    </tr>
                                    <tr>
                                        <th>CN</th><th>T2</th><th>T3</th><th>T4</th><th>T5</th><th>T6</th><th>T7</th>
                                    </tr>
                                </thead>

                                <!-- Ca sáng -->
                                <tbody class="morning">
                                    <tr class="table-info">
                                        <td colspan="8" class="text-left font-weight-bold">☀️ Ca sáng: 08:00 – 12:00</td>
                                    </tr>
                                    <c:forEach var="entry" items="${scheduleTable}">
                                        <c:if test="${entry.key >= '08:00' && entry.key < '12:00'}">
                                            <tr>
                                                <td class="time">${entry.key}</td>
                                                <c:forEach begin="0" end="6" var="d">
                                                    <td>
                                                        <c:out value="${entry.value[d] != null ? entry.value[d] : ''}" escapeXml="false"/>
                                                    </td>
                                                </c:forEach>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>

                                <!-- Ca chiều -->
                                <tbody class="afternoon">
                                    <tr class="table-warning">
                                        <td colspan="8" class="text-left font-weight-bold">🌤️ Ca chiều: 13:00 – 17:00</td>
                                    </tr>
                                    <c:forEach var="entry" items="${scheduleTable}">
                                        <c:if test="${entry.key >= '13:00' && entry.key < '17:00'}">
                                            <tr>
                                                <td class="time">${entry.key}</td>
                                                <c:forEach begin="0" end="6" var="d">
                                                    <td>
                                                        <c:out value="${entry.value[d] != null ? entry.value[d] : ''}" escapeXml="false"/>
                                                    </td>
                                                </c:forEach>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Gợi ý liên kết nhanh đến chi tiết bác sĩ -->
                        <div class="text-right">
                            <a href="${pageContext.request.contextPath}/DoctorList" class="btn btn-outline-secondary">
                                Xem danh sách bác sĩ →
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <%@ include file="Common/Footer/DefaultFooter.jsp" %>
        <!--Scroll to top-->
        <div class="scroll-to-top scroll-to-target" data-target="html"><span class="flaticon-triangle-inside-circle"></span></div>

        <!-- main jQuery -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <!-- Wow Script -->
        <script src="js/wow.js"></script>
        <!-- bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- bx slider -->
        <script src="js/jquery.bxslider.min.js"></script>
        <!-- count to -->
        <script src="js/jquery.countTo.js"></script>
        <!-- owl carousel -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- validate -->
        <script src="js/validation.js"></script>
        <!-- mixit up -->
        <script src="js/jquery.mixitup.min.js"></script>
        <!-- easing -->
        <script src="js/jquery.easing.min.js"></script>
        <!-- gmap helper -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHzPSV2jshbjI8fqnC_C4L08ffnj5EN3A"></script>
        <!--gmap script-->
        <script src="js/gmaps.js"></script>
        <script src="js/map-helper.js"></script>
        <!-- fancy box -->
        <script src="js/jquery.fancybox.pack.js"></script>
        <script src="js/jquery.appear.js"></script>
        <!-- isotope script-->
        <script src="js/isotope.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script> 
        <script src="js/jquery.bootstrap-touchspin.js"></script>
        <!-- jQuery timepicker js -->
        <script src="assets/timepicker/timePicker.js"></script>
        <!-- Bootstrap select picker js -->
        <script src="assets/bootstrap-sl-1.12.1/bootstrap-select.js"></script>                               
        <!-- Bootstrap bootstrap touchspin js -->
        <!-- jQuery ui js -->
        <script src="assets/jquery-ui-1.11.4/jquery-ui.js"></script>
        <!-- Language Switche  -->
        <script src="assets/language-switcher/jquery.polyglot.language.switcher.js"></script>
        <!-- Html 5 light box script-->
        <script src="assets/html5lightbox/html5lightbox.js"></script>


        <!-- revolution slider js -->
        <script src="assets/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.video.min.js"></script>

        <!-- thm custom script -->
        <script src="js/custom.js"></script>
    </body>
</html>
