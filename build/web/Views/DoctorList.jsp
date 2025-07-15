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
            /* ===== Filter buttons ===== */
            .filter-list           {
                list-style:none;
                margin:0;
                padding:0;
            }
            .filter-item           {
                display:inline-block;
                width:200px;
                margin:5px;
                text-align:center;
            }
            .filter-item-bg        {
                background:#add8e6;
            }                 /* lightblue */
            .filter-btn            {
                width:100%;
                padding:10px 0;
                border:2px solid #000;
                border-radius:5px;
                background:transparent;
                color:#000;
                font-size:16px;
                cursor:pointer;
            }

            /* ===== Doctor cards ===== */
            .doc-col               {
                margin-bottom:30px;
                padding:15px;
            }
            .doc-card              {
                border:1px solid #ddd;
                border-radius:10px;
                background:#f9f9f9;
                padding:15px;
                box-shadow:0 4px 8px rgba(0,0,0,.1);
                transition:box-shadow .3s;
            }
            .doc-card:hover        {
                box-shadow:0 6px 14px rgba(0,0,0,.18);
            }

            .doc-img               {
                width:100%;
                height:auto;
                border-radius:10px;
                box-shadow:0 4px 8px rgba(0,0,0,.2);
                transition:transform .3s;
            }
            .doc-card:hover .doc-img {
                transform:scale(1.05);
            }

            .doc-link              {
                display:block;
                margin-top:10px;
                font-size:1.1em;
                font-weight:bold;
                color:#333;
                text-decoration:none;
                transition:color .3s, transform .3s;
            }
            .doc-link:hover        {
                color:#007bff;
                transform:translateY(-2px);
            }
        </style>
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

        <!--Start team area-->
        <section class="team-area doctor doctor-page-area">
            <div class="container">
                <div class="row">
                    <!-- FILTER -->
                    <div class="col-md-3">
                        <form action="DoctorListServlet" method="get">
                            <ul class="filter-list">
                                <li class="filter-item filter-item-bg">
                                    <input type="submit" name="btnFilter" value="Toàn Bộ" class="filter-btn"/>
                                </li><br/>
                                <c:forEach var="s" items="${specialties}">
                                    <li class="filter-item filter-item-bg">
                                        <input type="submit" name="btnFilter" value="${s.specialtyName}" class="filter-btn"/>
                                    </li><br/>
                                </c:forEach>
                            </ul>
                        </form>
                    </div>

                    <!-- DOCTOR GRID -->
                    <div class="col-md-9">
                        <div class="row">
                            <c:forEach var="doctor" items="${doctorList}">
                                <div class="col-md-4 text-center mb-4 doc-col">
                                    <div class="doc-card">
                                        <img src="${pageContext.request.contextPath}/images/team/${doctor.picture}"
                                             alt="${DoctorDAO.getDoctorNameById(doctor.id)}"
                                             class="doc-img">
                                        <a href="${pageContext.request.contextPath}/DoctorIndividualServlet?doctorId=${doctor.id}"
                                           class="doc-link">
                                            ${DoctorDAO.getDoctorNameById(doctor.id)}
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End team area--> 

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

        <script>
            function filterToanBo() {
                document.getElementById("filterToanBo").click();
            }
        </script>
        <script>
            function filterNoiTongQuat() {
                document.getElementById("filterNoiTongQuat").click();
            }
        </script>
        <script>
            function filterTaiMuiHong() {
                document.getElementById("filterTaiMuiHong").click();
            }
        </script>
        <script>
            function filterRangHamMat() {
                document.getElementById("filterRangHamMat").click();
            }
        </script>
        <script>
            function filterSanPhuKhoa() {
                document.getElementById("filterSanPhuKhoa").click();
            }
        </script>

    </body>
</html>
