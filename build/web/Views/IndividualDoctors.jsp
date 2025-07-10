<%-- 
    Document   : LanTT
    Created on : Jul 10, 2025, 2:00:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Doctors || Hospitals || Responsive HTML 5 Template</title>

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

        <!-- Fixing Internet Explorer-->
        <!--[if lt IE 9]>
            <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
            <script src="js/html5shiv.js"></script>
        <![endif]-->
    </head>
    <body style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0;">
        <%@ include file="/Views/Common/Header/DefaultHeader.jsp" %>
        <%@ include file="/Views/Common/Navbar/DefaultNavbar.jsp" %>

        <div style="display: flex; justify-content: center; align-items: center; margin: 20px; background-color: white; border-radius: 10px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); padding: 20px;">

            <div style="width: 200px; height: 200px; border-radius: 50%; overflow: hidden; border: 3px solid #ddd;">
                <img src="${pageContext.request.contextPath}/images/team/${doctor.picture}" alt="Doctor Picture" style="width: 100%; height: 100%; object-fit: cover;">
            </div>

            <div style="margin-left: 20px; flex: 1;">
                <h1 style="color: #2c3e50; font-size: 24px; margin-bottom: 10px;">${name}</h1>
                <p style="font-size: 18px; color: #7f8c8d; margin-bottom: 20px;">Years of Experience: ${doctor.yearsExp}</p>
                <p style="font-size: 16px; color: #34495e; margin-bottom: 20px;">
                    ${doctor.description}
                </p>
                <div style="background-color: #ecf0f1; padding: 10px; border-radius: 8px;">
                    <h3 style="font-size: 18px; color: #2c3e50;">Patient Feedback:</h3>
                    <ul style="list-style-type: none; padding-left: 0;">
                        <c:forEach var="fb" items="${feedback}">
                            <li style="font-size: 14px; color: #7f8c8d; margin-bottom: 10px;">${fb.comment}</li><br/>
                            <div style="font-size: 14px; color: #888; margin-top: 5px;">
                                <strong>Rating:</strong> ${fb.rating} / 5
                            </div>
                            <div style="font-size: 14px; color: #888;">
                                <strong>Created At:</strong> ${fb.createdAt}
                            </div>
                        </c:forEach>
                    </ul>
                </div>
            </div>

        </div>


        <%@ include file="/Views/Common/Footer/DefaultFooter.jsp" %>
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
