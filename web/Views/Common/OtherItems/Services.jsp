<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <meta charset="UTF-8">
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
            <%@ include file="../Header/DefaultHeader.jsp" %>
            <%@ include file="../Navbar/DefaultNavbar.jsp" %>

            <!--Start departments single area-->
            <section id="departments-single-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 col-md-8 col-sm-12 col-xs-12 pull-right">  

   
                            <div class="pricing-box">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="single-box">
                                            <h3 class="text-center">Bảng dịch vụ </h3>
                                            <table class="table table-bordered text-center align-middle">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align:center; vertical-align:middle;">Tên dịch vụ</th>
                                                        <th style="text-align:center; vertical-align:middle;">Mô tả</th>
                                                        <th style="text-align:center; vertical-align:middle;">Giá</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${sessionScope.daoServices.service}" var="s">

                                                        <c:if test="${s.specialty.id == sessionScope.specId}">
                                                            
                                                            <tr>
                                                                <td>${s.serviceName}</td>
                                                                <td>${s.description}</td>
                                                                <td>${s.price}₫</td>
                                                            </tr>
                                                        </c:if>

                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div> 

                        </div> 

                        <div class="col-lg-3 col-md-4 col-sm-7 col-xs-12 pull-left">
                            <div class="departments-sidebar">
                                <!--Start single sidebar-->
                                <div class="single-sidebar">
                                    <div class="title">
                                        <h3>Chuyên khoa</h3>    
                                    </div>
                                    <ul class="all-departments">
                                        <c:forEach items="${sessionScope.daoSpecialty.specialty}" var="s">
                                            <li class='${s.id == sessionScope.specId ? 'active' : ''}' >
                                                <a href="${pageContext.request.contextPath}/LoadServicesServlet?id=${s.id}">${s.specialtyName}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div> 
                                <!--Ens single sidebar--> 
                                
                                <!--Start single sidebar-->
                                <div class="single-sidebar">
                                    <div class="title">
                                        <h3>Opening Hours</h3>    
                                    </div>
                                    <ul class="opening-time">
                                        <li>Mon to Friday: <span>09.00 to 18.00</span></li>
                                        <li>Saturday: <span>10.00 to 16.00</span></li>
                                        <li>Sunday: <span>10.00 to 14.00</span></li>
                                    </ul>
                                </div> 
                                <!--Ens single sidebar--> 

                            </div>    
                        </div>

                    </div>
                </div>
            </section>
            <!--End Medical Departments area--> 

            <%@ include file="../Footer/DefaultFooter.jsp" %>


        </div>
        <!--Scroll to top-->
        <div class="scroll-to-top scroll-to-target" data-target="html"><span class="flaticon-triangle-inside-circle"></span></div>

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
        <script>
            function scrollToMiddle(event, id) {
                event.preventDefault();
                const el = document.getElementById(id);
                if (el) {
                    el.scrollIntoView({
                        behavior: "smooth",
                        block: "center"
                    });
                }
            }
        </script>
    </body>
</html>
