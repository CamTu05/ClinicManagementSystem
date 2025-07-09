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

        <!-- Fixing Internet Explorer-->
        <!--[if lt IE 9]>
            <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
            <script src="js/html5shiv.js"></script>
        <![endif]-->
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
                    <div class="col-md-3">
                        <ul class="nav nav-tabs tab-menu">
                            <li><a href="#" data-toggle="tab" onclick="myfun()">Toàn bộ</a></li>
                            <li><a href="#" data-toggle="tab" onclick="myfun()">Nội tổng quát</a></li>
                            <li><a href="#" data-toggle="tab" onclick="myfun()" >Tai - Mũi - Họng</a></li>
                            <li><a href="#" data-toggle="tab" onclick="myfun()" >Răng - Hàm - Mặt</a></li>
                            <li><a href="#" data-toggle="tab" onclick="myfun()">Sản phụ khoa</a></li>
                        </ul>
                    </div>
                    <!--<div class="col-md-9">
                                            <div class="row">
                                                <div class="col-md-4 text-center mb-4">
                                                    <img src="${pageContext.request.contextPath}/images/team/anhlh.jpg" class="img-fluid rounded" alt="Doctor 1">
                                                    <p class="font-weight-bold">Giles Franklin</p>
                                                    <p>Asst. Prof</p>
                                                </div>
                                                <div class="col-md-4 text-center mb-4">
                                                    <img src="${pageContext.request.contextPath}/images/team/bichhn.jpg" class="img-fluid rounded" alt="Doctor 2">
                                                    <p class="font-weight-bold">Edgar Denzil</p>
                                                    <p>Asso. Prof</p>
                                                </div>
                                                <div class="col-md-4 text-center mb-4">
                                                    <img src="${pageContext.request.contextPath}/images/team/chauvm.jpg" class="img-fluid rounded" alt="Doctor 3">
                                                    <p class="font-weight-bold">Garfield Feris</p>
                                                    <p>Sr Resident</p>
                                                </div>
                                            </div>
                    
                                            <div class="row">
                                                <div class="col-md-4 text-center mb-4">
                                                    <img src="${pageContext.request.contextPath}/images/team/dungnv.jpg" class="img-fluid rounded" alt="Doctor 4">
                                                    <p class="font-weight-bold">Marc Parcival</p>
                                                    <p>Sr Resident</p>
                                                </div>
                                                <div class="col-md-4 text-center mb-4">
                                                    <img src="${pageContext.request.contextPath}/images/team/hangpt.jpg" class="img-fluid rounded" alt="Doctor 5">
                                                    <p class="font-weight-bold">Alen Bailey</p>
                                                    <p>Asst. Prof</p>
                                                </div>
                                                <div class="col-md-4 text-center mb-4">
                                                    <img src="${pageContext.request.contextPath}/images/team/huybq.jpg" class="img-fluid rounded" alt="Doctor 6">
                                                    <p class="font-weight-bold">Basil Andrew</p>
                                                    <p>Asso. Prof</p>
                                                </div>
                                            </div>
                                                    
                                            <div class="row">
                                                <div class="col-md-4 text-center mb-4">
                                                    <img src="${pageContext.request.contextPath}/images/team/huyentt.jpg" class="img-fluid rounded" alt="Doctor 4">
                                                    <p class="font-weight-bold">Marc Parcival</p>
                                                    <p>Sr Resident</p>
                                                </div>
                                                <div class="col-md-4 text-center mb-4">
                                                    <img src="${pageContext.request.contextPath}/images/team/lamdv.jpg" class="img-fluid rounded" alt="Doctor 5">
                                                    <p class="font-weight-bold">Alen Bailey</p>
                                                    <p>Asst. Prof</p>
                                                </div>
                                                <div class="col-md-4 text-center mb-4">
                                                    <img src="${pageContext.request.contextPath}/images/team/lantt.jpg" class="img-fluid rounded" alt="Doctor 6">
                                                    <p class="font-weight-bold">Basil Andrew</p>
                                                    <p>Asso. Prof</p>
                                                </div>
                                            </div>
                                                    
                                            <div class="row">
                                                <div class="col-md-4 text-center mb-4">
                                                    <img src="${pageContext.request.contextPath}/images/team/minhdd.jpg" class="img-fluid rounded" alt="Doctor 4">
                                                    <p class="font-weight-bold">Marc Parcival</p>
                                                    <p>Sr Resident</p>
                                                </div>
                                            </div>
                                        </div>-->
                    <div class="col-md-9">
                        <div class="row">
                            <c:if test="${empty doctorList}">
                                <p>No doctors available.</p>
                            </c:if>
                            <c:forEach var="doctor" items="${doctorList}">
                                <div class="col-md-4 text-center mb-4">
                                    <img src="${pageContext.request.contextPath}/images/team/${doctor.picture}" class="img-fluid rounded" alt="${DoctorDao.getDoctorNameById(doctor.id)}">
                                    <p class="font-weight-bold">${doctor.doctor_name}</p>
                                    <p>${DoctorDao.getDoctorNameById(doctor.id)}</p>
                                </div>-->
                                <h1>${doctor.id}</h1>
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

        <script>
                                function myfun() {
                                    document.getElementById("btnFilter").click();
                                }
        </script>

        <!-- thm custom script -->
        <script src="js/custom.js"></script>
    </body>
</html>
