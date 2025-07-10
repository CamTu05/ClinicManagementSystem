<%-- 
    Document   : Feedback
    Created on : Jul 10, 2025, 3:39:07 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <style>
            #flip{
                transform: scaleX(-1);
                transform-origin: center;
            }
            
            /* Ẩn các nút radio */
            .rating input[type="radio"] {
                display: none;
            }

            /* Thiết lập kiểu cho các ngôi sao */
            .rating label {
                font-size: 24px;
                cursor: pointer;
                color: #ccc; /* Màu mặc định */
                transition: color 0.3s ease;
            }

            /* Khi hover hoặc chọn ngôi sao */
            .rating label:hover,
            .rating input[type="radio"]:checked + label,
            .rating input[type="radio"]:checked + label + label,
            .rating input[type="radio"]:checked + label + label + label,
            .rating input[type="radio"]:checked + label + label + label + label,
            .rating input[type="radio"]:checked ~ label {
                color: #ff9800; /* Màu vàng khi chọn */
            }

            /* Đảm bảo rằng các ngôi sao trước ngôi sao đã chọn sáng lên */
            .rating input[type="radio"]:checked ~ label {
                color: #ff9800;
            }

        </style>
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
    <body>
        <div style="padding-bottom: 20px;">
            <%@ include file="/Views/Common/Header/DefaultHeader.jsp" %>
            <%@ include file="/Views/Common/Navbar/DefaultNavbar.jsp" %>
        </div>


        <h2 style="text-align: center; font-size: 24px; margin-bottom: 20px; color: #333; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);">Feedback Form</h2>

        <form action="${pageContext.request.contextPath}/DoctorFeedbackServlet" method="post" enctype="multipart/form-data" style="max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f9f9f9; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
            <label for="doctor" style="font-weight: bold; font-size: 16px; color: #555; margin-bottom: 5px; display: inline-block;">Choose Doctor:</label>
            <select id="doctor" name="doctor" required style="width: 100%; padding: 8px; margin-bottom: 15px; border-radius: 5px; border: 1px solid #ccc; box-sizing: border-box;">
                <c:forEach var="d" items="${doctorList}" varStatus="status">
                    <option value="${d.id}" style="padding: 5px;">${doctorName[status.index]}</option>
                </c:forEach>
            </select>
            <br><br>
            
            <!-- Name and Age (same row) -->
            <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
                <div style="flex: 1; padding-right: 10px;">
                    <label for="name" style="font-weight: bold; font-size: 16px; color: #555; margin-bottom: 5px; display: inline-block;">Your Name:</label>
                    <input type="text" id="name" name="name" required style="width: 100%; padding: 8px; border-radius: 5px; border: 1px solid #ccc; box-sizing: border-box;" />
                </div>
                <div style="flex: 1; padding-left: 10px;">
                    <label for="age" style="font-weight: bold; font-size: 16px; color: #555; margin-bottom: 5px; display: inline-block;">Your Age:</label>
                    <input type="number" id="age" name="age" required style="width: 100%; padding: 8px; border-radius: 5px; border: 1px solid #ccc; box-sizing: border-box;" />
                </div>
            </div>

            <!-- Phone and Email (same row) -->
            <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
                <div style="flex: 1; padding-right: 10px;">
                    <label for="phone" style="font-weight: bold; font-size: 16px; color: #555; margin-bottom: 5px; display: inline-block;">Your Phone Number:</label>
                    <input type="tel" id="phone" name="phone" required style="width: 100%; padding: 8px; border-radius: 5px; border: 1px solid #ccc; box-sizing: border-box;" />
                </div>
                <div style="flex: 1; padding-left: 10px;">
                    <label for="email" style="font-weight: bold; font-size: 16px; color: #555; margin-bottom: 5px; display: inline-block;">Your Email:</label>
                    <input type="email" id="email" name="email" required style="width: 100%; padding: 8px; border-radius: 5px; border: 1px solid #ccc; box-sizing: border-box;" />
                </div>
            </div>

            <!-- Feedback Text -->
            <label for="feedback" style="font-weight: bold; font-size: 16px; color: #555; margin-bottom: 5px; display: inline-block;">Your Feedback:</label><br>
            <textarea id="feedback" name="feedback" rows="4" cols="50" placeholder="Write your feedback here..." required style="width: 100%; padding: 8px; margin-bottom: 15px; border-radius: 5px; border: 1px solid #ccc; box-sizing: border-box;"></textarea>
            <br><br>

            <!-- Rating -->
            <div id="flip" class="rating" style="display: flex; justify-content: space-between; width: 150px; margin-bottom: 15px;">
                <input type="radio" id="star1" name="rating" value="1" style="display: none;" />
                <label for="star1">☆</label>

                <input type="radio" id="star2" name="rating" value="2" style="display: none;" />
                <label for="star2">☆</label>

                <input type="radio" id="star3" name="rating" value="3" style="display: none;" />
                <label for="star3">☆</label>

                <input type="radio" id="star4" name="rating" value="4" style="display: none;" />
                <label for="star4">☆</label>

                <input type="radio" id="star5" name="rating" value="5" style="display: none;" />
                <label for="star5">☆</label>
            </div>


            <!-- Submit Button -->
            <input type="submit" value="Submit Feedback" style="background-color: #4CAF50; color: white; border: none; padding: 12px 20px; font-size: 16px; border-radius: 5px; cursor: pointer; width: 100%; transition: background-color 0.3s;" />

        </form>


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
