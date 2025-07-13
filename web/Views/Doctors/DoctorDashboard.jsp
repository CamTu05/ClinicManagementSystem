<%-- 
    Document   : HomePage
    Created on : Jul 7, 2025, 3:58:43 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
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
            <%@ include file="/Views/Common/Header/DefaultHeader.jsp" %>
            <%@ include file="/Views/Common/Navbar/DefaultNavbar.jsp" %>

            <div class="sidebar-inner" data-simplebar>                
                <div id="sidebar-menu" class="sidebar-menu">
                    <ul>
                        <li class="menu-title"><span>Main Menu</span></li>
                        <li>
                            <ul>
                                <li class="active">
                                    <a href="doctor-dashboard.html">
                                        <i class="ti ti-layout-dashboard"></i><span>Dashboard</span>
                                    </a>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);">
                                        <i class="ti ti-calendar-check"></i><span>Appointments</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="doctors-appointments.html">Appointments</a></li>
                                        <li><a href="online-consultations.html">Online Consultations</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="doctors-schedules.html">
                                        <i class="ti ti-clock-check"></i><span>My Schedule</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="doctors-prescriptions.html">
                                        <i class="ti ti-prescription"></i><span>Prescriptions</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="doctors-leaves.html">
                                        <i class="ti ti-calendar-x"></i><span>Leave</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="doctors-reviews.html">
                                        <i class="ti ti-star"></i><span>Reviews</span>
                                    </a>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);">
                                        <i class="ti ti-settings"></i><span>Settings</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="doctors-profile-settings.html">Profile Settings</a></li>
                                        <li><a href="doctors-password-settings.html">Change Password</a></li>
                                        <li><a href="doctors-notification-settings.html">Notifications</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>

                    </ul>                   
                </div>
                <div class="sidebar-footer border-top mt-3">
                    <div class="trial-item mt-0 p-3 text-center">
                        <div class="trial-item-icon rounded-4 mb-3 p-2 text-center shadow-sm d-inline-flex">
                            <img src="assets/img/icons/sidebar-icon.svg" alt="img">
                        </div>
                        <div>
                            <h6 class="fs-14 fw-semibold mb-1">Upgrade To Pro</h6>
                            <p class="fs-13 mb-0">Check 1 min video and begin use Preclinic like a pro</p>
                        </div>
                        <a href="javascript:void(0);" class="close-icon shadow-sm"><i class="ti ti-x"></i></a>
                    </div>
                </div>
            </div>
























            <%@ include file="/Views/Common/Footer/DefaultFooter.jsp" %>

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
        <script>function scrollToMiddle(event, id) {
                event.preventDefault();
                const el = document.getElementById(id);
                if (el) {
                    el.scrollIntoView({
                        behavior: "smooth",
                        block: "center"
                    });
                }
            }

            window.addEventListener('load', function () {
                if (window.location.hash) {
                    const id = window.location.hash.substring(1);
                    const element = document.getElementById(id);
                    if (element) {
                        setTimeout(() => {
                            element.scrollIntoView({
                                behavior: "smooth",
                                block: "center"
                            });

                            // Xóa hash khỏi URL sau khi cuộn
                            setTimeout(() => {
                                history.replaceState(null, null, window.location.pathname);
                            }, 1000);
                        }, 100);
                    }
                }
            });

            window.addEventListener('DOMContentLoaded', () => {
                // Nếu không có #id trong URL => scroll lên đầu
                if (!window.location.hash) {
                    window.scrollTo({top: 0, behavior: 'smooth'});
                }
            });</script>

    </body>
</html>
