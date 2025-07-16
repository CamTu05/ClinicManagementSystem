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

        <%@ include file="../Common/Header/DashboardHeader.jsp" %>
        <%@ include file="../Common/Navbar/DoctorNavbar.jsp" %>

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
                                                <p class="mb-1">Tổng các lịch hẹn</p>
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

                                            <p class="fs-13 mb-0 text-nowrap">Trong 7 ngày qua</p>
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
                                                <p class="mb-1">Tư vấn trực tuyến</p>
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

                                            <p class="fs-13 mb-0 text-nowrap">Trong 7 ngày qua</p>
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
                                                <p class="mb-1">Lịch hẹn đã hủy</p>
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

                                            <p class="fs-13 mb-0 text-nowrap">Trong 7 ngày qua</p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div> <!-- end row -->
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>

                    <div class="row">

                        <!-- col start -->
                        <div class="col-xl-4 d-flex">
                            <!-- card start -->
                            <div class="card shadow-sm flex-fill w-100">
                                <div class="card-header d-flex align-items-center justify-content-between">
                                    <h5 class="fw-bold mb-0 text-truncate">Cuộc Hẹn Sắp Tới</h5> 
                                    <div class="dropdown">
                                        <a href="javascript:void(0);" class="btn btn-sm px-2 border shadow-sm btn-outline-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                            Hôm nay <i class="ti ti-chevron-down ms-1"></i>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a class="dropdown-item" href="#">Hôm nay</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="#">Tuần này</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="#">Tháng này</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex align-items-center mb-3">
                                        <a href="javascript:void(0);" class="avatar me-2 flex-shrink-0">
                                            <img src="${pageContext.request.contextPath}/img/hoada.jpg" alt="img" class="rounded-circle">
                                        </a>
                                        <div>
                                            <h6 class="fs-14 mb-1 text-truncate"><a href="javascript:void(0);" class="fw-semibold">Hoa Đà</a></h6>
                                            <p class="mb-0 fs-13 text-truncate">#Thần Y</p>
                                        </div>
                                    </div>
                                    <h6 class="fs-14 fw-semibold mb-1">Thăm bệnh tổng quát</h6>
                                    <div class="d-flex align-items-center gap-2 flex-wrap mb-3">
                                        <p class="mb-0 d-inline-flex align-items-center"><i class="ti ti-calendar-time text-dark me-1"></i>Monday, 31 Mar 2025</p>
                                        <p class="mb-0 d-inline-flex align-items-center"><i class="ti ti-clock text-dark me-1"></i>06:30 PM </p>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <h6 class="fs-13 fw-semibold mb-1">Phòng ban</h6>
                                            <p>Khoa Tim mạch</p>
                                        </div>
                                        <div class="col">
                                            <h6 class="fs-13 fw-semibold mb-1">Dịch vụ</h6>
                                            <p class="text-truncate">Tư vấn trực tuyến</p>
                                        </div>
                                    </div>
                                    <div class="my-3 border-bottom pb-3">
                                        <a href="javascript:void(0);" class="btn btn-primary w-100">Bắt đầu lịch hẹn</a>
                                    </div>
                                    <div class="d-flex align-items-center gap-2">
                                        <a href="javascript:void(0);" class="btn btn-dark w-100"><i class="ti ti-brand-hipchat me-1"></i>Trò chuyện ngay</a>
                                        <a href="javascript:void(0);" class="btn btn-outline-white w-100"><i class="ti ti-video me-1"></i>Tư vấn qua video</a>
                                    </div>                                
                                </div>
                            </div>
                            <!-- card end -->
                        </div>
                        <!-- col end -->

                        <!-- col start -->
                        <div class="col-xl-8 d-flex">
                            <!-- card start -->
                            <div class="card shadow-sm flex-fill w-100">
                                <div class="card-header d-flex align-items-center justify-content-between">
                                    <h5 class="fw-bold mb-0">Thống Kê Lịch Hẹn</h5> 
                                    <div class="dropdown">
                                        <a href="javascript:void(0);" class="btn btn-sm px-2 border shadow-sm btn-outline-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                            Theo Tháng <i class="ti ti-chevron-down ms-1"></i>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a class="dropdown-item" href="#">Theo Tháng</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="#">Theo Tuần</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="#">Theo Năm</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex align-items-center justify-content-end gap-2 mb-1 flex-wrap mb-3">
                                        <p class="mb-0 d-inline-flex align-items-center"><i class="ti ti-point-filled me-1 fs-18 text-primary"></i>Tổng Số Lịch Hẹn</p>
                                        <p class="mb-0 d-inline-flex align-items-center"><i class="ti ti-point-filled me-1 fs-18 text-success"></i>Lịch Hẹn Trực Tuyến</p>
                                    </div>
                                    <div class="chart-set" id="s-col-20"></div>
                                </div>
                            </div>
                            <!-- card end -->
                        </div>
                        <!-- col end -->
                    </div>
                    <!-- row end -->

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
