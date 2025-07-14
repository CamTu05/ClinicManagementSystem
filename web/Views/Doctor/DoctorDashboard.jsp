<%-- 
    Document   : DoctorDashboard
    Created on : Jul 13, 2025, 5:05:25 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> %>
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

        <link rel="stylesheet" href="css/doctorDashboardStyle.css"/>

    </head>
    <body>

        <div class="main-wrapper">
            <%@ include file="../Common/Header/DashboardHeader.jsp" %>
            <%@ include file="../Common/Navbar/DoctorNavbar.jsp" %>
        </div>

        <br/>
        <div class="container-fluid">
            <div class="row g-0">
                <!-- Cột trống bên trái -->
                <div class="col-12 col-lg-3"></div>

                <!-- Cột chính bên phải -->
                <div class="col-12 col-lg-9" style="margin-left: -60px;">
                    <!-- Tiêu đề và nút -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4 class="fw-bold mb-0">Doctor Dashboard</h4>
                        <div class="d-flex gap-2">
                            <button class="btn btn-primary fw-medium">+ New Appointment</button>
                            <button class="btn btn-outline-secondary fw-medium">
                                <i class="ti ti-calendar-check me-1"></i> Schedule Availability
                            </button>
                        </div>
                    </div>
                    <br/>

                    <!-- Các card thống kê -->
                    <div class="row g-4">
                        <!-- Card 1: Total Appointments -->
                        <div class="col-12 col-md-6 col-xl-4 d-flex">
                            <div class="card flex-fill w-100">
                                <div class="dashboard-wrapper">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <div>
                                                <p class="mb-1">Total Appointments</p>
                                                <div class="d-flex align-items-center gap-1">
                                                    <h3 class="fw-bold mb-0">658</h3>
                                                    <span class="badge bg-success fw-medium">+95%</span>
                                                </div>
                                            </div>
                                            <span class="avatar border border-primary text-primary rounded-2">
                                                <i class="ti ti-calendar-heart fs-20"></i>
                                            </span>
                                        </div>

                                        <div class="d-flex align-items-center">   <!-- đổi align-items-end → center -->
                                            <div id="s-col-5" class="chart-set me-2"></div>   <!-- thêm margin-end -->

                                            <span class="badge badge-soft-success fw-medium me-2">
                                                +21% <i class="ti ti-arrow-up ms-1"></i>
                                            </span>

                                            <p class="fs-13 mb-0 text-nowrap">in last 7 Days</p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <!-- Card 2: Online Consultations -->
                        <div class="col-12 col-md-6 col-xl-4 d-flex">
                            <div class="card flex-fill w-100">
                                <div class="dashboard-wrapper">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <div>
                                                <p class="mb-1">Online Consultations</p>
                                                <div class="d-flex align-items-center gap-1">
                                                    <h3 class="fw-bold mb-0">125</h3>
                                                    <span class="badge bg-danger fw-medium">-15%</span>
                                                </div>
                                            </div>
                                            <span class="avatar border border-danger text-danger rounded-2">
                                                <i class="ti ti-users fs-20"></i>
                                            </span>
                                        </div>

                                        <div class="d-flex align-items-center">
                                            <div id="s-col-6" class="chart-set me-2"></div>

                                            <span class="badge badge-soft-danger fw-medium me-2">
                                                +21% <i class="ti ti-arrow-down ms-1"></i>
                                            </span>

                                            <p class="fs-13 mb-0 text-nowrap">in last 7 Days</p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <!-- Card 3: Cancelled Appointments -->
                        <div class="col-12 col-md-6 col-xl-4 d-flex">
                            <div class="card flex-fill w-100">
                                <div class="dashboard-wrapper"> 
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <div>
                                                <p class="mb-1">Cancelled Appointments</p>
                                                <div class="d-flex align-items-center gap-1">
                                                    <h3 class="fw-bold mb-0">35</h3>
                                                    <span class="badge bg-success fw-medium">+45%</span>
                                                </div>
                                            </div>
                                            <span class="avatar border border-success text-success rounded-2">
                                                <i class="ti ti-versions fs-20"></i>
                                            </span>
                                        </div>

                                        <div class="d-flex align-items-center">
                                            <div id="s-col-7" class="chart-set me-2"></div>

                                            <span class="badge badge-soft-success fw-medium me-2">
                                                +31% <i class="ti ti-arrow-up ms-1"></i>
                                            </span>

                                            <p class="fs-13 mb-0 text-nowrap">in last 7 Days</p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div> <!-- end row -->
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
