<%-- 
    Document   : LanTT
    Created on : Jul 10, 2025, 2:00:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



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

        <link rel="stylesheet" href="css/doctorStyle.css"/>

        <style>
            .star-group {
                display: inline-flex;
                flex-direction: row-reverse;          /* đảo thứ tự để tô sao từ trái qua phải */
                gap: 4px;
                font-size: 24px;
                cursor: pointer;
            }
            .star-group input {
                display: none;                        /* ẩn radio gốc */
            }
            .star-group label {
                color: #ccc;                          /* sao rỗng */
                transition: color 0.2s;
            }
            .star-group input:checked ~ label,
            .star-group label:hover,
            .star-group label:hover ~ label {
                color: #f5b50a;                       /* sao vàng khi hover/chọn */
            }

            .pill-rating {
                display: inline-flex;
                gap: .25rem;
            }
            .pill-rating input {
                display: none;
            }

            .pill-rating label {
                padding: .4rem .8rem;
                border: 1px solid #ddd;
                border-radius: 999px;
                cursor: pointer;
                background: #f8f8f8;
                transition: background .2s, color .2s, border-color .2s;
            }
            .pill-rating input:checked + label,
            .pill-rating label:hover {
                background: #FFB400;
                border-color: #FFB400;
                color: #fff;
            }

        </style>

        <!-- Fixing Internet Explorer-->
        <!--[if lt IE 9]>
            <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
            <script src="js/html5shiv.js"></script>
        <![endif]-->
    </head>

    <body style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0;">
        <c:if test="${not empty message}">
            <script>alert("${fn:escapeXml(message)}");</script>
        </c:if>

        <div class="layout-bar">
            <%@ include file="/Views/Common/Header/DefaultHeader.jsp" %>
            <%@ include file="/Views/Common/Navbar/DefaultNavbar.jsp" %>
        </div>
        <br/>

        <!-- CARD -->
        <section class="card">
            <div class="doctor-info">
                <img src="${pageContext.request.contextPath}/images/team/${d.picture}" alt="Ảnh bác sĩ">
                <div>
                    <div class="doctor-name">${d.fullName}</div>
                    <p class="doctor-meta"><strong>Chuyên khoa:</strong> ${d.specialtyName}</p>
                    <p class="doctor-meta"><strong>Kinh nghiệm:</strong> ${d.yearsExperience}</p>
                    <p class="doctor-meta"><strong>Email:</strong> ${d.email}</p>


                    <div class="rating">
                        <span class="stars" style="--rating: 4.0;"></span>
                        <span style="color: #f5b50a;">&#9733;</span>
                        Rating: ${d.avgRating}/5
                    </div>

                    <div class="schedule">${d.schedule}</div>
                </div>
            </div>

            <div class="feedback-form">
                <br/>
                <h3>Gửi phản hồi của bạn</h3>
                <form action="DoctorIndividualServlet" method="post">
                    <input type="hidden" name="DoctorId" value="${d.doctorId}">

                    <!-- Comment -->
                    <textarea name="comment" placeholder="Nhập phản hồi của bạn..." required></textarea>

                    <div class="pill-rating" role="radiogroup">
                        <input type="radio" id="p1" name="rating" value="1" required>
                        <label for="p1">1</label>

                        <input type="radio" id="p2" name="rating" value="2">
                        <label for="p2">2</label>

                        <input type="radio" id="p3" name="rating" value="3">
                        <label for="p3">3</label>

                        <input type="radio" id="p4" name="rating" value="4">
                        <label for="p4">4</label>

                        <input type="radio" id="p5" name="rating" value="5">
                        <label for="p5">5</label>
                    </div>
                    <br/>
                    <button type="submit" name="btnSubmit" value="oke">Gửi phản hồi</button>
                </form>
            </div>

            <div class="feedback-list">
                <br/>
                <h3>Phản hồi từ bệnh nhân</h3>
                <c:forEach var="f" items="${feedbacks}">
                    <div class="feedback-item">
                        <div class="feedback-header">
                            <div class="avatar">${f.initial}</div>
                            <span class="author">${f.patient_name}</span>
                            <span class="date">${f.feedback_date}</span>
                        </div>
                        <div class="feedback-content">
                            ${f.comment}
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>

        <!-- Phone -->
        <div class="phone-bar">
            <div class="phone-icon">☎</div>
            <div class="phone-number">${d.phone}</div>
        </div>

        <div class="layout-bar">
            <%@ include file="/Views/Common/Footer/DefaultFooter.jsp" %>
        </div>
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
