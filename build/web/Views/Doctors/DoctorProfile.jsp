<%-- 
    Document   : PatientProfile
    Created on : Jul 11, 2025, 10:52:32 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin cá nhân</title>
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
        <%@ include file="../Common/Header/DefaultHeader.jsp" %>
        <%@ include file="../Common/Navbar/DefaultNavbar.jsp" %>
        <form action="DoctorProfileServlet">
            <div class="account-form">
                <h2>Thông Tin Tài Khoản</h2>

                <!-- Họ tên + Giới tính -->
                <div class="form-row">
                    <div class="form-group">
                        <label for="fullname">Họ tên</label>
                        <input type="text" id="fullname" name="fullname" value="${sessionScope.user.fullname}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="gender">Giới tính</label>
                        <select id="gender" name="gender" disabled>
                            <option value="Nam" ${sessionScope.user.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                            <option value="Nữ" ${sessionScope.user.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                            <option value="" ${sessionScope.user.gender == null ? 'selected' : ''}>Không muốn tiết lộ</option>
                        </select>
                    </div>
                </div>

                <table class="schedule-table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>📅 Thứ</th>
                            <th>⏰ Ca làm</th>
                            <th>🛠️ Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="sch" items="${schedules}" varStatus="st">
                            <tr>
                                <!-- STT -->
                                <td>${st.index + 1}</td>
                                <!-- THỨ -->
                                <td>
                                    <select name="weekday_${sch.id}" disabled>
                                        <c:set var="w" value="${sch.weekday}" />
                                        <option value="1" ${w==1?'selected':''}>Thứ&nbsp;2 </option>
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
                                    <select name="shift_${sch.id}" disabled> 
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
                                            name="action" value="delete_${sch.id}" disabled>
                                        Xóa
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>

                        <tr>
                            <td>+</td>
                            <td>
                                <select name="newWeekday" disabled>
                                    <option disabled selected readonly>Chọn thứ</option>
                                    <option value="1">Thứ 2</option>
                                    <option value="2">Thứ 3</option>
                                    <option value="3">Thứ 4</option>
                                    <option value="4">Thứ 5</option>
                                    <option value="5">Thứ 6</option>
                                    <option value="6">Thứ 7</option>
                                    <option value="0">Chủ nhật</option>
                                </select>
                            </td>
                            <td>
                                <select name="newShift" disabled>
                                    <option disabled selected>Chọn ca</option>
                                    <option value="MORNING">Sáng (08–12h)</option>
                                    <option value="AFTERNOON">Chiều (13–17h)</option>
                                </select>
                            </td>
                            <td>
                                <button class="btn-insert" type="submit"
                                       <td>
                                          <name="action" value="insert_${sch.id}" disabled>
                                    Thêm
                                </button>
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>

                <!-- Số điện thoaại + Ngày sinh -->
                <div class="form-row">
                    <div class="form-group">
                        <label for="phone">Số điện thoại</label>
                        <input type="text" id="phone" name="phone" value="${sessionScope.user.phone}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="dob">Ngày sinh</label>
                        <input type="date" id="dob" name="dob" value="${sessionScope.user.dob}" readonly>
                    </div>
                </div>

                <!-- Username -->
                <div class="form-row">
                    <div class="form-group">
                        <label for="username">Tên đăng nhập</label>
                        <input type="text" id="username" name="username" value="${sessionScope.user.username}" readonly>
                    </div>
                </div>

                <!-- Email -->
                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" value="${sessionScope.user.email}" readonly>
                    </div>
                </div>

                <!-- Địa chỉ -->
                <div class="form-row">
                    <div class="form-group">
                        <label for="address">Địa chỉ</label>
                        <input type="text" id="address" name="address" value="${sessionScope.user.address}" readonly>
                    </div>
                </div>

                <!-- Nút sửa / cập nhật -->
                <div class="form-actions">
                    <button id="editBtn" name="action" type="button" value="update">Sửa</button>
                    <button id="updateBtn" name="action" type="submit" value="update" style="display:none;">Cập nhật</button>
                </div>
            </div>
        </form>
        <script>
            const editBtn = document.getElementById("editBtn");
            const updateBtn = document.getElementById("updateBtn");

            editBtn.addEventListener("click", function () {
                document.querySelectorAll("input, select").forEach(input => {
                    input.removeAttribute("readonly");
                    input.removeAttribute("disabled");
                });

                editBtn.style.display = "none";
                updateBtn.style.display = "inline-block";
            });
        </script>
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
