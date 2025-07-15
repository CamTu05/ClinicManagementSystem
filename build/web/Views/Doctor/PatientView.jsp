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
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'Segoe UI', Arial, sans-serif;
                background: #f5f7fa;
            }

            .flex {
                display: flex;
                flex-wrap: wrap;
                gap: 24px;
            }

            .left-card {
                flex: 0 0 260px;
                background: #fff;
                border-radius: 14px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, .06);
                overflow: hidden;
            }

            .left-card .header {
                background: #fff;
                padding: 24px 22px 14px;
                border-bottom: 1px solid #f0f0f0;
            }

            .left-card h2 {
                font-size: 21px;
                line-height: 1.3;
                font-weight: 600;
                color: #0d1a26;
                text-align: center;
            }

            .left-card .subtitle {
                margin-top: 6px;
                font-size: 13.5px;
                color: #687076;
                text-align: center;
            }

            .info-section {
                padding: 18px 22px 24px;
            }

            .info-row {
                display: flex;
                justify-content: space-between;
                font-size: 14.5px;
                padding: 6px 0;
                border-bottom: 1px dashed #e3e7ed;
            }

            .info-row:last-of-type {
                border-bottom: none;
            }

            .info-label {
                color: #555d68;
            }

            .badge {
                display: inline-block;
                background: #1976d2;
                color: #fff;
                padding: 5px 14px;
                border-radius: 18px;
                font-size: 13px;
                font-weight: 500;
                margin-top: 14px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background: #fff;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 2px 8px rgba(0, 0, 0, .05);
            }

            caption {
                caption-side: top;
                font-size: 18px;
                font-weight: 600;
                text-align: left;
                padding: 12px 16px;
                background: #f8f9fb;
            }

            th,
            td {
                padding: 10px 14px;
                border: 1px solid #e0e0e0;
                font-size: 14.5px;
            }

            th {
                background: #f1f3f6;
                text-align: left;
            }

            @media (max-width: 991px) {
                .left-card {
                    flex: 1 1 100%;
                }
            }

            .benphai{
                padding-left: 40px;
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
                <div class="col-12 col-lg-9">
                    <div class="container benphai">
                        <div class="flex">

                            <!-- ==== CARD BÊN TRÁI ==== -->
                            <div class="left-card">
                                <!-- Header -->
                                <div class="header">
                                    <h2>${patientName}</h2>
                                    <div class="subtitle">#ID: ${patient.id} &nbsp;·&nbsp; ${gender}, ${age}&nbsp;tuổi</div>
                                </div>

                                <!-- Info -->
                                <div class="info-section">
                                    <div class="info-row">
                                        <span class="info-label">Nhóm máu:</span>
                                        <span>${patient.bloodType}</span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">Dị ứng:</span>
                                        <span>${patient.allergies}</span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">SĐT:</span>
                                        <span>${user.phone}</span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">Email:</span>
                                        <span>${user.email}</span>
                                    </div>

                                    <!-- Badge -->
                                    <span class="badge">Bảo hiểm BHYT</span>
                                </div>
                            </div>

                            <!-- ==== BẢNG CHI TIẾT BÊN PHẢI ==== -->
                            <div style="flex:1">
                                <!-- 1. Bệnh sử -->
                                <table>
                                    <caption>Tiền sử bệnh lý</caption>
                                    <tbody>
                                        <c:if test="${appointments.size()==0}">
                                            <tr>
                                                <td>Chưa có</td>
                                            </tr>
                                        </c:if>
                                        <c:forEach items="${appointments}" var="a">
                                            <tr>
                                                <td>${a.appointmentDay}</td>
                                                <td>${a.description}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                                <!-- 2. Đơn thuốc gần nhất -->
                                <table style="margin-top:22px">
                                    <caption>Đơn thuốc gần nhất (${prescriptionDTO.createdAt})</caption>
                                    <c:choose>
                                        <c:when test="${prescriptionDTO eq null}">
                                            <tbody>
                                                <tr><td>Chưa có</td></tr>
                                            </tbody>
                                        </c:when>
                                        <c:otherwise>
                                            <thead>
                                                <tr><th>Thuốc</th><th>Số lượng</th><th>Cách dùng</th></tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="medicine" items="${prescriptionDTO.medicines}">
                                                    <tr>
                                                        <td>${medicine.medicineName}</td>
                                                        <td>${medicine.quantity}</td>
                                                        <td>${medicine.usage}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>   
                                        </c:otherwise>
                                    </c:choose>
                                </table>

                                <!-- 3. Lịch hẹn tương lai -->
                                <table style="margin-top:22px">
                                    <caption>Lịch hẹn sắp tới</caption>
                                    <thead>
                                        <tr>
                                            <th>Ngày</th><th>Ca</th><th>Bác sĩ</th><th>Dịch vụ</th><th>Trạng thái</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${appointmentDTOs}" var="appointment">
                                            <tr>
                                                <td>${appointment.date}</td>
                                                <td>${appointment.shift}</td>
                                                <td>${DoctorDAO.getDoctorNameById(appointment.doctor.id)}</td>
                                                <td>${appointment.service}</td>
                                                <td style="color:#f57c00;font-weight:600">CONFIRMED</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                        </div>
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
