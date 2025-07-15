<%-- 
    Document   : PatientProfile
    Created on : Jul 11, 2025, 10:52:32 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            body {
                background: #f4f6f8;
                font-family: Arial, sans-serif;
            }

            .patient-card {
                max-width: 720px;
                margin: 50px auto;
                padding: 32px;
                border: 1px solid #ddd;
                border-radius: 12px;
                background: #fff;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            }

            .patient-card h2 {
                text-align: center;
                margin-bottom: 32px;
                color: #1976d2;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-label {
                font-weight: bold;
                color: #333;
            }

            .form-control[readonly] {
                background-color: #f9f9f9;
                color: #555;
            }
        </style>
    </head>
    <body>
        <%@ include file="../Common/Header/DefaultHeader.jsp" %>
        <%@ include file="../Common/Navbar/DefaultNavbar.jsp" %>

        <div class="patient-card">
            <h2>Thông Tin Bệnh Nhân</h2>

            <div class="row">
                <div class="col-md-6 form-group">
                    <label class="form-label">Họ tên</label>
                    <input type="text" class="form-control" value="Nguyễn Văn A" readonly>
                </div>
                <div class="col-md-6 form-group">
                    <label class="form-label">Giới tính</label>
                    <input type="text" class="form-control" value="Nam" readonly>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 form-group">
                    <label class="form-label">Số điện thoại</label>
                    <input type="text" class="form-control" value="0909123456" readonly>
                </div>
                <div class="col-md-6 form-group">
                    <label class="form-label">Ngày sinh</label>
                    <input type="text" class="form-control" value="1998-10-20" readonly>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 form-group">
                    <label class="form-label">Tên đăng nhập</label>
                    <input type="text" class="form-control" value="nguyenvana" readonly>
                </div>
                <div class="col-md-6 form-group">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" value="vana@example.com" readonly>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Địa chỉ</label>
                <input type="text" class="form-control" value="123 Đường ABC, Quận 1, TP.HCM" readonly>
            </div>

            <div class="row">
                <div class="col-md-6 form-group">
                    <label class="form-label">Nhóm máu</label>
                    <input type="text" class="form-control" value="O+" readonly>
                </div>
                <div class="col-md-6 form-group">
                    <label class="form-label">Dị ứng</label>
                    <input type="text" class="form-control" value="Phấn hoa" readonly>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Tiền sử bệnh</label>
                <textarea class="form-control" rows="3" readonly>Tiểu đường type 2, huyết áp cao</textarea>
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
