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
            .schedule-table {
                width: 100%;
                border-collapse: collapse;
                margin: 30px 0;
                font-family: 'Segoe UI', sans-serif;
                box-shadow: 0 2px 8px rgba(0,0,0,0.05);
                border-radius: 8px;
                overflow: hidden;
            }

            .schedule-table thead {
                background-color: #1d9add;
                color: white;
            }

            .schedule-table th, .schedule-table td {
                padding: 12px 16px;
                text-align: center;
            }

            .schedule-table tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .schedule-table select {
                padding: 6px 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 100%;
                font-size: 14px;
            }

            .schedule-table button {
                padding: 6px 12px;
                background-color: #e74c3c;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background 0.2s ease;
            }

            .schedule-table button:hover {
                background-color: #c0392b;
            }
        </style>

    </head>
    <body>

        <div class="main-wrapper">
            <%@ include file="../Common/Header/DashboardHeader.jsp" %>
            <%@ include file="../Common/Navbar/DoctorNavbar.jsp" %>
        </div>

        <div class="container-fluid">
            <div class="row g-0">
                <!-- Cột trống (bên trái) chiếm 3/12 -->
                <div class="col-12 col-lg-2"></div>

                <!-- Container bên phải chiếm 9/12 -->
                <div class="col-12 col-lg-9">
                    <div class="p-4">
                        <div style="margin-left: 10px">
                            <h4 class="fw-bold mb-0">Doctor Dashboard</h4>
                        </div>
                        <!-- MyDoctorSchedule.jsp -->
                        <form id="scheduleForm" action="${pageContext.request.contextPath}/MyDoctorSchedule" method="post">
                            <table class="schedule-table">
                                <thead>
                                    <tr><th>#</th><th>📅 Thứ</th><th>⏰ Ca</th><th>🛠️</th></tr>
                                </thead>
                                <tbody>
                                    <!---- Danh sách lịch hiện có -->

                                    <c:forEach var="sch" items="${schedules}" varStatus="st">
                                        <tr>
                                            <!-- STT -->
                                            <td>${st.index + 1}</td>

                                            <!-- THỨ -->
                                            <td>
                                                <select name="weekday_${sch.id}">
                                                    <c:set var="w" value="${sch.weekday}" />
                                                    <option value="1" ${w==1?'selected':''}>Thứ&nbsp;2 ${schedules.size()}</option>
                                                    <option value="2" ${w==2?'selected':''}>Thứ&nbsp;3</option>
                                                    <option value="3" ${w==3?'selected':''}>Thứ&nbsp;4</option>
                                                    <option value="4" ${w==4?'selected':''}>Thứ&nbsp;5</option>
                                                    <option value="5" ${w==5?'selected':''}>Thứ&nbsp;6</option>
                                                    <option value="6" ${w==6?'selected':''}>Thứ&nbsp;7</option>
                                                    <option value="0" ${w==0?'selected':''}>Chủ&nbsp;nhật</option>
                                                </select>
                                            </td>

                                            <!-- CA -->
                                            <td>
                                                <select name="shift_${sch.id}"> 
                                                    <c:set var="shift"
                                                           value="${sch.startTime lt '12:00:00' ? 'MORNING' : 'AFTERNOON'}" />
                                                    <option value="MORNING"  ${shift=='MORNING' ? 'selected' : ''}>
                                                        Sáng&nbsp;(08–12h)
                                                    </option>
                                                    <option value="AFTERNOON" ${shift=='AFTERNOON' ? 'selected' : ''}>
                                                        Chiều&nbsp;(13–17h)
                                                    </option>
                                                </select>
                                            </td>

                                            <!-- XÓA -->
                                            <td>
                                                <button class="btn-delete" type="submit"
                                                        name="action" value="delete_${sch.id}">
                                                    Xóa
                                                </button>
                                                <button class="btn-delete" type="submit"
                                                        name="action" value="update_${sch.id}">
                                                    Cập nhật
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    <!---- Hàng thêm mới -->
                                    <tr>
                                        <td>+</td>
                                        <td>
                                            <select name="newWeekday" required>
                                                <option value="" disabled selected>Chọn thứ</option>
                                                <option value="1">Thứ 2</option><option value="2">Thứ 3</option>
                                                <option value="3">Thứ 4</option><option value="4">Thứ 5</option>
                                                <option value="5">Thứ 6</option><option value="6">Thứ 7</option>
                                                <option value="0">CN</option>
                                            </select>
                                        </td>
                                        <td>
                                            <select name="newShift" required>
                                                <option value="" disabled selected>Chọn ca</option>
                                                <option value="MORNING">Sáng (08-12)</option>
                                                <option value="AFTERNOON">Chiều (13-17)</option>
                                            </select>
                                        </td>
                                        <td>
                                            <button type="submit" name="action" value="insert">Thêm</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                            
                        <script>
                            document.addEventListener('DOMContentLoaded', () => {
                                const form = document.getElementById('scheduleForm');
                                const weekdayNewEl = form.querySelector('[name="newWeekday"]');
                                const shiftNewEl = form.querySelector('[name="newShift"]');

                                // Hàm tiện ích đặt / gỡ required + bật tắt noValidate
                                function toggleRequired(isInsert) {
                                    if (isInsert) {
                                        form.noValidate = false;               // bật validation
                                        weekdayNewEl.setAttribute('required', '');
                                        shiftNewEl.setAttribute('required', '');
                                    } else {
                                        form.noValidate = true;                // tắt validation cho toàn form
                                        weekdayNewEl.removeAttribute('required');
                                        shiftNewEl.removeAttribute('required');
                                    }
                                }

                                // Lắng nghe mỗi lần bấm nút submit
                                form.querySelectorAll('button[type="submit"]').forEach(btn => {
                                    btn.addEventListener('click', () => {
                                        const isInsert = btn.value === 'insert';
                                        toggleRequired(isInsert);              // xử lý ngay trước khi browser validate
                                    });
                                });
                            });
                        </script>



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
