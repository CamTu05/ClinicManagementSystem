<%-- 
    Document   : Login
    Created on : Jul 9, 2025, 8:58:51 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Đăng nhập</title>
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
    </head>

    <body>
        <div class="boxed_wrapper">
            <%@ include file="Common/Header/DefaultHeader.jsp" %>
            <%@ include file="Common/Navbar/DefaultNavbar.jsp" %>
            <!--Start Preloader -->
            <div class="preloader"></div>
            <!--End Preloader --> 
            <!--Start breadcrumb area-->     
            <section class="breadcrumb-area" style="background-image: url(${pageContext.request.contextPath}/images/resources/breadcrumb-bg.jpg);">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="breadcrumbs">
                                <h1>Tài khoản</h1>
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
                                        <li><a href="index.html">Trang chủ</a></li>
                                        <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                                        <li class="active">Tài khoản</li>
                                    </ul>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--End breadcrumb area-->
            <!--Start login register area-->
            <section class="login-register-area">
                <div class="container">
                    <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12"></div>
                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                        <div class="form register">
                            <div class="sec-title">
                                <h1>Đăng ký tài khoản</h1>
                            </div>
                            <div class="row">
                                <form action="#">
                                    <div class="col-md-12">
                                        <div class="input-field">
                                            <input type="text" name="name" placeholder="Họ và tên *" required>
                                            <div class="icon-holder">
                                                <i class="fa fa-user" aria-hidden="true"></i>
                                            </div>
                                        </div>    
                                    </div> 
                                    <div class="col-md-12">
                                        <div class="input-field">
                                            <input type="email" name="email" placeholder="Email *"required>
                                            <div class="icon-holder">
                                                <i class="fa fa-envelope" aria-hidden="true"></i>
                                            </div>
                                        </div>    
                                    </div>
                                    <div class="col-md-12">
                                        <div class="input-field">
                                            <input type="password" name="password" placeholder="Mật khẩu" required>
                                            <div class="icon-holder">
                                                <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                                            </div>
                                        </div>    
                                    </div>
                                    <div class="col-md-12">
                                        <div class="input-field">
                                            <input type="password" name="password" placeholder="Nhập lại mật khẩu" required>
                                            <div class="icon-holder">
                                                <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                                            </div>
                                        </div>    
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-lg-5 col-md-3 col-sm-4 col-xs-12">
                                                <button class="thm-btn bgclr-1" type="submit">Đăng ký</button>
                                            </div>
                                        </div>   
                                    </div> 
                                </form>    
                            </div>
                        </div>    
                    </div>
                </div>
            </section>      
            <!--End Form-->
            <%@ include file="Common/Footer/DefaultFooter.jsp" %>
        </div>
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
