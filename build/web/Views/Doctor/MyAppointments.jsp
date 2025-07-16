<%-- 
    Document   : DoctorDashboard
    Created on : Jul 13, 2025, 5:05:25 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <!-- Meta Tags -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Doctor Dashboard - Medical & Hospital - Bootstrap 5 Admin Template</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="Dreams Technologies">

        <!-- Favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">

        <!-- Apple Icon -->
        <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/img/apple-icon.png">

        <!-- Theme Config Js -->
        <script src="${pageContext.request.contextPath}/assets/js/theme-script.js" type="1820bbd1b8b16c1ec3133fa7-text/javascript"></script>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

        <!-- Tabler Icon CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.min.css">

        <!-- Daterangepikcer CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

        <!-- Datetimepicker CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">

        <!-- Simplebar CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/simplebar/simplebar.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" id="app-style">

        <style>
            body          {
                font-family: Arial, sans-serif;
                background:#f4f6f8;
                margin:0;
                padding:24px;
            }
            h1            {
                color:#333;
                margin-bottom:16px;
                margin-left:50px;
            }

            /* Tabs / filter buttons */
            .tabs         {
                margin-left:50px;
                margin-bottom:12px;
                display:flex;
                gap:8px;
            }
            .tab-btn      {
                padding:8px 16px;
                border:none;
                border-radius:4px;
                cursor:pointer;
                background:#e0e0e0;
                color:#333;
                font-weight:600;
            }
            .tab-btn.active {
                background:#1976d2;
                color:#fff;
            }

            /* Table */
            .content-wrapper {
                margin-left:50px;
            }
            table         {
                width:100%;
                border-collapse:collapse;
                background:#fff;
                box-shadow:0 2px 8px rgba(0,0,0,.1);
            }
            th,td         {
                padding:12px 16px;
                border:1px solid #e0e0e0;
                text-align:left;
            }
            th            {
                background:#1976d2;
                color:#fff;
                white-space:nowrap;
            }
            tr:hover      {
                background:#f1f1f1;
            }

            /* Status colors */
            .status-ok    {
                color:#2e7d32;
                font-weight:bold;
            }
            .status-pend  {
                color:#ff9800;
                font-weight:bold;
            }
            .status-canc  {
                color:#d32f2f;
                font-weight:bold;
            }
            .status-done  {
                color:#1565c0;
                font-weight:bold;
            }

            .tabs {
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .tabs .tab-btn:first-of-type {
                margin-left: auto;
            }

        </style>

    </head>
    <body>

        <div class="main-wrapper">
            <%@ include file="../Common/Header/DashboardHeader.jsp" %>
            <%@ include file="../Common/Navbar/DoctorNavbar.jsp" %>
        </div>
        <br/>

        <div class="container-fluid">
            <div class="row g-0">
                <!-- Cột trống (bên trái) chiếm 3/12 -->
                <div class="col-12 col-lg-2"></div>

                <!-- Container bên phải chiếm 9/12 -->
                <div class="col-12 col-lg-9 right-content">
                    <div class="tabs">
                        <form action="MyAppointmentsServlet" method="POST">
                            <h1>Lịch hẹn của tôi</h1>
                            <input type="hidden" name="doctorId"  value="${doctor.id}">
                            <button type="submit" name="btnFilter" value="All" class="tab-btn ${currentFilter eq 'All' ? 'active' : ''}" data-filter="all">Tất cả</button>
                            <button type="submit" name="btnFilter" value="upcoming" class="tab-btn ${currentFilter eq 'upcoming' ? 'active' : ''}" data-filter="upcoming">Sắp tới</button>
                            <button type="submit" name="btnFilter" value="pending" class="tab-btn ${currentFilter eq 'pending' ? 'active' : ''}" data-filter="pending">Chờ xác nhận</button>
                            <button type="submit" name="btnFilter" value="finished" class="tab-btn ${currentFilter eq 'finished' ? 'active' : ''}" data-filter="completed">Đã hoàn thành</button>
                            <button type="submit" name="btnFilter" value="cancelled" class="tab-btn ${currentFilter eq 'cancelled' ? 'active' : ''}" data-filter="cancelled">Đã hủy</button>
                        </form>
                    </div>

                    <div class="content-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Bệnh nhân</th>
                                    <th>Ngày sinh</th>
                                    <th>Lý do khám</th>
                                    <th>Ngày</th>
                                    <th>Ca</th>     <!-- 🔄 changed -->
                                    <th>Trạng thái</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dto" items="${appointmentDTOs}" varStatus="st">

                                    <!-- CONFIRMED -->
                                    <c:if test="${dto.status eq 'CONFIRMED'}">
                                        <tr data-status="upcoming">
                                            <td>${st.index + 1}</td>
                                            <td>
                                                <a href="<c:url value='/PatientInformationServlet'>
                                                       <c:param name='patientId' value='${dto.patient.id}'/>
                                                   </c:url>"
                                                   style="color:#1976d2; text-decoration:none; font-weight:600;">
                                                    ${dto.patientName}
                                                </a>
                                            </td>
                                            <td>${dto.patientDob}</td>
                                            <td>${dto.service}</td>
                                            <td>${dto.date}</td>
                                            <td>${dto.shift}</td>   <!-- 🔄 changed -->
                                            <td class="status-ok">Đã xác nhận</td>
                                        </tr>
                                    </c:if>

                                    <!-- PENDING -->
                                    <c:if test="${dto.status eq 'PENDING'}">
                                        <tr data-status="pending">
                                            <td>${st.index + 1}</td>
                                            <td>
                                                <a href="<c:url value='/PatientInformationServlet'>
                                                       <c:param name='patientId' value='${dto.patient.id}'/>
                                                   </c:url>"
                                                   style="color:#1976d2; text-decoration:none; font-weight:600;">
                                                    ${dto.patientName}
                                            </td>
                                            <td>${dto.patientDob}</td>
                                            <td>${dto.service}</td>
                                            <td>${dto.date}</td>
                                            <td>${dto.shift}</td>
                                            <td class="status-pend">Chờ xác nhận</td>
                                        </tr>
                                    </c:if>

                                    <!-- COMPLETED -->
                                    <c:if test="${dto.status eq 'COMPLETED'}">
                                        <tr data-status="completed">
                                            <td>${st.index + 1}</td>
                                            <td>
                                                <a href="<c:url value='/PatientInformationServlet'>
                                                       <c:param name='patientId' value='${dto.patient.id}'/>
                                                   </c:url>"
                                                   style="color:#1976d2; text-decoration:none; font-weight:600;">
                                                    ${dto.patientName}
                                            </td>
                                            <td>${dto.patientDob}</td>
                                            <td>${dto.service}</td>
                                            <td>${dto.date}</td>
                                            <td>${dto.shift}</td>
                                            <td class="status-done">Hoàn thành</td>
                                        </tr>
                                    </c:if>

                                    <!-- CANCELLED -->
                                    <c:if test="${dto.status eq 'CANCELLED'}">
                                        <tr data-status="canceled">
                                            <td>${st.index + 1}</td>
                                            <td>
                                                <a href="<c:url value='/PatientInformationServlet'>
                                                       <c:param name='patientId' value='${dto.patient.id}'/>
                                                   </c:url>"
                                                   style="color:#1976d2; text-decoration:none; font-weight:600;">
                                                    ${dto.patientName}
                                            </td>
                                            <td>${dto.patientDob}</td>
                                            <td>${dto.service}</td>
                                            <td>${dto.date}</td>
                                            <td>${dto.shift}</td>
                                            <td class="status-canc">Đã hủy</td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
        </div>
    </body>
</html>
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js" type="text/javascript"></script>

<!-- Bootstrap Core JS -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js" type="text/javascript"></script>    

<!-- Simplebar JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/simplebar/simplebar.min.js" type="text/javascript"></script>

<!-- Chart JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/chart-data.js" type="text/javascript"></script>

<!-- Daterangepikcer JS -->
<script src="${pageContext.request.contextPath}/assets/js/moment.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

<!-- Datetimepicker JS -->
<script src="${pageContext.request.contextPath}/assets/js/moment.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script> 

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/script.js" type="text/javascript"></script>

<script src="../../cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js" data-cf-settings="1820bbd1b8b16c1ec3133fa7-|49" defer></script><script defer src="https://static.cloudflareinsights.com/beacon.min.js/vcd15cbe7772f49c399c6a5babf22c1241717689176015" integrity="sha512-ZpsOmlRQV6y907TI0dKBHq9Md29nnaEIPlkf84rnaERnq6zvWvPUqr2ft8M1aS28oN72PdrCzSjY4U6VaAw1EQ==" data-cf-beacon='{"rayId":"95de4d0c882ec5e8","version":"2025.6.2","serverTiming":{"name":{"cfExtPri":true,"cfEdge":true,"cfOrigin":true,"cfL4":true,"cfSpeedBrain":true,"cfCacheStatus":true}},"token":"3ca157e612a14eccbb30cf6db6691c29","b":1}' crossorigin="anonymous"></script>
